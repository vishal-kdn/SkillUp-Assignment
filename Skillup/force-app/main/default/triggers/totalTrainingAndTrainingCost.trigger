trigger totalTrainingAndTrainingCost on Trainee__c (after insert, before insert, after  update, after delete) {
      if ( Trigger.isAfter ) {
            if ( Trigger.isInsert || Trigger.isUpdate ||Trigger.isDelete )  {
                      totalTrainingAndTrainingCostHandler.countAndCostEstimate(Trigger.New);
            }
      }
      
}