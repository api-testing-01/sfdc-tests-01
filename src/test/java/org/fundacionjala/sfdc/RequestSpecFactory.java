package org.fundacionjala.sfdc;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Supplier;

import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import org.fundacionjala.sfdc.core.Environment;

public final class RequestSpecFactory {

    private static final Environment ENV = Environment.getInstance();

    private RequestSpecFactory() {
    }

    private static RequestSpecification getRequestSpecSFDC(final String account) {
        Response response = RestAssured.given()
                .param("grant_type", "password")
                .param("client_id", ENV.getValue(String.format("sfdc.credentials.%s.clientId", account)))
                .param("client_secret", ENV.getValue(String.format("sfdc.credentials.%s.clientSecret", account)))
                .param("username", ENV.getValue(String.format("sfdc.credentials.%s.userName", account)))
                .param("password", ENV.getValue(String.format("sfdc.credentials.%s.password", account))
                        .concat(ENV.getValue(String.format("sfdc.credentials.%s.securityToken", account))))
                .when()
                .post("https://login.salesforce.com/services/oauth2/token");

        RequestSpecification requestSpecification = new RequestSpecBuilder()
                .setBaseUri(response.jsonPath().getString("instance_url").concat("/services/data/v39.0"))
                .addHeader("Authorization", "Bearer " + response.jsonPath().getString("access_token"))
                .build();
        return requestSpecification
                .log().method()
                .log().uri()
                .log().params()
                .log().body();
    }

    private static Map<String, Supplier<RequestSpecification>> getRequestSpecMap(final String account) {
        Map<String, Supplier<RequestSpecification>> requestSpecMap = new HashMap<>();
        requestSpecMap.put("sfdc", () -> getRequestSpecSFDC(account));
        return requestSpecMap;
    }

    public static RequestSpecification getRequestSpec(final String serviceName, final String account) {
        return getRequestSpecMap(account).get(serviceName).get();
    }

}

