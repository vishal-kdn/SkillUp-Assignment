public class errorTrainingCertificateController 
{
   Public Trainee__c listOfTrainees {get;set;}
   Public Course__c listOfCourses {get;set;}
          Public errorTrainingCertificateController() 
              {
               listOfTrainees=[SELECT Name,Course__c  FROM Trainee__c where Id=:ApexPages.currentPage().getParameters().get('id')];
               listOfCourses=[Select Name,Trainer__c from Course__c Where id=:listOfTrainees.Course__c];
              }
}