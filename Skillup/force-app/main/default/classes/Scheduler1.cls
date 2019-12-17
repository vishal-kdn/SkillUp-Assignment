global class Scheduler1 implements Schedulable {
    global void execute(SchedulableContext SC){
        AsyncApex a  = new AsyncApex();
        database.executeBatch(a);
        String sch = '0 41 2 * * ?';
        System.schedule('AsyncApex' , sch , new Scheduler1());
    }
}