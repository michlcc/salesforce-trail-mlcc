@isTest
public class AnimalLocatorTest{
    @isTest static void testGetCallout() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String animal = AnimalLocator.getAnimalNameById(1);
        System.assert(animal == 'chicken');
        System.debug('animal do teste: '+animal);
    }
}