public class Advent_Day1 {
    
    public static Integer theSolve(){
        List<String> dayOneInput = [SELECT Body 
                                    FROM StaticResource 
                                    WHERE name = 'day1'
                                    LIMIT 1][0].Body.toString().split('\n');
        
        
        List<Integer> dayOneInputIntegers = new List<Integer>();
        for (String row : dayOneInput){
            dayOneInputIntegers.add(Integer.valueOf(row));
        }
        dayOneInputIntegers.sort();

        for (Integer i=0; i<dayOneInputIntegers.size(); i++){
            Integer iValue = dayOneInputIntegers[i];
            for (Integer j=i+1; j<dayOneInputIntegers.size(); j++){
                Integer jValue = dayOneInputIntegers[j];
                Integer intToFind = 2020 - iValue - jValue;
                
                if (dayOneInputIntegers.contains(intToFind)){
                    return iValue * jValue * intToFind;
                }
            }
        }
        return null;
    }
}