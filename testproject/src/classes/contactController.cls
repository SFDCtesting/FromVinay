public with sharing class contactController {
    @AuraEnabled
    public static List<Contact> meth(){
        return [Select id, Name from Contact where ownerId=:UserInfo.getUserId()];
    }
}