/**
*  Description     :  AccessingSObjectsFields is a class where we are accessing details of three object and after 
                      it is matched we are fetching the details.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  30/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
**/
public with sharing class AccessingSObjectsFields {
    /**
     * 
     *   @description    :  convertType(String phoneNumber) is the method where we are passing the phone number as the matching criteria
     *                      and after match the details is stored in the matching list using loops.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
    
    public static void convertType(String phoneNumber){
        List<Contact> contacts=new List<Contact>();
    	List<Lead> leads=new List<Lead>();
    	List<Account> accounts=new List<Account>();
        List<List<SObject>> results = [FIND :phoneNumber 
            IN Phone FIELDS 
            RETURNING Contact(Id, Phone, FirstName, LastName), 
            Lead(Id, Phone, FirstName, LastName), 
            Account(Id, Phone, Name)];
        List<SObject> records = new List<SObject>();
        if (results.size()!=0) {
            records.addAll(results[0]); //add Contact results to our results super-set
            records.addAll(results[1]); //add Lead results
            records.addAll(results[2]); //add Account results
 
        }
        else {
            System.debug('There is no contact, lead or account matching the phone number.');
        }
        
        if (!records.isEmpty()) { 
            for (Integer i = 0; i < records.size(); i++) { 
                SObject record = records[i];
                if (record.getSObjectType() == Contact.sObjectType) { 
                    contacts.add((Contact) record);
                    System.debug(contacts);
                } else if (record.getSObjectType() == Lead.sObjectType){ 
                    leads.add((Lead) record);
                    System.debug(leads);
                } else if (record.getSObjectType() == Account.sObjectType) { 
                    accounts.add((Account) record); 
                    System.debug(accounts);
                }
            }
        }
    } 
}