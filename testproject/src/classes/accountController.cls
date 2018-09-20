public with sharing class accountController 
{
    private ApexPages.StandardSetController standardController;
    public AccountController(ApexPages.StandardSetController standardController)
    {
        this.standardController = standardController;
    }

 public PageReference GetSelectedAccount()
    {  
        List<Account> selectedAccounts = (List<Account>) standardController.getSelected(); 
        List<Account> selectedAccountsDetails=[SELECT Type, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, Phone, Fax, AccountNumber, Website, Sic, Industry, AnnualRevenue, NumberOfEmployees, TickerSymbol, Ownership, Description, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c, Match_Billing_Address__c FROM Account where id=:selectedAccounts];
        system.debug(selectedAccountsDetails);
         
        for(Account a:selectedAccountsDetails){
                //a.External_Id__c=a.Id;
           // System.debug('.............ext..'+a.External_Id__c+'.............');
            //System.debug('................a.id..'+a.Id+'......');
          String idPart=',"Id":"'+a.Id+'"';
            
            String data=JSON.serialize(a);
            //String data=(String)a;
            System.debug('.........data...'+data);
             //String datatoSend= data.remove(idPart);
            String datatoSend= data.remove(idPart);
            System.debug('.........datatosend...'+datatoSend);
            meth(datatoSend);
             System.debug('.........datatosend...'+datatoSend);
              System.debug('.........datatosend...'+datatoSend);
                System.debug('.........datatosend...'+datatoSend);
              System.debug('.........datatosend...'+datatoSend);  
              System.debug('.........datatosend...'+datatoSend);
              
           // a.Id=null;
        }
                //String data=(String)a;
                //String idPart='"Id":"'+a.Id+'",';
            
              
          //String data=JSON.serialize(selectedAccountsDetails);
          //System.debug('..............ser1....'+data);
          //String datatoSend= data.remove(idPart);
         // System.debug('.... id part...'+idPart);
            //
            
              // String data1=JSON.serialize(selectedAccounts);
               //String datatoSend1= data1.remove(idPart);
            
        //System.debug('..............ser2....'+data);
            //System.debug('id part-----'+data1+'-----------object output--------');
                //meth(data);
     
        return null;   
    }
    
    
 public void meth(String jsonstr1){
     
String clientId = '3MVG9d8..z.hDcPLnA7oEH53dekwkgCQ6pffX_u0Xw7HgUE3cO_naqRmNL0c2pYm_jh99ORWi58o7pEZDC7rx';
String clientSecret = '7763307931064157349';
String username='vinaykumar.s@brillio.com';
String password='vinaykumars933qkLrgV1GTLd0PiPaW0iMVW6s';
     String URL='/services/data/v41.0/sobjects/account';

     String jsonstr='';
     jsonstr=jsonstr1;
  
   HttpRequest req = new HttpRequest();



String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;

Http h = new Http();
//HttpRequest req = new HttpRequest();
req.setBody(reqbody);

req.setMethod('POST');
req.setEndpoint('https://login.salesforce.com/services/oauth2/token');//Note if my domain is set up use the proper domain name else use login.salesforce.com for prod or developer or test.salesforce.com for sandbox instance

HttpResponse res = h.send(req);

OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);
//RequestWrapper reqst=new RequestWrapper();
//List<OAuth2> objAuthenticationInfo = (List<OAuth2>)JSON.deserialize(res.getbody(), List<OAuth2>.class);

if(objAuthenticationInfo.access_token!=null){

  Http h1 = new Http();
  HttpRequest req1 = new HttpRequest();
  req1.setHeader('Authorization','Bearer '+objAuthenticationInfo.access_token);
  req1.setHeader('Content-Type','application/json');
  req1.setHeader('accept','application/json');
  //System.debug('.......................JSON....................'+jsonstr);
  req1.setBody(jsonstr);//Send JSON body
  req1.setMethod('POST');
  req1.setEndpoint(objAuthenticationInfo.instance_url+URL);//URL will be your Salesforce REST API end point where you will do POST,PUT,DELETE orGET
  HttpResponse res1 = h1.send(req1);
    System.debug(res1);
    
   // String st = res.getBody();
    
//List<Account> accounts = (List<Account>) JSON.deserialize(st,List<Account>.class);
 System.debug('RESPONSE_BODY'+res1.getBody());

       
  }  

}
}