/**
*  Description     :  ApexClassConstructorMethods contains examples about  constructor, variables, methods and procedure used in apex classes.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  26/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha
                      V1.1 - Updated - 27/06/2022 - Krishna Saha
*                
*
**/
public with sharing class ApexClassConstructorMethods {
    private static final Integer DEFAULT_SIZE = 10;//Class Variable
    Integer size;
     /**
     * 
     *   @description    :   ApexClassConstructorMethods() is a Constructor with no arguments and 
     *                       ApexClassConstructorMethods(Integer ObjectSize)  Constructor with one argument and constuctor overloading or constructor chaining
     *                       is the action performed here.
     *
     *   @args           :   
     *
     *   @return         :   
     *
     *   @revision Log   :   V1.1 - Created  - 26/06/2022 - Krishna Saha 
     *        
     **/
    public ApexClassConstructorMethods() {// The no argument constructor
        this(DEFAULT_SIZE); // Using this(...) calls the one argument constructor    
    }
        
    public ApexClassConstructorMethods(Integer ObjectSize) {// Constructor with one argument
        size = ObjectSize;  
    }   
    /**
     * 
     *   @description    :   debugStatusMessage() and processString(String s) Passing Primitive Data Type Arguments
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 26/06/2022 - Krishna Saha 
     *        
     **/
    public static void debugStatusMessage() {//Class Methods
        String msg = 'Original value';
        processString(msg);
        // The value of the msg variable didn't
        // change; it is still the old value.
        System.assertEquals(msg, 'Original value');
        System.debug(msg);
    }
    
    public static void processString(String s) {
        s = 'Modified value';
        System.debug(s);
    }
    /**
     * 
     *   @description    :   createTemperatureHistory(), reference(List<Integer> m) and referenceNew(List<Integer> m) 
     *                       Passing Non-Primitive Data Type Arguments
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 26/06/2022 - Krishna Saha 
     *        
     **/

    public static void createTemperatureHistory() {
        List<Integer> fillMe = new List<Integer>();        
        reference(fillMe);
        // The list is modified and contains five items
        // as expected.
        System.assertEquals(fillMe.size(),5);        
        System.debug(fillMe);
        List<Integer> createMe = new List<Integer>();
        referenceNew(createMe);
        // The list is not modified because it still points
        // to the original list, not the new list 
        // that the method created.
        System.assertEquals(createMe.size(),0);     
    }
            
    public static void reference(List<Integer> m) {//call by value
        // Add rounded temperatures for the last five days.
        m.add(70);
        m.add(68);
        m.add(75);
        m.add(80);
        m.add(82);
    }    
        
    public static void referenceNew(List<Integer> m) {//call by reference
        // Assign argument to a new List of
        // five temperature values.
        m = new List<Integer>{55, 59, 62, 60, 63};
        System.debug(m);

    }
}