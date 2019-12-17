global class LastMonthDueReminder implements Schedulable {
 global void execute(System.SchedulableContext sc){
        
        calculateLastMonthDues accountLastMonthDueJob = new calculateLastMonthDues();
        Database.executeBatch(accountLastMonthDueJob);
        
    }
}