public class MLCC_LoginController {
    public Boolean loginError {get;set;}    
    public String username {get; set;}
    public String password {get; set;}
    public String startURL {get; set;}
    public String pageLabel {get;set;}
    
    public PageReference forwardToEsqueceuSenha(){
        return null;
    }
    
    public PageReference login(){
        startURL = queryPageEndpoint(pageLabel);
        if(startURL != ''){
            PageReference pg = Site.login(username,password,startURL);
            System.debug('mlcc pg: '+pg);
            if(pg == null){
                System.debug('pg null ;]');
            	loginError = true;
        		return new PageReference('/apex/MLCC_LoginFailed');
            }else{
                return pg;
            }    
        }else{
            loginError = true;
        	return new PageReference('/apex/MLCC_LoginFailed');
        }	
    }
    
    public String queryPageEndpoint(String pageLabel){
        AcessoPersonalizado__mdt acesso = [SELECT Endpoint__c FROM AcessoPersonalizado__mdt WHERE PageLabel__c =: pageLabel LIMIT 1];
        System.debug('acesso: '+acesso.Endpoint__c);
        return acesso == null ? '' : acesso.Endpoint__c;
    }
}