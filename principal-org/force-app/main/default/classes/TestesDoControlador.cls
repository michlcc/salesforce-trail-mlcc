public class TestesDoControlador {
    public String modal {get;set;}
    public String textoEx {get;set;}
    public void createRecord(){
        System.debug('>> textoEX: '+this.textoEx);
        Contact newContact = new Contact(LastName=this.textoEx, CurrencyIsoCode='USD');
        Boolean duplicado = validatedContactDuplicate(this.textoEx);
        System.debug('>> duplicado: '+duplicado);
        if(!duplicado){
            try{
                this.modal = 'ContactInsert';
                insert newContact;
            }catch(DmlException ex){
                System.debug('DmlException:  '+ex.getMessage());
                this.modal = 'DmlException';
            }catch(Exception ex){
                System.debug('Exception:  '+ex.getMessage());
                this.modal = 'Exception';
            }
        }else{
            this.modal = 'ContactDuplicated';
        }        
    }
    public void forwardToHomeLogada(){
        
    }
    public Boolean validatedContactDuplicate(String paramDuplicate){
        List<Contact> contact = [SELECT Id FROM Contact WHERE LastName =: paramDuplicate LIMIT 1];
        if(!contact.isEmpty()){
			return true;
        }else{
            return false;
        }
    }
    @RemoteAction
    public static Boolean newContactRequestValidated(){
        return true;
	}
}