@IsTest
public class AccountManagerTest {
    
	@isTest static void testGetAccount() {        
        Account accTest = new Account(Name='Test acc');
        insert accTest;
        Contact con1 = new Contact(FirstName='T1 PrimeiroNome',LastName='SegundoNome',AccountId=accTest.Id);
        Contact con2 = new Contact(FirstName='T2 PrimeiroNome',LastName='SegundoNome',AccountId=accTest.Id);
        List<Contact> contatos = new List<Contact>();
        contatos.add(con1);
        contatos.add(con2);
        insert contatos;
        
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Account/'
            + accTest.Id;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAcc = AccountManager.getAccount();
        System.assert(thisAcc != null);
        System.assertEquals('Test acc', thisAcc.Name);
    }
}