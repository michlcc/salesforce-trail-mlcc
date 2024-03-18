@isTest
public class LeadProcessorTest {

	@testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            leads.add(new Lead(FirstName = 'nome'+i, LastName = 'sobrenome'+1, Company='empresa'+i));
        }
        insert leads;
    }
    @isTest static void testBatch(){
    	Test.startTest();
            LeadProcessor ldB = new LeadProcessor();
            Id batchId = Database.executeBatch(ldB);
        Test.stopTest();
        System.assertEquals(10, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}