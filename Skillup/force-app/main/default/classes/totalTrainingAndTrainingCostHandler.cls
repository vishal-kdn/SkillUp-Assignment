public class totalTrainingAndTrainingCostHandler {
  
    public static void countAndCostEstimate ( List<Trainee__c> TraineeList ) {
        
            if ( TraineeList.size() > 0 ) {
                
                System.debug ( 'list of trainee ' + TraineeList );
                
                Set<Id> contactSet = New Set<Id>();
                List<AggregateResult> ContactList = new List<AggregateResult>();
                List<Contact> ContactListUpdate = new List<Contact>();
                
                     for ( Trainee__c t : TraineeList ){
                         if ( t.Contact__c != Null ) 
                            contactSet.add ( t.Contact__c ) ;
                 
                }
                
                ContactList = [ SELECT Contact__c, Sum(Course_cost__c) TotalFee, Count(Id) CountOfContact
                               FROM Trainee__c WHERE Contact__c IN:contactSet GROUP BY Contact__c ];
                
                if( ContactList.size()>0 ){
                    System.debug( 'total contact ' + ContactList );
                    for( AggregateResult agr : ContactList ) 
                    {
                        Contact con = New Contact();
                        con.Id = ( String ) agr.get ( 'Contact__c' );
                        con.Total_Training__c = ( Integer ) agr.get ( 'CountOfContact' );
                        con.Total_Training_Cost__c = ( Double ) agr.get ( 'TotalFee' );
                        ContactListUpdate.add ( con );
                    }
                    
                }
                if( ContactListUpdate.size() > 0 )
                    system.debug( 'updatelist '+ ContactListUpdate );
                    Update ContactListUpdate;                
            }
    }
}