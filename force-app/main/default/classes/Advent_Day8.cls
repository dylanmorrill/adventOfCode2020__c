public class Advent_Day8 {
    
    Public static List<String> dayThreeInput = [SELECT Body 
                                                FROM StaticResource 
                                                WHERE name = 'Day8'
                                                LIMIT 1][0].Body.toString().split('\n');
    
    public static List<instructionWrapper> instructionList = new List<instructionWrapper>();
    public static Integer sizeOfList;
    public static Integer accumulator = 0;
    public static List<Integer> elementsWeAlreadyFlipped = new List<Integer>();
    public static Set<Integer> elementsWeHaveSeen = new Set<Integer>();
    public static Boolean flippedThisRound;
    
    public static Integer theSolve_Part2(){
        for (String instructString : dayThreeInput){
            instructionList.add(new instructionWrapper(
                instructString.split(' ')[0],
                Integer.valueOf(instructString.split(' ')[1])
            	)           
            );
        }
        
        sizeOfList = instructionList.size();
        flippedThisRound = false;
        Boolean areWeDoneYet = false;
        
        while (!areWeDoneYet){
            integer passedNum;
            
            if (!elementsWeAlreadyFlipped.isEmpty()){
                passedNum = elementsWeAlreadyFlipped[elementsWeAlreadyFlipped.size()-1];
            }else{
                passedNum = 0;
            }
            
            findTheClearPath(passedNum );
            elementsWeHaveSeen.clear();
            flippedThisRound = false;
            
            if (returnString == 'WE GOT TO THE END!!!'){
                areWeDoneYet = true;
            }else{
                accumulator = accumRollback;
            }
        }
        return accumulator; 
    }
    
    private static Integer accumRollback;
    
    public static string returnString = '';
    
    public static void findTheClearPath(Integer elementNum){
        
        if (elementsWeHaveSeen.contains(elementNum)){
            returnString = 'Found duplicate element at | ' + elementNum;
            return;
        }else{
            elementsWeHaveSeen.add(elementNum);
        }
        
        if (sizeOfList-1 < elementNum){
            returnString = 'WE GOT TO THE END!!!';
            return;
        }
        
        instructionWrapper instruction = instructionList[elementNum];
        
        Switch on instruction.instruct{
            
            when 'acc'{
                accumulator += instruction.num;
                findTheClearPath(elementNum + 1);
                
            }when 'jmp'{
                if (!elementsWeAlreadyFlipped.contains(elementNum) && !flippedThisRound){
                    flippedThisRound = true;
                    elementsWeAlreadyFlipped.add(elementNum);
                    accumRollback = accumulator;
                    findTheClearPath(elementNum + 1); 
                }else{
                    findTheClearPath(elementNum + instruction.num);
                    
                }
            }when 'nop'{
                if (!elementsWeAlreadyFlipped.contains(elementNum) && !flippedThisRound && instruction.num != 0){
                    flippedThisRound = true;
                    elementsWeAlreadyFlipped.add(elementNum);
                    accumRollback = accumulator;
                    findTheClearPath(elementNum + (instruction.num)); 
                }else
                    findTheClearPath(elementNum + 1);
            }
        }
    }

    public class instructionWrapper{
        String instruct;
        Integer num;
        
        public instructionWrapper (String instruct, Integer num){
            this.instruct = instruct;
            this.num = num;
        }
    }
    

    public static String theSolve_Part1(){
        
        Map<Integer,String> keyToInstructWrapMap = new Map<Integer,String>();
        
        for (Integer i=0; i<dayThreeInput.size(); i++){
            keyToInstructWrapMap.put(i, dayThreeInput[i]);  
        }
        
        List<Integer> sawThem = new List<Integer>();
        Integer accumulator = 0;
        
        for (Integer i=0; i<keyToInstructWrapMap.size(); i++){
            
            String instructWrap = keyToInstructWrapMap.get(i);

            if (sawThem.contains(i)){
                break;
            }
            
            String instruct = instructWrap.split(' ')[0];
            Integer num = Integer.valueOf(instructWrap.split(' ')[1]);
            
            Switch on instruct{
                when 'acc'{
                    accumulator += num;
                }when 'jmp'{
                    i += num-1;
                }
            }
            
            sawThem.add(i);
        }
        return String.valueOf(accumulator);
    }
}