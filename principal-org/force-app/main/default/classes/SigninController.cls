/**
 * An apex page controller that exposes the site login functionality
 */
global without sharing class SigninController {
    global String username {get; set;}
    global String password {get; set;}
    public String orgId {get; set;}
    public String siteURL  {get; set;}
    public String startURL {get; set;}
    public List<AuthProvider> authProviders {get;set;}
    public Boolean error {get; set;}
    public String homepage {get;set;}
    
    global SigninController () {
        this.homepage = 'https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto/homepage';
    }

    global PageReference login() {
        startURL = urlForwardToPathology(username);
        return Site.login(username, password, startURL);
    }
    
    public static String urlForwardToPathology(String username){
        String url = '/BemPerto/s/bem-perto/home';
        try{
            List<Case> programUser = [SELECT Id,PC_Engagement_Program__r.Name 
                           FROM Case 
                           WHERE Account.Email__c =:username 
                           AND RecordType.Name = 'Program' LIMIT 1];
            System.debug('programUser: '+programUser);
            switch on programUser[0].PC_Engagement_Program__r.Name {
                when 'PatologiaX' {
                    url = '/s/bem-perto/bp-logado';
                }   
                when else {
                    url = '/s/bem-perto/sou-participante';
                }
            }
            
        }catch(DmlException ex){
            System.debug('DmlException: '+ex);
        }
        return url;
    }
    global String getEncodedSiteUrl() {
        return EncodingUtil.urlEncode(siteURL, 'UTF-8');
    }
    
    global String getEncodedStartUrl() {
        return EncodingUtil.urlEncode(startURL, 'UTF-8');
    }
    
    global PageReference getCloseModal() {
        this.error = false;
        PageReference page = new PageReference('https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto/sou-participante');        
        return page;
    }
    
}