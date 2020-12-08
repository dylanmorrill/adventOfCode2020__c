public class Advent_Day5 {
    private static List<String> dayFiveInput = [SELECT Body 
                                                        FROM StaticResource 
                                                        WHERE name = 'day5'
                                                        LIMIT 1][0].Body.toString().split('\n');
    public static Integer theSolve_Part1(){
        Integer highestRowHashNum = 0;
        for (String seatHash : dayFiveInput){
            String rowBinary = seatHash.substring(0, 7).reverse().replace('B', '1').replace('F', '0');
            String seatBinary = seatHash.substring(7).reverse().replace('R', '1').replace('L', '0');
            
            Integer rowNum = findIntFromBinaryString(rowBinary);
            Integer seatNum = findIntFromBinaryString(seatBinary);
            
            Integer thisRowHashNum = (rowNum * 8) + seatNum;

            if (thisRowHashNum > highestRowHashNum){
                highestRowHashNum = thisRowHashNum;
            }
        }
        
        return highestRowHashNum;
    }
    
    public static Integer theSolve_Part2(){
        
        Map<Integer,Set<Integer>> rowToSeatsMap = new Map<Integer,Set<Integer>>();
        Integer firstRow = 0;
        Integer lastRow = 0;
        Integer myRow;
        Integer mySeat;
        
        for (String seatHash : dayFiveInput){
            String rowBinary = seatHash.substring(0, 7).reverse().replace('B', '1').replace('F', '0');
            String seatBinary = seatHash.substring(7).reverse().replace('R', '1').replace('L', '0');
            
            Integer rowNum = findIntFromBinaryString(rowBinary);
            Integer seatNum = findIntFromBinaryString(seatBinary);
            
            if (!rowToSeatsMap.containsKey(rowNum)){
                rowToSeatsMap.put(rowNum, new Set<Integer>());
            }
            rowToSeatsMap.get(rowNum).add(seatNum);
            
            if (rowNum < firstRow){
                firstRow = rowNum;
            }
            
            if (rowNum > lastRow){
                lastRow = rowNum;
            }
        }
        
		Boolean foundViableRow = false;
        for (Integer i=firstRow; i<lastRow; i++){
            Integer numSeats = rowToSeatsMap.get(i)?.size();
            
            if (numSeats == 8){
                if (!foundViableRow){
                    foundViableRow = true;
                }
                continue;
            }else if (foundViableRow && numSeats != 8){
                myRow = i;
                for (Integer j=0; j<7; j++){
                    if (!rowToSeatsMap.get(i).contains(j)){
                        mySeat = j;
                        break;
                    }
                }
                break;
            }
            
        }

        return (myRow * 8) + mySeat;
    }
    
    
    
    public static Integer findIntFromBinaryString(String binaryString){
        Integer intValue = 0;
        Integer binaryMultiplier = 1;
        
        for (String binaryPart : binaryString.split('')){
            intValue += Integer.valueOf(binaryPart) * binaryMultiplier;
            binaryMultiplier *=2;
        }
        
        return intValue;
    }
}