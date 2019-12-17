global class AsyncApex implements Database.Batchable<sobject>{
    //Start
    global Database.QueryLocator start(Database.BatchableContext BC){
       String query = 'SELECT Id, Name, OwnerId, Next_Catch_Up__c FROM Account WHERE Next_Catch_Up__c != null';
       return Database.getQueryLocator(query);
       
    }
    //Execute
    global void execute(Database.BatchableContext BC, List<Account> scope){ 
        System.debug('scope--'+scope);
        List<Task> tlist = new List<Task>();
        for(Account a : scope){
               	Task t = new Task();
                t.Subject = 'Meeting 1';
                t.Status = 'InProgress';
                t.Priority ='Urgent';
                t.Description = 'You hava a catch up with your manager at ' + a.Next_Catch_Up__c.format('HH:mm');
                t.WhatId = a.ID;
                t.OwnerId = a.OwnerId;
                tlist.add(t);
        }
            insert tlist;
    
    
    }//Finish
    global void finish(Database.BatchableContext BC){
        
    }
}