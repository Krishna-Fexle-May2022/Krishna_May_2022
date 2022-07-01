/**
*  Description     :  InheritancePolymorphismByInterface conatins example of inheritance and polymorphism using interface and use 
                      of this, instanceOf, super keyword.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  30/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
**/
public with sharing class InheritancePolymorphismByInterface {
    /**
     * 
     *   @description    :  instanceOfKeyword() gives an example of the instanceOf keyword
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
    public static void instanceOfKeyword(){
        Object o = null;
        Boolean result = o instanceof Account;//instanceof operator gives false as result if the left operator is Null
        System.assertEquals(false, result);
        System.debug(result);
    }
    /**
     * 
     *   @description    :  PurchaseOrder is an interface.
     *
     *   @args           :   
     *
     *   @return         :   
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
    public interface PurchaseOrder {
        Double discount();
    }
    /**
    *  Description     :  CustomerPurchaseOrder class implements the interface and returns a value.
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  30/06/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha 
    **/
    class CustomerPurchaseOrder implements PurchaseOrder{
        public Double discount(){
            return 0.5;
        }
    }
    /**
    *  Description     :  EmployeePurchaseOrder class implements the interface and returns a value.
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  30/06/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha 
    **/
    class EmployeePurchaseOrder implements PurchaseOrder{
        public Double discount(){
            return 0.10;
        }
    }
    /**
    *  Description     :  ProcessPurchaseOrder class where the data is processed.
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  30/06/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha 
    **/
    public class ProcessPurchaseOrder{
        /**
     * 
     *   @description    :  processPurchaseOrder() creates object for CustomerPurchaseOrder and EmployeePurchaseOrder class and pass that to the 
     *                      processOrder() method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
        public void processPurchaseOrder(){
            PurchaseOrder order1=new CustomerPurchaseOrder();
            PurchaseOrder order2=new EmployeePurchaseOrder();
            processOrder(order1);
            processOrder(order2);
        }
        /**
     * 
     *   @description    :  processOrder(PurchaseOrder order) receives the object and calls the discount method
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
        public void processOrder(PurchaseOrder order){
            System.debug('Check discount :::'+order.discount());
        }
    }/**
    *  Description     :  SuperClass class is the parent class
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  30/06/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha 
    **/
    virtual class SuperClass {
        public String mySalutation;
        public String myFirstName;
        public String myLastName;
       
        public SuperClass() {//constructor with no parameter passes value to the global variable using this keyword.
    
            mySalutation = 'Mr.';
            myFirstName = 'Carl';
            myLastName = 'Vonderburg';
        }
    
        public SuperClass(String salutation, String firstName, String lastName) {//constructor with  parameter passes value to the global variable using this keyword.
    
            this.mySalutation = salutation;//this keyword in dot notation, without parenthesis, to represent the current instance of the class in which it appears
            this.myFirstName = firstName;
            this.myLastName = lastName;
        }
    
        public virtual void printName() {
    
            System.debug('My name is ' + mySalutation + myLastName);
        }
    
       public virtual String getFirstName() {
           return myFirstName;
       }
    }
    /**
    *  Description     :  Subclass class is the child class which extends Superclass.
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  30/06/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha 
    **/
    public class Subclass extends Superclass {
        /**
     * 
     *   @description    :  printName() method calls the parent class printName() and getFirstName() method using the super keyword.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
        public override void printName() {
              super.printName();
              System.debug('But you can call me ' + super.getFirstName());
          }
        //public Subclass() {
        //    super('Madam', 'Brenda', 'Clapentrap');
        //}
    }
}