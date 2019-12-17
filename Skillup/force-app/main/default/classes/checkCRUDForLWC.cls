public class checkCRUDForLWC {
    @AuraEnabled
    public static Trainee__c createTraineeRecord(Id courseId, Id contactId){
        Trainee__c traineeObject = new Trainee__c();
        Contact contactObj = [SELECT NAME, Email FROM Contact WHERE Id =: contactId];
        //Contact conObject = new Contact();
        traineeObject.Course__c = courseId;
        traineeObject.Contact__c = contactId;
        traineeObject.Name = contactObj.Name;
        traineeObject.E_mail__c=contactObj.Email;
        //traineeObject.Corporation__c = conObject.AccountId;
      //  if(isCreateable('Trainee__c')==true){
            insert traineeObject;
            return traineeObject;
      //  }
      //  return null;
    }
    public static Boolean isCreateable(String sObjectType){
        SObjectType schemaType = Schema.getGlobalDescribe().get(sObjectType);
        return schemaType.getDescribe().isCreateable();
    }
}