/**
*  Description     :  apexExpressionOperators contains example for operators and expressions
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  25/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
*
**/
public with sharing class apexExpressionOperators {
    /**
     * 
     *   @description    :   apexExpression() contains example for apex expressions.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexExpression(){
        System.debug(1+1);//literal expression
        //** A new sObject, Apex object, list, set, or map. For example:
        Account acc=new Account();
        Integer inti=5;
        List<List<sObject>> searchList = [FIND 'test*' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity];
        Account[] accList = (Account[])searchList[0];
        Contact[] conList = (Contact[])searchList[1];
        Opportunity[] oppList = (Opportunity[])searchList[2];
        List<List<sObject>> searchList2 = [FIND 'Test' IN ALL FIELDS RETURNING Contact(LastName, Phone, Email)];
        Contact[] con = (Contact[])searchList2[0];
        List<Account> listOfAcc=new List<Account>();
        Set<String> setOfStrings = new Set<String>{};
        Map<String, Integer> mapOfStringAndInteger=new Map<String,Integer>();
    }
    /**
     * 
     *   @description    :   apexExpressionOperators() contains example for apex expressions operators.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexExpressionOperators(){
        Integer x=10,y=2;
        System.debug(x+=y);
        System.debug(x*=y);
        System.debug(x-=y);
        System.debug(x/=y);
        System.debug(x<y);
        System.debug(x>y);
        System.debug((2+5)*7*11);
        System.debug(2+5*7*11);
        Integer a=10;
        System.debug(++a);
        System.debug(--a);
    }
    /**
     * 
     *   @description    :   apexSafeNavigationOprator() contains example for apex safe navigation oprator operators.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexSafeNavigationOprator(){
        String a=Null;
        String b='abc';
        System.debug(a==null?b:a);
        Account acc=new Account();
        acc.Name='test';
        insert acc;
        System.debug([Select Id, Name From Account where Id=:acc.Id]?.Name);
    }
    /**
     * 
     *   @description    :   apexRuleOfConversion() contains example for apex conversion rules.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexRuleOfConversion(){
        Long MillsPerYear = 365L * 24L * 60L * 60L * 1000L;
        Long ExpectedValue = 31536000000L;
        System.assertEquals(MillsPerYear, ExpectedValue);
        System.debug(ExpectedValue);
        Double d=5.0/3.0;
        System.debug(d);
        Double n=5/3;
        System.debug(n);
    }
}