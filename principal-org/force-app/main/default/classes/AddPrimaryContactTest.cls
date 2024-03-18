@isTest
public class AddPrimaryContactTest {
	
    @testSetup
    static void setup(){
        
        List<Account> contas = new List<Account>();
        for(Integer i=1; i<=100 ; i++){
            if(i<=50)
				contas.add(new Account(Name='conta'+i, BillingState='CA'));
            else
    			contas.add(new Account(Name='conta'+i, BillingState='NY'));
        }      
        insert contas;      
    }
    static testmethod void testQueueable_CriacaoDeContatoComEstadoYAeCA(){
        
        Contact contatoPrimario = new Contact(FirstName='contato',LastName='primario');
        AddPrimaryContact addContatoPrimario = new AddPrimaryContact(contatoPrimario,'CA');
        
        Test.startTest();
        System.enqueueJob(addContatoPrimario);
        Test.stopTest();
        System.assertEquals(50, [select count() from Contact where Account.BillingState='CA']);
    }
}