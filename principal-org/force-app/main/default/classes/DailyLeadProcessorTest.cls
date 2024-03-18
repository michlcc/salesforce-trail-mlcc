@isTest
private class DailyLeadProcessorTest {
	private static String CRON_EXP = '0 0 0 ? * * *';    
    @isTest static void testScheduledJob(){
		List<Lead> leadsChageSource = new List<Lead>();
        for(integer i=0; i<200; i++){
        	leadsChageSource.add(new Lead(FirstName = 'lead'+i,LastName = 'Sobrenome'+i, Company = 'XXX'+i, LeadSource=''));
        }
        insert leadsChageSource;
        Test.startTest();
       		String jobID = System.schedule('Lead Process', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
     	List<Lead> leadsAtualizados = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, leadsAtualizados.size(),'Leads update Source by schedule job');
    }
}