package org.fundacionjala.sfdc.core.cucumber.hooks;

import io.cucumber.java.After;
import io.restassured.specification.RequestSpecification;
import org.fundacionjala.sfdc.core.JsonHelper;
import org.fundacionjala.sfdc.core.ScenarioContext;
import org.fundacionjala.sfdc.core.api.RequestManager;

import java.util.List;

public class CommonHook {

    private ScenarioContext context;

    public CommonHook(final ScenarioContext context) {
        this.context = context;
    }

    @After(value = "@cleanData")
    public void afterScenario() {
        RequestSpecification requestSpec = (RequestSpecification) context.get("REQUEST_SPEC");
        List<String> endpoints = context.getEndpoints();
        for (String endpoint : endpoints) {
            RequestManager.delete(requestSpec, endpoint);
        }
    }
    @After(value = "@cleanGroups")
    public void afterGroupsScenario() {
        System.out.println("\n Beginning afterGroupsScenario");
        RequestSpecification requestSpec = (RequestSpecification) context.get("REQUEST_SPEC");
        String endpoint = context.get("LAST_ENDPOINT").toString();
        System.out.println("\n REQUEST_SPEC  :: " + context.get("REQUEST_SPEC").toString());
        System.out.println("\n G :: " + context.get("g").getClass().toString());
        System.out.println("\n Endpoint :: " + endpoint);
        System.out.println("\n Response :: "+ context.get("LAST_RESPONSE").toString());
        RequestManager.delete(requestSpec, endpoint);
        System.out.println("\nEnd afterGroupsScenario");
    }
}
