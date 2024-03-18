@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String pais =  'Germany';
		String[] result = ParkLocator.country(pais);        
        String[] paises = new String[]{'Hamburg Wadden Sea National Park', 'Hainich National Park', 'Bavarian Forest National Park'};
        System.assertEquals(paises, result); 
        
        System.debug('result: '+result);
    }
}