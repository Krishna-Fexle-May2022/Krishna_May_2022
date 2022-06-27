/**
*  Description     :  StudentDataProviderClass class contains which contains get set method 
                    to fetch and update student data.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  27/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
**/
public with sharing class StudentDataProviderClass {
    /**
     * 
     *   @description    :   stData is a Student__c custom object type metjod for get set.
     *
     *   @args           :   
     *
     *   @return         :   Student__c
     *
     *   @revision Log   :   V1.0 - Created  - 27/06/2022 - Krishna Saha 
     *        
     **/
    //Way of Caching the Data
    public static Student__c stData{
        
        get{
            
            if(stData == null){
                
                //OneTime Run
                stData = [select id, name from Student__c where name != NULL];
            }
            return stData;
        }
        
        set{
            
            stData.Name = stData.Name + DateTime.now();
            system.debug('Check stData.Name ' + stData.Name);
        }
    }
    
    //public static Student__c stData1{get;set;}
    //public static Student__c stData2;
    
    @AUraEnabled
    public static Student__c getStData(){
        
        Student__c stLocal;
        
        if(stLocal == null){
            
            stLocal = [select id, name from Student__c where name != NULL];
        }
        
        return stLocal;
    }
    
    @AUraEnabled
    public static Student__c getStDataForComp1(){
        if(stData == null){
            stData = [select id, name from Student__c where name != NULL];
            
        }
        
        return stData;
    }
    /**
*  Description     :  processStudentData is a inner class is used process and save the fetched Student__c
                      custom object type data.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  27/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
**/

    public class processStudentData{
    
        public Student__c processStudentData(){
        
            //Getter method
            Student__c st = StudentDataProviderClass.stData;
            return st;
        }
    
        public void saveStudentData(){
            Student__c s1=processStudentData();
            Student__c studentData = s1;
            //Setter Method
            StudentDataProviderClass.stData = s1;
        
        }
    }
}