/*public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
        String animalName = '';
        //New Http 'GET' Request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setMethod('GET');
        //Get response
        HttpResponse response = Http.send(request);
        //Parse JSON from the response body
        JSONParser parser = JSON.createParser(response.getBody());
        while (parser.nextToken() != null) {
            // Read entire JSON object
            if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                AnimalLocator.AnimalList animalList = (AnimalLocator.AnimalList) parser.readValueAs(AnimalLocator.AnimalList.class);
                System.debug(animalList.animal.size());
                //Sort through the list of animals to find one with the matching ID
                //Set the animal name
                for (Integer i = 0; i < animalList.animal.size() ; i++) {
                    if (animalList.animal[i].id == id){
                        animalName = animalList.animal[i].name;
                        System.debug('.......name......'+animalName);
                        break;
                    }
                }

            }
        }
        return animalName;
    }

    public class AnimalList {
        public List<animal> animal; //This has to be the same name thats in the JSON file.
    }

    //animal Object Wrapper
    public class animal {
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }

}*/

public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HTTPRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        String str = '';
        
        //If the response is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //Map<String, Object> animalInfo= (Map<String, Object>) animals.get('animal');
            List<Object> animals = (List<Object>) results.get('animal');
            System.debug(animals);
            //Object myAnimal = (Object) animals.get('name');
           // str=(String) animals.get('name');
   }   // end if
        //System.debug(strRes);
        return str;
    }   // end method
}   // end class