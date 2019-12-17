public class ApexDemoCode {

/*   public ApexDemoCode(){
        string s = 'Apex';
       boolean verify = true;
       Integer num = 9;
       Decimal decimal_num = 3.0;
        System.debug(s);
       System.debug(verify);
       System.debug(num);
       System.debug(decimal_num);
      
    }*/
    public void test1(string lname){
       Contact c = new Contact();
c.LastName = lname;
Insert c;
System.debug(c.LastName);

    }
}