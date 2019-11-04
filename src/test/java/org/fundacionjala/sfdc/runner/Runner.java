package org.fundacionjala.sfdc.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        glue = {"org.fundacionjala.sfdc"},
        features = "src/test/resources/features",
        plugin = "pretty"
)
public class Runner extends AbstractTestNGCucumberTests {
}