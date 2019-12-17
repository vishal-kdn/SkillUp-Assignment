public class OlderAccountsUtility {
    public static void updateOlderAccounts(){
        Account [] acc = new Account[]{};
            acc = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
         
        for (Account acct : acc){
            acct.Description = 'TEST DESCRIPTION';
        }
        update acc;
            }
   
       /*  public static void updateOlderAccounts() {
      Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
      for (Account acct : oldAccounts) {
          acct.Description = 'Heritage Account';
      }
      update oldAccounts;
      System.debug(oldAccounts);       
    }    */
    }