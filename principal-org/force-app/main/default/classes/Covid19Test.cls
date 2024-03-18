@isTest
public class Covid19Test {
    @isTest
    public static void getTreatedTest(){
        Covid19 jaipur = new Covid19(5);
        
        Integer treated = jaipur.getTreated();
        System.assertEquals(10, treated, 'Treated count does not match.');
    }
}