@isTest
private class LeadProcessorTest {
	@testSetup
    static void setup(){
        List <Lead> testLeads = new List<Lead>();
        // Insert 200 Leads
        for (integer i=0; i<200; i++){
            testLeads.add(new Lead(
                LastName='Lead '+i, 
                Company = 'Company '+i, 
                Status = 'Open - Not Contacted'));
        }
        insert testLeads;
    }
    static testMethod void test() {
        Test.startTest();
        	LeadProcessor lp = new LeadProcessor();
        	Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource ='Dreamforce']);
    }
}