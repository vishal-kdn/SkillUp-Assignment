public class trainingCertificateController 
{ 
    Public Trainee__c listOfTrainees {get;set;}
    Public Course__c listOfCourses {get;set;}
    Public Trainer__c listOfTrainers {get;set;}
    
             public trainingCertificateController() 
              {
               listOfTrainees=[SELECT Name, Course__c  FROM Trainee__c WHERE Id=:ApexPages.currentPage().getParameters().get('id')];
               listOfCourses=[SELECT Name, Trainer__c FROM Course__c WHERE Id=:listOfTrainees.Course__c];
               listOfTrainers=[SELECT Name FROM Trainer__c where Id=:listOfCourses.Trainer__c];
              }
}