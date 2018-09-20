@isTest
global class TestApplicationMock implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest request){
        //Create Fake Response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json;charset=UTF-8');//
        response.setStatusCode(200);
        response.setBody('{"attributes":{"type":"Account","url":"/services/data/v42.0/sobjects/Account/0017F00000hGn6XQAS"},"Name":"AAAAAAAAAAAAAAAAAAA","Match_Billing_Address__c":false,"Id":"0017F00000hGn6XQAS"}');
        return response;
   }

}