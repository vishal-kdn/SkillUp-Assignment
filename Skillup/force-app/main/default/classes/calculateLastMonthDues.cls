global class calculateLastMonthDues implements Database.Batchable<sObject> {
 
    List<AggregateResult> aggListTrainee = new List<AggregateResult>();
    
    global Database.QueryLocator start( Database.BatchableContext bc ){
      return Database.getQueryLocator ( [
            SELECT Id,Last_Month_Dues__c,
                ( SELECT Id, Name, Email FROM Contacts WHERE IsPrimary__c=true ) 
                        FROM Account WHERE Id IN ( SELECT AccountId FROM Contact WHERE IsPrimary__c=true ) ] );  
    }
    
    
    global void execute(Database.BatchableContext bc, list<Account> scope){
        Set<Id> commonSet= new Set<Id>();
        for(Account accnt : scope)
        {
                if( accnt.Id !=null )
                  commonSet.add(accnt.Id);
        }
        aggListTrainee = [SELECT Corporation__c, Sum(Course_cost__c) Total_Due 
                                                 FROM Trainee__c WHERE Corporation__c IN : commonSet
                                                 GROUP BY Corporation__c ];
        List<Account> accountsListUpdate = new List<Account>();
        for(Account acc : scope) {
            Map<String, Double> mapOfAccountsAndLastMonthDues = new Map<String, Double>();
            
            for(AggregateResult aggResult : aggListTrainee)
            {
                acc.Id = (String) aggResult.get('Corporation__c');
                acc.Last_Month_Dues__c = (Double) aggResult.get('Total_Due');
                accountsListUpdate.add(acc);
            }
        }
        update accountsListUpdate;
    }
    
    
    global void finish(Database.BatchableContext bc){
         List<Contact> ContactsList = [SELECT Id, Email, Name,Account.Last_Month_Dues__c,Account.Name, AccountId FROM Contact 
                                        WHERE IsPrimary__c=true];
        
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        for(Contact cont : ContactsList ) 
        {   
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<String> sendTo = new List<String>();
            sendTo.add(cont.Email);
            mail.setToAddresses(sendTo);
            mail.setSenderDisplayName('Account Last Month Due');
            mail.setSubject('Account Last Month Due !!!');
            String body = 'Hello ' + cont.Name + ',' + '<br>' +
                ' This mail is to provide the information related to '+ cont.Account.Name +' Last Month Due.'
                + 'Your this month due is ' + cont.Account.Last_Month_Dues__c +'<br><br>'+ 
                'Thanks & Regards' + '<br><br>'+'Team SkillUp';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
        
}