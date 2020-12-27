public class Advent_Day10 {
    public static final List<Integer> dayTenInput;

    static{
        dayTenInput = new List<Integer>();
        for (String input : [SELECT Body 
                             FROM StaticResource 
                             WHERE name = 'Day10'
                             LIMIT 1][0].Body.toString().split('\n'))
        {
            dayTenInput.add(Integer.valueOf(input));
        }
        dayTenInput.add(0);
        dayTenInput.sort();
    }
    
    
    public static Integer theSolve_part1(){

        Map<Integer,Integer> adapterJumpToOccuranceMap = new Map<Integer,Integer>();
        Integer prevAdapter = 0;
        
        for (Integer i=0; i<dayTenInput.size(); i++){
            Integer thisAdapter = dayTenInput[i];
            Integer thisJumpValue = thisAdapter - prevAdapter;
            
            if (!adapterJumpToOccuranceMap.containsKey(thisJumpValue)){
                adapterJumpToOccuranceMap.put(thisJumpValue, 1);
            }else{
                Integer currentOccuranceValue = adapterJumpToOccuranceMap.get(thisJumpValue);
                adapterJumpToOccuranceMap.put(thisJumpValue, currentOccuranceValue + 1);
            }
            
            prevAdapter = thisAdapter;
        }

        Integer returnInt = adapterJumpToOccuranceMap.get(1) * (adapterJumpToOccuranceMap.get(3) + 1);
        
        return returnInt;
    }
    
    private static Integer theLim = dayTenInput.size()-1;
    public static Long totalPaths = 0;
    
    public static Long theSolve_part2(){
        
        recursion(0);
        
        return totalPaths;
    }
    
    private static map<Integer,Long> intToPathsMap = new Map<Integer,Long>();
        
    public static void recursion(Integer i){
        if (i == theLim){
            totalPaths += 1;
            return;
        }
        
        Long pathsForThisI = totalPaths;
        
        Integer j = i+1;
        Integer k = i+2;
        Integer h = i+3;
        
        Integer thisInt = dayTenInput[i];
        Integer threeAbove = thisInt + 3;
        
        
        if (threeAbove >= dayTenInput[j]){
            if (intToPathsMap.containsKey(j)){
                totalPaths += intToPathsMap.get(j);
            }else{
                recursion(j);
            }
        }
        
        if (k <= theLim){
            if (threeAbove >= dayTenInput[k]){
                if (intToPathsMap.containsKey(k)){
                    totalPaths += intToPathsMap.get(k);
                }else{
                    recursion(k);
                }
            }
        }
        
        if (h <= theLim){
            if (threeAbove >= dayTenInput[h]){
                if (intToPathsMap.containsKey(h)){
                    totalPaths += intToPathsMap.get(h);
                }else{
                    recursion(h);
                }
            }
        } 

        pathsForThisI = totalPaths - pathsForThisI;
        
        if (!intToPathsMap.containsKey(i)){
            intToPathsMap.put(i, pathsForThisI);
        } 
    }
}