/**
*  Description     :  ApexLoopConditions class contains examples for condition loops,
                      examples for different types of loops.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  25/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
*                     V1.1 - Updated - 27/06/2022 - Krishna Saha
**/
public with sharing class ApexLoopConditions {
    /**
     * 
     *   @description    :   conditionalStatements() contains example for if-else condition.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void conditionalStatements(){
        Integer i=3482,lastNumber=0;
        if(i!=0){
            lastNumber=math.mod(i, 10);
            i=i/10;
        }else{
            System.debug('Either i is null or i value has reached 0');
        }
        System.debug(lastNumber);
    }
    /**
     * 
     *   @description    :   apexDoWhileLoop() contains example for Do-While loop in apex
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexDoWhileLoop(){
        Integer count = 10;

        do {
            System.debug(count);
            count++;
            } while (count < 21);
    }
    /**
     * 
     *   @description    :   apexWhileLoop() contains example for While loop in apex
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexWhileLoop(){
        Integer i=1;
        while (i<=10) {
            System.debug(i);
            i++;
        }
    }
    /**
     * 
     *   @description    :   apexForLoop() contains example for For loop in apex
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 25/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexForLoop(){
        for (Integer i=1;i<=5;i++) {
            String s = '';
            for (Integer j=1;j<=i;j++) {
                s = s + j + '_';
            }
            System.debug(s);
        }
        Integer[] myInts = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

        for (Integer i : myInts) {
        System.debug(i);
        }
        // Create a list
        List<String> listOfColors = new List<String>();
        // Add Strings to the list
        listOfColors.add('RED');
        listOfColors.add('Yellow');
        listOfColors.add('Green');
        for (String color: listOfColors) {
            System.debug(color);
        }
    }
}