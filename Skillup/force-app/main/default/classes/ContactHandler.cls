public class ContactHandler {
public static void createContactsForNewAccount(List<Account> accountList){
        List<Contact> contactList = new List<Contact>();
        
        for(Account accountObject : accountList){
            
            if(accountObject.Number_of_Contacts__c != 0){
                for(Integer incr = 1; incr <= accountObject.Number_of_Contacts__c; incr++){
                    Contact contactObject =  new Contact();
                    contactObject.AccountId = accountObject.Id;
                    contactObject.LastName = 'Test Contact ' + incr;
                    contactList.add(contactObject);
                }
            }
            
        }   
        Upsert contactList;
    }
    
    public static void createContactsForOldAccount(List<Account> listOfAccount){
       
        List<Contact> contactListAdd = new List<Contact>(); 
        
        for(Account accountObject : listOfAccount){
            
            List<AggregateResult> contactCount = [SELECT Count(Id) ContactCount FROM Contact WHERE AccountId =: accountObject.Id];
            Integer numberOfContacts = (Integer) contactCount[0].get('ContactCount');
            Contact contactObject =  new Contact();
           
            if(accountObject.Number_of_Contacts__c != 0 && accountObject.Number_of_Contacts__c > numberOfContacts){
                for(Integer incr = 1; incr <= (accountObject.Number_of_Contacts__c - numberOfContacts); incr++){
                    
                    contactObject.AccountId = accountObject.Id;
                    contactObject.LastName = 'Test Contact ' + incr;
                    contactListAdd.add(contactObject);
                }
                
            }
            
        }   
        Insert contactListAdd;
        
        
    }
}