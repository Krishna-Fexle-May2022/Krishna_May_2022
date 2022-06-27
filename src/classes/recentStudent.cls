public class recentStudent {
    public recentStudent(){
        Student__c student=[select id, Name, Roll_Number__c, Father_Name__c, Overall_Grade__c, Mobile_Number__c, 
                                        HomePhone__c, Father_Mobile_Number__c, Email__c, Address__c, Stream__c, Class__c, 
                                        Section__c, X1st_Sem_Percentage__c, X1st_Sem_Back__c, Subjects_in_which_back_in_1st_sem__c, 
                                        X2nd_Sem_Percentage__c, X3rd_Sem_Back__c, Subjects_in_which_back_in_3rd_sem__c, X4th_Sem_Percentage__c, 
                                        X4th_Sem_Back__c, Subjects_in_which_back_in_4th_sem__c, Current_Year__c, Fees_Submitted__c,
                                        Pending_Fees_Amount__c, Exam_Fees_Submitted__c, Pending_Exam_Fees__c from Student__c order by createdDate DESC LIMIT 1];
    	system.debug('Check my latest student: '+ student);
    }
}