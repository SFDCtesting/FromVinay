@isTest 
public with sharing class TestApplication {
    
    @isTest
     static void tesCalloutForApp() {
        Test.setMock(HttpCalloutMock.class, new TestApplicationMock());
        String result = AnimalLocator.getAnimalNameById(1);
        String expectedResult = '{"attributes":{"type":"Account","url":"/services/data/v42.0/sobjects/Account/0017F00000hGn6XQAS"},"Name":"AAAAAAAAAAAAAAAAAAA","Match_Billing_Address__c":false,"Id":"0017F00000hGn6XQAS"}';
        System.assertEquals(result,expectedResult);
       }
}