public class LeadProcessor implements Database.Batchable<sObject> {
    
   	public Database.QueryLocator start(Database.BatchableContext BC) {
       return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead WHERE LeadSource = null');
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead ld: scope){
            ld.LeadSource = 'Dreamforce';
        }
        update scope;        
    }
    public void finish(Database.BatchableContext bc){
        
    }
}