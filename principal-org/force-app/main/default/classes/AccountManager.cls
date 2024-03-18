//@RestResource(urlMapping='/Account/*/contacts')
@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        //String accountId = request.requestURI.substringBetween('Account/','/contacts');
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account result =  [SELECT Id, Name,(SELECT Id, FirstName, LastName FROM Contacts)
                           FROM Account
                           WHERE Id = :accountId];
        return result;
    }
}