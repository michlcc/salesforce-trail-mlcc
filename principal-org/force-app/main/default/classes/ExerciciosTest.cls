@isTest(SeeAllData=false)
public class ExerciciosTest {

    @isTest static void semConsultaCriarOportunidade(){
        Account conta = new Account(Id='0013h00001iAYD1AAO',Name='Test123');
        Opportunity opp = new Opportunity(AccountId = conta.Id, Amount=53, Name='Test opp123', StageName='Prospecting', CloseDate = Date.today());
        insert opp;
        System.debug('opp: '+opp);
        System.debug('conta: '+conta);
    }
}