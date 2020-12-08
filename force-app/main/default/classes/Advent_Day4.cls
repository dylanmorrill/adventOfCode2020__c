public class Advent_Day4 {

    public static final Set<String> VALID_FIELD_TYPES = new Set<String>{'byr',
        'iyr',
        'eyr',
        'hgt',
        'hcl',
        'ecl',
        'pid'
    };
            
    public static List<String> VALID_EYES = new List<String>{'amb', 
        'blu', 
        'brn', 
        'gry', 
        'grn', 
        'hzl', 
        'oth'
    };
    
    public static Integer theSolve(){
        List<Map<String,String>> peopleAndFieldValues = formatInputInAGrossBruteForceWayCauseImLazy();
        Integer numValid = 0;
        
        for (Map<String,String> person : peopleAndFieldValues){
            
            System.debug(person);
            
            
            
            
            
            Boolean hasNullValues = false;
            
            for (String fieldName : VALID_FIELD_TYPES){
                if (person.get(fieldName) == null){
                    hasNullValues = true;
                    continue;
                }
            }
            
            if (hasNullValues){
                continue;
            }
            
            String byr = person.get('byr');
            String iyr = person.get('iyr');
            String eyr = person.get('eyr');
            String hgt = person.get('hgt');
            String hcl = person.get('hcl');
            String ecl = person.get('ecl');
            String pid = person.get('pid');

            if (Integer.valueOf(byr) < 1920 || Integer.valueOf(byr) > 2002){
                continue;
            }

            if (Integer.valueOf(iyr) < 2010 || Integer.valueOf(iyr) > 2020){
                continue;
            }
            
            if (Integer.valueOf(eyr) < 2020 || Integer.valueOf(eyr) > 2030){
                continue;
            }
            
            if (!hgt.contains('cm') && !hgt.contains('in')){
                continue;
            }
            if (hgt.contains('cm')){
                Integer h = Integer.valueOf(hgt.remove('cm'));
                
                if (h < 150 || h> 193){
                    continue;
                }
            }
            if (hgt.contains('in')){
                Integer h = Integer.valueOf(hgt.remove('in'));
                if (h < 59 || h > 76){
                    continue;
                }
            }

            if (!hcl.contains('#') || hcl.remove('#').length() != 6){
                continue;
            }
            
            if (ecl.length() != 3 || !VALID_EYES.contains(ecl)){
                continue;
            }
 
            if (pid.length() != 9){
                continue;
            }

            numValid ++;
        }

        return numValid;
    }
    
    public static List<Map<String,String>> formatInputInAGrossBruteForceWayCauseImLazy(){
        List<String> dayFourInput = [SELECT Body 
                                     FROM StaticResource 
                                     WHERE name = 'day4'
                                     LIMIT 1][0].Body.toString().split('\n');
        
        String currentString = '';
        List<String> formattedInput = new List<String>();
        List<Map<String,String>> peopleAndFieldNamesMap = new List<Map<String,String>>();
        
        for (Integer i=0; i<dayFourInput.size(); i++){
            String row = dayFourInput[i];
            if (row != ''){
                currentString += ' ' + row;
                
                if (i == dayFourInput.size()-1){
                    peopleAndFieldNamesMap.add(getPersonMap(currentString.split(' ')));
                }
                
            }else{
                peopleAndFieldNamesMap.add(getPersonMap(currentString.split(' ')));
                currentString = '';
            }
        }

        return peopleAndFieldNamesMap;
    }
        
    
        public static Map<String,String> getPersonMap(List<String> multiData){
        Map<String,String> thisPerson = new Map<String,String>();
        for (String data : multiData){
            String fieldName;
            String fieldValue;
            integer dataNum = 0;
            
            for (String dataPoint : data.split(':')) {
                if (dataPoint == ''){
                    continue;
                }
                
                if (dataNum == 0){
                    fieldName = dataPoint;
                }else{
                    fieldValue = dataPoint;
                }
                dataNum++;
                
                thisPerson.put(fieldName, fieldValue);
            }
        }
        
        return thisPerson;
    }
        
        
        
        
        
        
}