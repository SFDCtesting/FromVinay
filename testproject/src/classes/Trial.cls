public class Trial {

    public static void Meth()
    {
   List<List<SObject>> searchList = [FIND 'SFDC' IN ALL FIELDS 
       
                                     RETURNING Account(Name), Contact(FirstName,LastName)];
    System.debug(searchlist);
    }
}