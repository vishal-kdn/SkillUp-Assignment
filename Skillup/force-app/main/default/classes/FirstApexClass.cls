public with sharing class FirstApexClass {
public void insertMultipleAccount() {

List<Account> listOfAccount = new List<Account>();
for (integer i = 1; i<10 ; i++){
Account acc = new Account();
acc.Name = 'Hello ' + i;

listOfAccount.add(acc);
}
insert listOfAccount;
insertMultipleContact(listOfAccount);
}
private void insertMultipleContact(List<Account> acc){
List<Contact> listOfContactInserted = new List<Contact>();
for(Account a : acc){
Contact con = new Contact();
con.AccountId = a.Id;
con.LastName = 'Contact ' + a.Name;
listOfContactInserted.add(con);
}
insert listOfContactInserted;
}
}