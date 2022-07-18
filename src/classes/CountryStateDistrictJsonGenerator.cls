/**
*  Description     :  CountryStateDistrictJsonGenerator is a class where we have the inner Wrapper class
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  14/07/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha -14/07/2022
**/
public with sharing class CountryStateDistrictJsonGenerator {
    public  List<String> countryList{get; set;}
    /**
    *  Description     :  Country is a Wrapper class
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  14/07/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha -14/07/2022
    **/
    public class Country{
        public String countryName{get; set;}  
        public Integer countryCode{get; set;}
        public Integer Total_Number_Of_States{get; set;}   
        public Integer Total_Number_of_Districts{get; set;} 
        public List<States> states{get; set;}
    }   
    /**
    *  Description     :  States is a Wrapper class
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  14/07/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha -14/07/2022
    **/
    public class States {
        public Integer Total_Number_of_Districts{get; set;}
        public String stateName{get; set;}   
        public List<Districts> districts{get; set;}
    }
    /**
    *  Description     :  Districts is a Wrapper class
    *
    *  Created By      :  Krishna Saha
    *
    *  Created Date    :  14/07/2022
    *
    *  Revision Logs   :  V1.0 - Created - Krishna Saha -14/07/2022
    **/
    public class Districts {
        public String districtName{get;set;}
        
    }
}