public class Advent_Day3 {
    private static final Integer ROW_SIZE = 31;
    
    Public static List<String> dayThreeInput = [SELECT Body 
                                                FROM StaticResource 
                                                WHERE name = 'day3'
                                                LIMIT 1][0].Body.toString().split('\n');
    
    public static Integer theSolve(){
        Integer one = theHelper(1,1);
        Integer two = theHelper(3,1);
        Integer three = theHelper(5,1);
        Integer four = theHelper(7,1);
        Integer five = theHelper(1,2);
        
        return one*two*three*four*five;
    }
    
    public static Integer theHelper(Integer numRight, Integer numDown){

        Integer whatColumnBaby = 0;
        Integer howManyTreesHomie = 0;
        Integer noTreeHere = 0;
        
        for (Integer i=0; i<dayThreeInput.size(); i+=numDown){
            String thisRow = dayThreeInput[i];
            
            if (whatColumnBaby >= ROW_SIZE){
                whatColumnBaby -= ROW_SIZE;
            }
            Boolean doWeHaveATree = thisRow.charAt(whatColumnBaby) == 35;
            
            if (doWeHaveATree){
                howManyTreesHomie ++;
            }else{
                noTreeHere ++;
            }
            
            whatColumnBaby += numRight; 
            
        }
        return howManyTreesHomie;
    }
}