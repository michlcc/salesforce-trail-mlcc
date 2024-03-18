public class LedsUtils {
    public static void leadsDreamforce(List<Lead> listaLeads){
        System.debug('para atualizar origem do lead');
        for(Lead ld: listaLeads){
            ld.LeadSource = 'Dreamforce';
        }
        System.debug('leads atualizados?');
        update listaLeads;
    }
}