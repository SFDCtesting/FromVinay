public class ContactSearch {

    public static  List<Contact> searchForContacts(String first, String second)
    {
     List<Contact> cc = [SELECT  Id,Name FROM Contact
                   WHERE (LastName =:first AND MailingPostalCode =:second)];
System.debug(cc.size() + ' contact(s) returned.');
// Write all account array info
System.debug(cc);
        
        return cc;
    }
}