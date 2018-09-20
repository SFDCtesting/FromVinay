public class ContactAndLeadSearch {
@AuraEnabled
    public static List<Contact> searchContactsAndLeads(){
          return [Select id, Name from Contact where ownerId=:UserInfo.getUserId()];  
   
    }
}