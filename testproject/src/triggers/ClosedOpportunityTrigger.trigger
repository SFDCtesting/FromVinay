trigger ClosedOpportunityTrigger on Opportunity (before insert, before update)

{

    List<Task> stTask = new List<Task>();

  if((Trigger.isInsert && Trigger.isBefore)||(Trigger.isUpdate && Trigger.isBefore))

    {

      for(Opportunity objOpportunity : Trigger.New) 

      {

            //check opp stage Name

          if(objOpportunity.StageName == 'Closed Won')

          {

                Task objTask = new Task(Subject = 'Follow Up Test Task', WhatId = objOpportunity.Id);
              stTask.add(objTask);

          }

      }

       insert stTask;

    }
    
    

}