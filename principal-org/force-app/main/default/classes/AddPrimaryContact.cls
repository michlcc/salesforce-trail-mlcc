public class AddPrimaryContact  implements Queueable{
	private Contact contato;
    private String stateAbbreviation;
    
    public AddPrimaryContact(Contact contato, String stateAbbreviation){
        this.contato = contato;
        this.stateAbbreviation = stateAbbreviation;
    }
    
    public void execute(QueueableContext contexto){
     	List<Account> contas = [SELECT Id, BillingState FROM Account WHERE BillingState =: stateAbbreviation limit 200];
        
        List<Contact> contatos = new List<Contact>();
        for(Account acc : contas){
            Contact c = contato.clone(false,false,false,false);
            c.AccountId = acc.Id;
        
            contatos.add(c);
        }
        
        insert contatos;        
    }
}