package org.fundacionjala.sfdc.core.cucumber.hooks;

import io.cucumber.java.After;
import io.restassured.specification.RequestSpecification;
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
}
