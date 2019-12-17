trigger trigger2 on Account (before insert, before update) {
if(trigger.isInsert){
      for(Account acc : Trigger.new){
       Map<Id, String> userDetails = new Map<Id, String>();
      userDetails.put(acc.OwnerId,'VSingh');
      acc.Sales_Rep__c = userDetails.get(acc.OwnerId);
     } }
else{
       for(Account accountOld : Trigger.old){
      for(Account accountNew : Trigger.new){
       if(accountOld.OwnerId != accountNew.OwnerId){
        for(Account acc : Trigger.new){
      Map<Id, String> userDetails = new Map<Id, String>();
      userDetails.put(acc.OwnerId,'VSingh');
      acc.Sales_Rep__c = userDetails.get(acc.OwnerId);
      }
      }
      }
      }
      }
      }