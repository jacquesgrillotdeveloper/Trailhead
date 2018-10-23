global class LeadProcessor implements 
Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        //collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead'
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List <Lead> leads = new List<Lead>();
        for (Lead lead : scope){
            lead.LeadSource = 'Dreamforce';
            leads.add(lead);
        }       
        update leads;
    }
        
    global void finish(Database.BatchableContext bc){
       //don't really need anything
    }
    
}