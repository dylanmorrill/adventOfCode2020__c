public class Advent_Day9 {
    
    public static final List<Long> dayNineInputInts;
    
    Public static final Integer PREAMBLE = 25;
    
    public static Long theSolve_part2(){
        
        Long numToFind = 25918798;
        Integer listSize = dayNineInputInts.size();
        
        for (Integer i=0; i<listSize; i++){
            Long thisNum = dayNineInputInts[i];
            Long currentAmount = thisNum;
            Long smallestNum = thisNum;
            Long largestNum = thisNum;
            
            for (Integer j=i+1; j<listSize; j++){
                Long nextNum = dayNineInputInts[j];
                currentAmount += nextNum;
                
                if (nextNum < smallestNum){
                    smallestNum = nextNum;
                }                
                
                if (nextNum > largestNum){
                    largestNum = nextNum;
                }
                
                if (currentAmount == numToFind){
                    
                    system.debug(smallestNum + largestNum);
                    break;
                    
                }else if (currentAmount > numToFind){
                    break;
                }
            }
        }
        
        return null;
    }

    static{
        dayNineInputInts = new List<Long>();
        for (String input : [SELECT Body 
                             FROM StaticResource 
                             WHERE name = 'Day9'
                             LIMIT 1][0].Body.toString().split('\n'))
        {
            dayNineInputInts.add(Long.valueOf(input));
        }  
    }
    
    
    public static Long theSolve_part1(){
        Long theAns;

        Boolean foundAMatch = false;
        
        for (Integer i=PREAMBLE; i<dayNineInputInts.size(); i++){
            foundAMatch = false;
            Long thisInt = dayNineInputInts[i];
            
            
            
            for (Integer j=i-PREAMBLE; j<i; j++){
                
                Long checkingInt = dayNineInputInts[j];
                Long intToFind = thisInt - checkingInt;
                
                for (Integer k=j+1; k<i; k++){
                    Long possibleMatch = dayNineInputInts[k];
                    
                    if (possibleMatch == intToFind){
                        foundAMatch = true;
                        break;
                    }
                }
                
                if (foundAMatch == true){
                    break;
                }
                
            }
            if (foundAMatch == true){
                continue;
            }else{
                theAns = thisInt;
                break;
            }
        }
        
        
        return theAns; 
    }
}