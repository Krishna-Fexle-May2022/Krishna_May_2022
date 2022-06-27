public class insertStudent {
	public insertStudent(){
       Student__c student=new Student__c();
		/*Student details*/
        /*Personal Info*/
		student.Name='Subhodeep Sarkar';
        student.Roll_Number__c=08;
        student.Father_Name__c='Shiv Sarkar';
        student.Overall_Grade__c='A';
        student.Mobile_Number__c='9874586258';
        student.HomePhone__c='6548951235';
        student.Father_Mobile_Number__c='8452469758';
        student.Email__c='subhodeepsarkar@gmail.com';
        student.Address__c='Madhayamgram, Kolkata-700125, West Bengal India';
		/*Class Info*/
        student.Stream__c='Computer Science';
        student.Class__c='15';
        student.Section__c='A';
        /*Fees Details*/
        student.Current_Year__c='3rd year';
        student.Fees_Submitted__c='Yes';
        student.Pending_Fees_Amount__c=45000;
        student.Exam_Fees_Submitted__c='Yes';
        student.Pending_Exam_Fees__c=00;
        /*Semester Details*/
        student.X1st_Sem_Percentage__c=89.5;
        student.X1st_Sem_Back__c='No';
        student.Subjects_in_which_back_in_1st_sem__c='NA';
        student.X2nd_Sem_Percentage__c=92.45;
        student.X3rd_Sem_Back__c='Yes';
        student.Subjects_in_which_back_in_3rd_sem__c='Operating System';
        student.X4th_Sem_Percentage__c=95.2;
        student.X4th_Sem_Back__c='No';
        student.Subjects_in_which_back_in_4th_sem__c='Yes';
        /*Inserting details*/
		insert student;
		
        list<Student__c> studentList = [select id, Name, Roll_Number__c, Father_Name__c, Overall_Grade__c, Mobile_Number__c, 
                                        HomePhone__c, Father_Mobile_Number__c, Email__c, Address__c, Stream__c, Class__c, 
                                        Section__c, X1st_Sem_Percentage__c, X1st_Sem_Back__c, Subjects_in_which_back_in_1st_sem__c, 
                                        X2nd_Sem_Percentage__c, X3rd_Sem_Back__c, Subjects_in_which_back_in_3rd_sem__c, X4th_Sem_Percentage__c, 
                                        X4th_Sem_Back__c, Subjects_in_which_back_in_4th_sem__c, Current_Year__c, Fees_Submitted__c,
                                        Pending_Fees_Amount__c, Exam_Fees_Submitted__c, Pending_Exam_Fees__c from Student__c order by createdDate DESC LIMIT 5];
        for(Student__c stud:studentList){
            system.debug('check student data:::'+stud);
        }

    }
}