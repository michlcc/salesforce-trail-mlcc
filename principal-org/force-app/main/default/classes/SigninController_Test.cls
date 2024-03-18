@isTest (seeAllData=true)
public class SigninController_Test {
	static User guestBemPerto;
    static User patientTrail; 
    
    static User initGuestUser(){
        return [SELECT Id FROM User WHERE Profile.Name = 'amgen Perfil' AND UserType = 'Guest' LIMIT 1][0];
    }

    static User initUser(String programName){
        Case customerMainCase = [SELECT Id,AccountId, PC_Engagement_Program__r.Name 
                                 FROM Case 
                                 WHERE Account.Email__c like 'trail@%' 
                                 AND RecordType.Name = 'Program'
                                 AND PC_Engagement_Program__r.Name = 'PatologiaX'
                                 AND Account.IsCustomerPortal = true 
                                 LIMIT 1][0];        
                               
        return [SELECT Id, Email, Username FROM User WHERE Username = 'trail@bemperto.com' AND AccountId =:customerMainCase.AccountId][0];
    }

    static SigninController initPage(PageReference currentPageAction){
        Test.setCurrentPage(currentPageAction);
        return new SigninController();
    }
    
    @isTest static void login_Trail_Test(){
        String pageURL = '/s/bem-perto/bp-logado';
        guestBemPerto = (guestBemPerto != null ? guestBemPerto : initGuestUser());
        patientTrail = (patientTrail != null ? patientTrail : initUser('PatologiaX'));
        User currentUser = [SELECT Id, Username, Email FROM User WHERE Id =:UserInfo.getUserId()][0];
        Test.startTest();
            System.runAs(currentUser) {
                System.setPassword(patientTrail.id, 'Salesforce@7');
                System.debug('guestBemPerto: '+guestBemPerto);
                System.debug('patientTrail: '+patientTrail);
                System.debug('currentUser: '+currentUser);
                Test.setCurrentPage(Page.BR_BemPerto_WelcomeApp);
                SigninController controller = new SigninController();
                controller.username = patientTrail.Username;  
                controller.password = 'Salesforce@7';
                String startURL = controller.login().getUrl();
                System.debug('URL startURL: '+startURL);
                System.assertEquals(pageURL, controller.startURL);
            }
        Test.stopTest();  
    }
   
   /* @isTest static void urlForwardToPathology_Osteo_Test(){
        String pageURL = '/s/bem-perto/osteoporose';
        guestBemPerto = (guestBemPerto != null ? guestBemPerto : initGuestUser());
        patientOsteo = (patientOsteo != null ? patientOsteo : initUser('BemPerto da sua Liberdade: Evenity'));
        Test.startTest();
            System.runAs(guestBemPerto) {
                BR_BemPerto_Login_Controller controller = initPage(Page.BR_BemPerto_Login);
                controller.startURL = BR_BemPerto_Login_Controller.urlForwardToPathology(patientOsteo.Username);
                System.assertEquals(pageURL, controller.startURL);
            }
        Test.stopTest();  
    }*/
}