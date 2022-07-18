/**
*  Description     :  ApexCountryStateDistrictDataManipulation is a class where we are fetching Object data, filling Map and doing search operation
                      on them, performing dml operation creating Json data using JSON.serialize
*
*  Created By      :  Krishna Saha
*
*  Created Date    :  14/07/2022
*
*  Revision Logs   :  V1.0 - Created - Krishna Saha -14/07/2022
**/
public with sharing class ApexCountryStateDistrictDataManipulation {
    public static Map<String, Map<String, List<String>>> mapOfCountryWithDistrictAndState = new Map<String, Map<String, List<String>>>();
    /**
     * 
     *   @description    :  ApexCountryStateDistrictDataManipulation(String word,String countryName) is a constructor where we are passing two argument one for 
     *                      the search method and one for the JsonGenerator method and also all other method like the processing and aggregate method
     *
     * 
     *   @args           :  String word,String countryName 
     * 
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha - 14/07/2022
     *        
     **/
    public ApexCountryStateDistrictDataManipulation(String word,String countryName){
        mapOfCountryWithDistrictAndState = apexProcessingCountryStateDistrictData();
        apexCountryStateDistrictSearch(word);
        updateTotalNumberOfDistrictOnStates();
        updateTotalNumberOfStatesAndDistrictOnCountries();
        countryJsonGenerator(countryName);
    }
    /**
     * 
     *   @description    :  apexCountryStateDistrictDataProcessing()  is the method where we are processing the SOQL fetched data and returning the data to the constructor where 
     *                      we are assigning the value to global map.
     *
     *   @args           :   
     *
     *   @return         :   Map<String, Map<String, List<String>>>
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha  - 14/07/2022 
     *        
     **/
    public static Map<String, Map<String, List<String>>> apexCountryStateDistrictDataProcessing(){
        List<Country__c> listOfCountry = [
            Select Name
            From Country__c
        ];
        List<State__c> listOfState = [
                Select Name, Country_Name__r.Name 
                From State__c
        ];
        List<District__c> listOfDistrict = [
                Select Name, State_Name__r.Name 
                From District__c 
        ];
        Map<String, List<String>> mapOfStateWithCountry = new Map<String, List<String>>();
        for (Country__c countries : listOfCountry) {
            List<String> stateList = new List<String>();
            for ( State__c states : listOfState ) {
                if (states.Country_Name__r.Name == countries.Name) {
                    stateList.add(states.Name);
                    if (mapOfStateWithCountry.containsKey(countries.Name)) {
                        mapOfStateWithCountry.values().add(stateList);
                    }
                    else {
                        mapOfStateWithCountry.put(countries.Name,stateList);
                    }
                }
            }
        }
        System.debug('Map of country with state->' + mapOfStateWithCountry);
        Map<String, List<String>> mapOfDistrictWithState = new Map<String, List<String>>();
        for (State__c states : listOfState) {
            List<String> districtList = new List<String>();
            for ( District__c district : listOfDistrict ) {
                if (district.State_Name__r.Name == states.Name) {
                    districtList.add(district.Name);
                    if (mapOfDistrictWithState.containsKey(states.Name)) {
                        mapOfDistrictWithState.values().add(districtList);
                    }
                    else {
                        mapOfDistrictWithState.put(states.Name,districtList);
                    }
                }
            }
        }
        System.debug('Map of state with district->' + mapOfDistrictWithState);
        Map<String, Map<String, List<String>>> mapOfCountryWithDistrictAndStates = new Map<String, Map<String, List<String>>>();
        for (String country : mapOfStateWithCountry.keySet()) {
            if (!mapOfCountryWithDistrictAndStates.containsKey(country)) {
                mapOfCountryWithDistrictAndStates.put(country, new Map<String, List<String>>());
            }
            if (mapOfCountryWithDistrictAndStates.containsKey(country)) {
                for (String state : mapOfStateWithCountry.get(country)) {
                    mapOfCountryWithDistrictAndStates.get(country).put(state, new List<String>());
                    for (String district : mapOfDistrictWithState.get(state)) {
                        List<String> dist = new List<String>();
                        if (mapOfCountryWithDistrictAndStates.get(country).containsKey(state)) {
                            dist.add(district);
                            mapOfCountryWithDistrictAndStates.get(country).get(state).addAll(dist);
                        }
                    }
                }
            }
        }
        System.debug('Map of country with state and district->' + mapOfCountryWithDistrictAndStates);
        return mapOfCountryWithDistrictAndStates;
    }
    /**
     * 
     *   @description    :  apexDataProcessing() is the method where we are processing the SOQL fetched data and returning the data to the constructor where 
     *                      we are assigning the value to global map.
     *
     *   @args           :   
     *
     *   @return         :   Map<String, Map<String, List<String>>>
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha  - 15/07/2022 
     *        
     **/
    public static Map<String, Map<String, List<String>>> apexProcessingCountryStateDistrictData(){
        Map<String, Map<String, List<String>>> mapOfCountryWithDistrictAndStates = new Map<String, Map<String, List<String>>>();
        List<District__c> listOfDistrictStateAndCountry = [
            Select Name,State_Name__r.Name,State_Name__r.Country_Name__r.Name 
            From District__c 
        ];
        if (!listOfDistrictStateAndCountry.isEmpty()) {
            for (District__c district : listOfDistrictStateAndCountry) {
                if (!mapOfCountryWithDistrictAndStates.containsKey(district.State_Name__r.Country_Name__r.Name)) {
                    mapOfCountryWithDistrictAndStates.put(district.State_Name__r.Country_Name__r.Name, new Map<String, List<String>>());
                }
                if (!mapOfCountryWithDistrictAndStates.get(district.State_Name__r.Country_Name__r.Name).containsKey(district.State_Name__r.Name)) {
                    mapOfCountryWithDistrictAndStates.get(district.State_Name__r.Country_Name__r.Name).put(district.State_Name__r.Name, new list<String>());
                }
                if (!mapOfCountryWithDistrictAndStates.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).contains(district.Name)) {
                    mapOfCountryWithDistrictAndStates.get(district.State_Name__r.Country_Name__r.Name).get(district.State_Name__r.Name).add(district.Name);
                }
            }
            
        }
        System.debug('Map of country with state and district->' + mapOfCountryWithDistrictAndStates);
        return mapOfCountryWithDistrictAndStates;
    }
    /**
     * 
     *   @description    :  apexCountryStateDistrictSearch(String word)  is the method where we are accessing the global map values and the method is called 
     *                      along with the parameter from the class constructor.
     *
     *   @args           :   String word
     *
     *   @return         :   
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha  - 14/07/2022 
     *        
     **/
    public static void apexCountryStateDistrictSearch(String word){
        if (!mapOfCountryWithDistrictAndState.isEmpty()) {
            for (String country : mapOfCountryWithDistrictAndState.keySet()) {
                if (country.startsWith(word)) {
                    for (String state : mapOfCountryWithDistrictAndState.get(country).keySet()) {
                        if (state.startsWith(word)) {
                            for (String district : mapOfCountryWithDistrictAndState.get(country).get(state)) {
                                if (district.startsWith(word)) {
                                    System.debug('Country state and district starting with '+word+'->'+country+'->'+state+'->'+district);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    /**
     * 
     *   @description    :  updateTotalNumberOfDistrictOnStates()  is the method where we are using soql query fetching data performing aggregate function
     *                      on them and using dml function we are updating the fields on District Object.
     *
     *   @args           :   
     *
     *   @return         :   
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha  - 14/07/2022 
     *        
     **/
    public static void updateTotalNumberOfDistrictOnStates(){
        //TotalNumberOfDistrict in State data
        List<AggregateResult> aggResult = [
            Select State_Name__c State_Id, COUNT(Id) Total_District
            From District__c 
            GROUP BY State_Name__c 
        ];
        List<State__c> listOfDistrictRecords = new List<State__c>();
        for (AggregateResult agg : aggResult) {
            Integer totalNoDistrict = (Integer)agg.get('Total_District');
            Id stateId = (Id)agg.get('State_Id');
            State__c stateObj1 = new State__c();
            stateObj1.Total_Number_of_Districts__c =  totalNoDistrict;
            stateObj1.Id = stateId;
            listOfDistrictRecords.add(stateObj1);
        }
        if (!listOfDistrictRecords.isEmpty()) {
            update listOfDistrictRecords; 
        }
    }
    /**
     * 
     *   @description    : updateTotalNumberOfStatesAndDistrictOnCountries() is the method where we are using soql query fetching data performing aggregate function
     *                      on them and using dml function we are updating the fields on Country Object.
     *
     *   @args           :   
     *
     *   @return         :   
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha  - 14/07/2022 
     *        
     **/
    public static void updateTotalNumberOfStatesAndDistrictOnCountries(){
        List<AggregateResult> aggResult = [
            Select Country_Name__c country_Id, COUNT(Id) Total_States, Sum(Total_Number_of_Districts__c) Total_Districts
            From State__c 
            GROUP BY Country_Name__c 
        ];
        List<Country__c> listOfStateRecords = new List<Country__c>();
        for (AggregateResult agg : aggResult) {
            Integer totalStates = (Integer)agg.get('Total_States');
            Id countryId = (Id)agg.get('country_Id');
            Decimal totalDistrict = (Decimal)agg.get('Total_Districts');
		    Country__c countryObj1 = new Country__c();
            countryObj1.Total_Number_of_States__c = totalStates;
            countryObj1.Total_Number_of_Districts__c = totalDistrict;
            countryObj1.Id = countryId;
            listOfStateRecords.add(countryObj1);
        }
        if (!listOfStateRecords.isEmpty()) {
            update listOfStateRecords; 
        }
    }  
    /**
     * 
     *   @description    : countryJsonGenerator(String countryName) is the method where we are using soql query fetching data , using a external Wrapper class
     *                     CountryStateDistrictJsonGenerator  performing JSON serialize and then using dml updating the field.
     *
     *   @args           :   String countryName
     *
     *   @return         :   
     *
     *   @revision Log   :   V1.0 - Created - Krishna Saha  - 14/07/2022 
     *        
     **/
    public static void countryJsonGenerator(String countryName){
        List<Country__c> country = [
            Select Name, Total_Number_of_States__c, Total_Number_of_Districts__c, Country_Code__c,
                Country_JSON_Data__c
            From Country__c
            Where Name =: countryName
            ];
        List<State__c> stateDataList = [
            Select Name,Total_Number_of_Districts__c 
            From State__c
            ];
        if (!country.isEmpty()) {
            List<CountryStateDistrictJsonGenerator.States> states = new List<CountryStateDistrictJsonGenerator.States>();
            if (!mapOfCountryWithDistrictAndState.get(countryName).keySet().isEmpty()) {
                for (String state : mapOfCountryWithDistrictAndState.get(countryName).keySet()) {
                    CountryStateDistrictJsonGenerator.States statesWrapper = new CountryStateDistrictJsonGenerator.States();
                    statesWrapper.stateName = state;
                    for (State__c stateData : stateDataList) {
                        if (stateData.Name == state) {
                            statesWrapper.Total_Number_of_Districts = (Integer)stateData.Total_Number_of_Districts__c;
                        }
                    }
                    List<CountryStateDistrictJsonGenerator.Districts> districts = new List<CountryStateDistrictJsonGenerator.Districts>();
                    if (!mapOfCountryWithDistrictAndState.get(countryName).get(state).isEmpty()) {
                        for (String district : mapOfCountryWithDistrictAndState.get(countryName).get(state)) {
                            CountryStateDistrictJsonGenerator.Districts districtWrapper = new CountryStateDistrictJsonGenerator.Districts();
                            districtWrapper.districtName = district;
                            districts.add(districtWrapper);
                        }
                    }
                    statesWrapper.districts = districts;
                    states.add(statesWrapper);
                }
            }
            CountryStateDistrictJsonGenerator.Country countryWrapper = new CountryStateDistrictJsonGenerator.Country();
            countryWrapper.countryName = country[0].Name;
            countryWrapper.countryCode = (Integer)country[0].Country_Code__c;
            countryWrapper.Total_Number_Of_States = (Integer)country[0].Total_Number_of_States__c;
            countryWrapper.Total_Number_of_Districts = (Integer)country[0].Total_Number_of_Districts__c;
            countryWrapper.states = states;
            System.debug(countryWrapper);
            System.debug('Country state and district Json data->'+JSON.serialize(countryWrapper));
            country[0].Country_JSON_Data__c = JSON.serialize(countryWrapper);
            update country[0];
        } 
    }
}