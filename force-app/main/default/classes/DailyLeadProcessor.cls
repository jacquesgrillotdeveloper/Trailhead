global class DailyLeadProcessor implements Schedulable {
    //Create an Apex class called 'DailyLeadProcessor' that uses the Schedulable interface
    global void execute(SchedulableContext ctx){
        //The execute method must find the first 200 Leads with a blank LeadSource field and update them with the LeadSource value of 'Dreamforce'.
        List <Lead> blankLeads = [SELECT Id, LeadSource
                                 FROM Lead
                                 WHERE LeadSource = null];
        // Declare a new list to store the updated values
        List<Lead> updateLeads = new List <Lead>();
        // iterate through the blank leads and add to the update leads list
        for (Lead lead : blankLeads){
            lead.LeadSource = 'Dreamforce';
            updateLeads.add(lead);
        }       
        // update the lead records
        update updateLeads;
    }

}