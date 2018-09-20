public class AccountHandler {
    public static Account insertNewAccount(String ss){
   Account acct = new Account();
        try
        {
            acct.Name = ss;
      //Insert the account by using DML
             insert acct;
             return acct;  
        }
         catch (DmlException e) {
        System.debug('A DML exception has occurred: ' +
                e.getMessage());
             return null;
}
    
    }
    
}