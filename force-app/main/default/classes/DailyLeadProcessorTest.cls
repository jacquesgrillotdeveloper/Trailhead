@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression - executes immediately after stop test
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testMethod void testScheduledJob(){
        // Create 200 Test Lead records
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++){
            Lead l = new Lead(
                LastName = 'Lead ' +i,
                Company = 'Company '+i, 
                Status = 'Open - Not Contacted'
            );
            // Add lead to list
            leads.add(l);
        }
        // Save list
        insert leads;
        
        //Create a map to link the CRON job Id to the records
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leads);
        List<Id> leadIds = new List<Id>(leadMap.keySet());
        
        Test.startTest();
            //Schedule CRON job to execute DailyLeadProcessor class
            String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
            //Declare a list to validate that no records have been set to "Dreamforce"
            List<Lead> ll = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
            System.assertEquals(0, ll.size(),'Leads are updated before job execution');
        Test.stopTest();
        //After stop test, CRON job executes; now list should have 200 records
        ll = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(leadIds.size(), ll.size());
    }
}