public class NewCaseListController {

    public List<Case> getNewCases() {
    
    List<Case> results = [SELECT ID,CaseNumber FROM CASE WHERE Status='New'];
    return results;
}
}