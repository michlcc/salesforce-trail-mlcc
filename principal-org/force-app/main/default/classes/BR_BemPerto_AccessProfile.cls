global without sharing class BR_BemPerto_AccessProfile {
 	public String username {get; set;}
    public String password {get; set;}
    public Boolean error {get; set;}
    public String homepage {get;set;}
    public String propTest {get;set;}
    
    public BR_BemPerto_AccessProfile(){
        this.homepage = 'https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto/homepage';
        String userEmail = UserInfo.getUserEmail();
        String firstname = UserInfo.getFirstName();
        String lastname = UserInfo.getLastName();
        String usertype = UserInfo.getUserType();
        System.debug('user name: '+firstname+' '+lastname);
        System.debug('user type: '+usertype);
    }
    public Boolean loginError{get;set;}	 
    
    public PageReference forwardToBemPerto() {
        return new PageReference('https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto');
    }
    public PageReference forwardToVisitante() {
        return new PageReference('https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto/homepage');
    }
    public PageReference forwardToParticipante() {
        return new PageReference('/apex/BR_BemPerto_WelcomeApp');
    }
    public PageReference getCloseModal() {
        this.error = false;
        PageReference page = new PageReference('https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto/sou-participante');        
        return page;
    }
    
    global PageReference login(){
        String url;
        if(this.username != '' && this.password != ''){           
            System.debug('user preenchido');
            url = 'https://trail-ed-mlcc-developer-edition.na111.force.com/BemPerto/s/bem-perto/sou-participante'; 
            PageReference page = Site.login(username,password,url);
            PageReference result = page.setRedirect(true);
            if (result == null){
                System.debug('MLCC result null');
                this.loginError = True;
                this.error = true;
                return null;
            }else{
                this.loginError = false;
            }
            System.debug('MLCC result page: '+result);
        }
        return null;
        
    }
    
    public void testandoPropAncor(){
        if(this.propTest == 'testando'){
            System.debug('funciona :D');
        }else{
            System.debug('não deu :(');
        }
    }
}