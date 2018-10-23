public class AccountProcessor {
    // Create a method to process a list of accounts to update the Contact count field 
    @future
    public static void countContacts(List<Id> recordIds) {
        // Create a list for the accounts and query the count field and count the number of Contact child records
        List<Account> accts = [SELECT Id, Number_of_Contacts__c,(SELECT Id FROM Contacts) 
                                  FROM Account WHERE Id IN :recordIds];
        // For each Account ID passed to the method, count the number of Contact records associated to it and update the 'Number_of_Contacts__c' field with this value.
        for (Account acct : accts){
            //Create a list of contact records based on the contacts in the account record
            List<Contact> cntcts = acct.contacts;
            // Set the Number of Contacts field to the size of the list
            acct.Number_of_Contacts__c = cntcts.size();
        }
        // Update the account records
        update accts;
    }
}