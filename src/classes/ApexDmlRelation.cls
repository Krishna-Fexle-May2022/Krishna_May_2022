/**
*  Description     :  ApexDmlRelation contains examples about retrieving, updating, upserting, inserting and updating(Related records) and inserting and updating(Related records using foreign key).
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  26/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha
                      V1.1 - Updated - 11/07/2022 - Krishna Saha
*                
*
**/
public with sharing class ApexDmlRelation {
    /**
     * 
     *   @description    :   apexDmlUpdate() method shows example for DML update.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexDmlUpdateOperationOnData(){
        // List to hold the new contacts to update.
        List<Contact> updatedList = new List<Contact>();
        List<Contact> conList = [Select Department ,Description from Contact];
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Description = 'New description';
                // Add updated contact sObject to the list.
                updatedList.add(con);
            }
        }

        // Call update on the list of contacts.
        // This results in one DML call for the entire list.
        update updatedList;
        System.debug(updatedList);
    }
    /**
     * 
     *   @description    :   updateRetrieveUsingDML() method shows example for DML update and retrieve data.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexUpdateRetrieveOperationUsingDml(){
        // Query existing account.
        Account a = [
            SELECT Name,Industry 
            FROM Account 
            WHERE Name='Ayan' 
            LIMIT 1];

        // Write the old values the debug log before updating them.
        System.debug('Account Name before update: ' + a.Name); // Name is Account Example
        System.debug('Account Industry before update: ' + a.Industry);// Industry is not set

        // Modify the two fields on the sObject.
        a.Name = 'Ayan Hussain';
        a.Industry = 'Technology';

        // Persist the changes.
        update a;

        // Get a new copy of the account from the database with the two fields.
        Account acc = [SELECT Name,Industry 
        FROM Account 
        WHERE Name='Ayan Hussain' LIMIT 1];

        // Verify that updated field values were persisted.
        System.assertEquals('Ayan Hussain', acc.Name);
        System.assertEquals('Technology', acc.Industry);
        System.debug('Account Name after update: ' + acc.Name);
        System.debug('Account Industry after update: ' + acc.Industry);
    }
    /**
     * 
     *   @description    :   insertUpdateRecords() method shows example for DML insert and update data.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexInsertUpdateRecordsOperationUsingDml(){
        Account[] accts = new List<Account>();
        for(Integer i=0;i<3;i++) {
            Account a = new Account();
            a.Name='Aro' + i;
            a.BillingCity='Manali';
            accts.add(a);
        }
        Account accountToUpdate=new Account();
        try {
            insert accts;        
    
            // Update account Acme2.
            accountToUpdate = [
                SELECT BillingCity 
                FROM Account 
                WHERE Name='Aro2' 
                AND BillingCity='Manali' 
                LIMIT 1];
            System.debug('Account Billing City before update: ' + accountToUpdate.BillingCity);
            // Update the billing city.
            accountToUpdate.BillingCity = 'Mohali';
            // Make the update call.
            update accountToUpdate;
            } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }

        // Verify that the billing city was updated to New York.
        Account afterUpdate = [
            SELECT BillingCity 
            FROM Account 
            WHERE Id=:accountToUpdate.Id];
        System.assertEquals('Mohali', afterUpdate.BillingCity);
        System.debug('Account BillingCity after update: ' + afterUpdate.BillingCity);
    }
    /**
     * 
     *   @description    :   insertRelatedRecord() method shows example for DML insert here we insert using parent child relation.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexInsertRelatedRecordOperationUsingDml(){
        try {
            Account acct = new Account(Name='SFDC Account');
            insert acct;
        
            // Add a contact to this account.
            Contact con = new Contact(
                FirstName='Joes',
                LastName='Smith',
                Phone='415.555.1212',
                AccountId=acct.Id);
            insert con;
            System.debug(con);
        } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    /**
     * 
     *   @description    :   updateRelatedRecord() method shows example for DML update here we update data using parent child relation.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexUpdateRelatedRecordOperationUsingDml(){
        try {
            // Query for the contact, which has been associated with an account.
            Contact queriedContact = [
                SELECT Account.Name, Account.Industry , Phone 
                FROM Contact 
                WHERE FirstName = 'Joes' AND LastName='Smith'
                LIMIT 1];
        
            // Update the contact's phone number
            queriedContact.Phone = '415.555.1214';
        
            // Update the related account industry
            queriedContact.Account.Industry = 'Technology';
        
            // Make two separate calls 
            // 1. This call is to update the contact's phone.
            update queriedContact;
            // 2. This call is to update the related account's Industry field.
            update queriedContact.Account; 
            Contact con=[
                SELECT Account.Industry, Account.Name, Phone 
                FROM Contact 
                WHERE FirstName = 'Joes' AND LastName='Smith'
                LIMIT 1];
            System.debug(con);
        } catch(Exception e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }
    }
    /**
     * 
     *   @description    :   parentChildUsingForeignKey() method shows example for DML insert here we insert data in parent child relation using foreign key.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexParentChildDataInsertUsingForeignKey(){
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity(
            Name='OpportunityWithAccountInsert',
            StageName='Prospecting',
            CloseDate=dt);
        
        // Create the parent reference.
        // Used only for foreign key reference
        // and doesn't contain any other fields.
        Account accountReference = new Account(
            SLASerialNumber__c='SAP111112');                
        newOpportunity.Account = accountReference;
        
        // Create the Account object to insert.
        // Same as above but has Name field.
        // Used for the insert.
        Account parentAccount = new Account(
            Name='Ballie',
            SLASerialNumber__c='SAP111112');      
        
        // Create the account and the opportunity.
        Database.SaveResult[] results = Database.insert(new SObject[] {
            parentAccount, newOpportunity });
        
        // Check results.
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: '
                  + results[i].getId());
            } else {
            System.debug('Error: could not create sobject '
                  + 'for array element ' + i + '.');
            System.debug('   The error reported was: '
                  + results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
    /**
     * 
     *   @description    :   dmlTypes() method shows example for DML insert, upsert, merge and convert.
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 11/07/2022 - Krishna Saha 
     *        
     **/
    public static void apexDmlTypes(){

        //INSERTING RECORDS

        Account[] accts = new List<Account>();
        for(Integer i=0;i<2;i++) {
            Account a = new Account(Name='Amway' + i, BillingCity='Bombay');
            accts.add(a);
        }
        insert accts;

        //UPSERTING RECORDS

        Account[] acctsList = [
            SELECT Id, Name, BillingCity 
            FROM Account 
            WHERE BillingCity = 'Bombay'];
        for (Account a : acctsList) {
            a.BillingCity = 'Mumbai';
        }
        Account newAcct = new Account(Name = 'Acme4', BillingCity = 'San Francisco');
        acctsList.add(newAcct);
        try {
            upsert acctsList;
        } catch (DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }

        //MERGE RECORDS
  
        // Insert new accounts
        List<Account> ls = new List<Account>{
            new Account(name='Acme Inc.'),
            new Account(name='Acme')
        };                                        
        insert ls;

        // Queries to get the inserted accounts 
        Account masterAcct = [
            SELECT Id, Name 
            FROM Account 
            WHERE Name = 'Acme Inc.' 
            LIMIT 1];
        Account mergeAcct = [
            SELECT Id, Name 
            FROM Account 
            WHERE Name = 'Acme' 
            LIMIT 1];

        // Add a contact to the account to be merged
        Contact c = new Contact(FirstName='Joe',LastName='Merged');
        c.AccountId = mergeAcct.Id;
        insert c;

        try {
            merge masterAcct mergeAcct;
        } catch (DmlException e) {
            // Process exception
            System.debug('An unexpected error has occurred: ' + e.getMessage()); 
        }

        // Once the account is merged with the master account,
            // the related contact should be moved to the master record.
        masterAcct = [
            SELECT Id, Name, (SELECT FirstName,LastName FROM Contacts) 
            FROM Account 
            WHERE Name = 'Acme Inc.' 
            LIMIT 1];
        System.debug(masterAcct);
        System.assert(masterAcct.getSObjects('Contacts').size() > 0);
        System.assertEquals('Joe', masterAcct.getSObjects('Contacts')[0].get('FirstName'));
        System.assertEquals('Merged', masterAcct.getSObjects('Contacts')[0].get('LastName'));

        // Verify that the merge record got deleted
        Account[] result = [
            SELECT Id, Name 
            FROM Account 
            WHERE Id=:mergeAcct.Id];
        System.assertEquals(0, result.size());
        
        //CONVERTING lEADS
        
        Lead myLead = new Lead(LastName = 'Fry', Company='Fry And Sons');
        insert myLead;

        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(myLead.id);

        LeadStatus convertStatus = [
            SELECT Id, MasterLabel 
            FROM LeadStatus 
            WHERE IsConverted=true 
            LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);

        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        System.debug(lcr);
    }
}