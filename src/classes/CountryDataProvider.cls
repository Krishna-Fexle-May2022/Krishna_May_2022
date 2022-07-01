/**
*  Description     :  CountryDataProvider conatins two maps and a list in which we are processing data to fetch required details.
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  30/06/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha 
**/
public with sharing class CountryDataProvider {
   /**
     * 
     *   @description    :  countryDataProcess() is the method where we are processing the data and fetching required details.
     *
     *   @args           :   
     *
     *   @return         :   void
     *
     *   @revision Log   :   V1.0 - Created  - 30/06/2022 - Krishna Saha 
     *        
     **/
    public static void countryDataProcess(){

        //Map of state as String and district as list
        Map<String,List<String>> mapOfDistrictWithList= new Map<String,List<String>>();
        mapOfDistrictWithList.put('West-Bengal',new List<String>{'North-24 Parganas','Kolkata'} );
        mapOfDistrictWithList.put('Barisal',new List<String>{'Barguna','Barisal'} );
        mapOfDistrictWithList.put('San Fernando',new List<String>{'San Fernando'} );
        mapOfDistrictWithList.put('Andhra Pradesh',new List<String>{'Anantpur'} );

        //Map of country as String and state as list
        Map<String,List<String>> mapOfStatesWithCountry= new Map<String,List<String>>();
        mapOfStatesWithCountry.put('India', new List<String>{'West-Bengal','Andhra Pradesh'});
        mapOfStatesWithCountry.put('Bangladesh', new List<String>{'Barisal'});
        mapOfStatesWithCountry.put('Spain', new List<String>{'San Fernando'});

        Map<String, Map<String, List<String>>> mapOfCountriesWithStateAndDistricts = new Map<String, Map<String, List<String>>>();
        
        //To join the maps Together
        for (String key : mapOfStatesWithCountry.keySet()) {
            if(!mapOfCountriesWithStateAndDistricts.containsKey(key)){
                mapOfCountriesWithStateAndDistricts.put(key, new Map<String,List<String>>());
            }
            if (mapOfCountriesWithStateAndDistricts.containsKey(key)) {
                for (String state : mapOfStatesWithCountry.get(key)) {
                    mapOfCountriesWithStateAndDistricts.get(key).put(state, new List<String>());
                
                    if (mapOfCountriesWithStateAndDistricts.get(key).containsKey(state)) {
                        mapOfCountriesWithStateAndDistricts.get(key).get(state).addAll(mapOfDistrictWithList.get(state));
                    }
                }
            }
        }

        //To find country state and district starting with same letter
        if(!mapOfCountriesWithStateAndDistricts.isEmpty()){
            for (String Key : mapOfCountriesWithStateAndDistricts.keySet()) {
                if (key.indexOf('B')==0) {
                    for (String state : mapOfCountriesWithStateAndDistricts.get(key).keySet()) {
                        if (state.indexOf('B')==0) {
                            for (String district : mapOfCountriesWithStateAndDistricts.get(key).get(state))
                            {   
                                if (district.indexOf('B')==0) {
                                    System.debug(key+'->'+state+'->'+district);
                                }
                            }
                        }
                    }
                }
            }
        }
        System.debug('--------------------------------------------');
        //To find district whose length is greater than or equal to 7
        if(!mapOfCountriesWithStateAndDistricts.isEmpty()){
            for (String Key : mapOfCountriesWithStateAndDistricts.keySet()) {
                for (String state : mapOfCountriesWithStateAndDistricts.get(key).keySet()) {
                    for (String district : mapOfCountriesWithStateAndDistricts.get(key).get(state))
                    {
                        if(district.length()>=7)
                            System.debug(key+'->'+state+'->'+district);
                    }
                }
            }
        }
    }
}