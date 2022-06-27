/**
*  Description     :  apexBasics class contains examples for apex data types, casting object to specific data type,
                      casting object to user defined data type, apex date class,apex datetime class, apex String class
                      and apex collection like (list,set,map).
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  24/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha
*                     V1.1 - Modified - 24/06/2022. 
*
**/
public with sharing class apexDataTypes {
    /**
     * 
     *   @description    :   apexDataTypes() contains examples of primitive data types available in apex
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexPrimitiveDataTypes(){
        Boolean isWinner = true;
        Double d=3.14159;
        Integer i = 1;
        Long l = 2147483648L;
        System.debug(isWinner);
        System.debug(d);
        System.debug(i);
        System.debug(l);
    }
    /**
     * 
     *   @description    :   objectMethod() converts object to specific data types
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    //cast an object that represents a more specific data type
    public void objectMethod(){
        Object obj = 10;
        Integer i = (Integer)obj;
        System.assertEquals(10, i);
        System.debug(i);
    }
    /**
     * 
     *   @description    :   castObjectToClass() converts object to user defined data types
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    //cast an object to a user-defined type
    public static void castObjectToClass(){
        Object obj = new apexDataTypes();
        apexDataTypes mc = (apexDataTypes)obj;
        mc.ObjectMethod();
    }
    /**
     * 
     *   @description    :   apexString() contains examples of apex string type
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexString(){
        //This example gets the value of the first character at index 0.
        String str = 'Ω is Omega.';
        System.assertEquals(937, str.charAt(0));
        System.debug(str);
        String str1 = '\uD835\uDD0A';
        System.assertEquals(55349, str1.charAt(0), 
        'charAt(0) didn\'t return the high surrogate.');
        System.assertEquals(120074, str1.codePointAt(0),
        'codePointAt(0) didn\'t return the entire two-character supplementary value.');
        System.debug(str1);
    }
     /**
     * 
     *   @description    :   apexDate() contains examples of apex date type
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexDate(){
        //Days Between
        Date startDate = Date.newInstance(2008, 1, 1);
        Date dueDate = Date.newInstance(2008, 1, 30);
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        System.debug(numberDaysDue);
        //Days in month
        Integer numberDays = date.daysInMonth(1960, 2);
        System.debug(numberDays);
        //Months Between
        Date firstDate = Date.newInstance(2006, 12, 2);
        Date secondDate = Date.newInstance(2012, 12, 8);
        Integer monthsBetween = firstDate.monthsBetween(secondDate);
        System.assertEquals(72, monthsBetween);
        System.debug(monthsBetween);
        //String to date format
        date mydate = date.parse('12/27/2009');
        System.debug(mydate);
        //Checking Leap year or not
        System.debug(Date.isLeapYear(2004));
        //Returns a Date that contains the value of the specified String.
        string year = '2006';
        string month = '12';
        string day = '14';
        string hour = '18';
        string minute = '35';
        string second = '52';
        string stringDate = year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
        Date myDateNew = date.valueOf(stringDate);
        System.debug(myDateNew);
    }
     /**
     * 
     *   @description    :   apexDateTime() contains examples of apex datetime type
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexDateTime(){
        DateTime myDateTime = DateTime.newInstance(1997, 1, 31, 7, 8, 16);
        DateTime newDateTime = myDateTime.addHours(3);
		//DateTime expected = DateTime.newInstance(1997, 1, 31, 10, 8, 16);
		//System.assertEquals(expected, newDateTime);
        System.debug(newDateTime);
        // California local time, PST
        Date myDate = myDateTime.dateGMT();
        Date expected = Date.newInstance(1997, 1, 31);
        System.assertEquals(expected, myDate);
        System.debug(myDate);
    }
     /**
     * 
     *   @description    :   apexList() contains examples of apex collection-->list
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexList(){
        List<Integer> myList = new List<Integer>(); // Define a new list
        myList.add(47);                    // Adds a second element of value 47 to the end 
                                       // of the list
        Integer i = myList.get(0); 
        System.debug(i);
        String[] colors = new String[1]; //Array Notation for one dimensional list
        colors[0]='Red';
        System.debug(colors);
        //list sorting
        List<String> colours = new List<String>{
            'Blue',
            'Violet',
            'Green'};
        colours.sort();
        System.assertEquals('Blue', colours.get(0));
        System.assertEquals('Green', colours.get(1));
        System.assertEquals('Violet', colours.get(2));
        System.debug(colours);
        //Default Sort Order for SelectOption
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('A','United States'));
        options.add(new SelectOption('C','Canada'));
        options.add(new SelectOption('A','Mexico'));
        System.debug('Before sorting: ' + options);
        options.sort();
        System.debug('After sorting: ' + options);
    }
    /**
     * 
     *   @description    :   apexSet() contains examples of apex collection-->Set
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexSet(){
        // Defines a new set with two elements
        Set<String> set1 = new Set<String>{'New York', 'Paris'};
        System.debug(set1);
        // Define a new set
        Set<Integer> mySet = new Set<Integer>();
        // Add two elements to the set
        mySet.add(1);
        mySet.add(3);
        // Assert that the set contains the integer value we added
        System.assert(mySet.contains(1)); 
        // Remove the integer value from the set
        mySet.remove(1);
        System.debug(myset);
        // Define a new set that contains the
        // elements of the set created in the previous example
        Set<Integer> mySet2 = new Set<Integer>(mySet);
        // Assert that the set size equals 1
        // Note: The set from the previous example contains only one value
        System.assert(mySet2.size() == 1);
        System.debug(mySet2);
    }
    /**
     * 
     *   @description    :   apexMap() contains examples of apex collection-->Map
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.1 - Created  - 24/06/2022 - Krishna Saha 
     *        
     **/
    public static void apexMap(){
        Map<String, String> MyStrings = new Map<String, String>{'a' => 'b', 'c' => 'd'.toUpperCase()};
        Map<Integer, String> m = new Map<Integer, String>(); // Define a new map
        m.put(1, 'First entry');                  // Insert a new key-value pair in the map
        m.put(2, 'Second entry');                  // Insert a new key-value pair in the map
        System.assert(m.containsKey(1));  // Assert that the map contains a key
        String value = m.get(2);               // Retrieve a value, given a particular key
        System.debug(value);
        System.assertEquals('Second entry', value);
        Set<Integer> s = m.keySet();       // Return a set that contains all of the keys in the map
        System.debug(s);
    }
}