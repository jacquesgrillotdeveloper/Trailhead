@isTest
public with sharing class AddPrimaryContactTest {
    static testMethod void AddPrimaryContactTest() {
        // Declare a list for test accounts
        List<Account> testAccts = new List <Account>();

        //In the test class, insert 50 Account records for BillingState "NY" and 50 Account records for BillingState "CA". 
        for(Integer i=0;i<50;i++)
        {
            testAccts.add(new Account(Name='Test '+i, BillingState='CA'));
        }
        for(Integer n=0;n<50;n++){
            testAccts.add(new Account(Name='Test '+n, BillingState='NY'));
        }
        insert testAccts;

        Contact co = new Contact(LastName = 'TestLast');
        String state ='CA';

        //Create an instance of the AddPrimaryContact class, enqueue the job 
        AddPrimaryContact apc = new AddPrimaryContact(co, state);
        
        Test.startTest();
            //  enqueue the job and assert that a Contact record was inserted for each of the 50 Accounts with the BillingState of "CA".
            System.enqueueJob(apc);
        	//System.assertEquals(50, [SELECT COUNT() FROM Account WHERE BillingState = :state]);
            //System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE accountId IN (SELECT Id FROM Account WHERE BillingState = :state)]);
        Test.stopTest();
    }
}