global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> listaLeads = [SELECT Id,LeadSource from Lead where LeadSource = null LIMIT 200];
        for(Lead ld: listaLeads){
            ld.LeadSource = 'Dreamforce';
        }
        System.debug('leads atualizados?');
        update listaLeads;
    }
}