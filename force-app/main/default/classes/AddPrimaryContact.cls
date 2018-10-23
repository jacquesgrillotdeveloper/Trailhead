public class AddPrimaryContact implements Queueable {
    private Contact c;
    private String stateCode;
    
    public AddPrimaryContact(Contact c, String stateCode){
        this.c = c;
        this.stateCode = stateCode;
    }

    public void execute(QueueableContext context) {
        List<Account> ListAccount = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts)
                                    FROM Account
                                    WHERE BillingState = :stateCode LIMIT 200];
        List<Contact> listContact = new List <Contact>();
        
        for (Account acct : ListAccount){
            Contact cont = c.clone(false,false,false,false);
            cont.AccountId = acct.Id;
            listContact.add(cont);
        }

        if(listContact.size() > 0){
            insert listContact;
        }
    }
}