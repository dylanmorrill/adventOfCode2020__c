public class Advent_Day8 {
    
    Public static List<String> dayThreeInput = [SELECT Body 
                                                FROM StaticResource 
                                                WHERE name = 'Day8'
                                                LIMIT 1][0].Body.toString().split('\n');
    
    public static List<instructionWrapper> instructionList = new List<instructionWrapper>();
    public static Integer sizeOfList;
    public static Integer accumulator = 0;
    public static Set<Integer> elementsWeAlreadyFlipped = new Set<Integer>();
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
            if (Limits.getCpuTime() > 1000){
                //areWeDoneYet = true;
            }
     
            findTheClearPath(0);
            elementsWeHaveSeen.clear();
            flippedThisRound = false;

            if (lalala == 'WE GOT TO THE END!!!'){
                areWeDoneYet = true;
            }else{
                accumulator = 0;
            }
        }
        
        System.debug(lalala);
        system.debug(accumulator);
        
        
        return null; 
    }
    
    public static string lalala = '';
    
    public static void findTheClearPath(Integer elementNum){

        if (elementsWeHaveSeen.contains(elementNum)){
            lalala = 'Found duplicate element at | ' + elementNum;
            return;
        }else{
            elementsWeHaveSeen.add(elementNum);
        }
        
        if (sizeOfList-1 < elementNum){
            lalala = 'WE GOT TO THE END!!!';
             return;
        }
        
        instructionWrapper instruction = instructionList[elementNum];
        
        
        
        Switch on instruction.instruct{
            
            when 'acc'{
                //system.debug(instruction);
                accumulator += instruction.num;
                findTheClearPath(elementNum + 1);
                
            }when 'jmp'{
                if (!elementsWeAlreadyFlipped.contains(elementNum) && !flippedThisRound){
                    //system.debug(instruction + 'replace!');
                    flippedThisRound = true;
                    elementsWeAlreadyFlipped.add(elementNum);
                    findTheClearPath(elementNum + 1);
                    
                }else{
                    //system.debug(instruction);
                    findTheClearPath(elementNum + instruction.num);
                    
                }
            }when 'nop'{
                if (!elementsWeAlreadyFlipped.contains(elementNum) && !flippedThisRound && instruction.num != 0){
                    //system.debug(instruction + 'replace!');
                    flippedThisRound = true;
                    elementsWeAlreadyFlipped.add(elementNum);
                    findTheClearPath(elementNum + (instruction.num));
                    
                }else{
                   
                    //system.debug(instruction);
                     findTheClearPath(elementNum + 1);
                }
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
    public class day8Wrap{
        String instructWrap;
        Boolean sawAlready;
        public day8Wrap(String instructWrap, Boolean sawAlready){
            this.instructWrap = instructWrap;
            this.sawAlready = sawAlready;
        }
    }
    
    
    
    public static String theSolve_Part1(){
        
        Map<Integer,String> keyToInstructWrapMap = new Map<Integer,String>();
        
        for (Integer i=0; i<dayThreeInput.size(); i++){
            keyToInstructWrapMap.put(i, dayThreeInput[i]);
            
        }
        
        
        
        system.debug(dayThreeInput.size());
        
        List<Integer> sawThem = new List<Integer>();
        
        Integer accumulator = 0;
        
        
        for (Integer i=0; i<keyToInstructWrapMap.size(); i++){
            
            String instructWrap = keyToInstructWrapMap.get(i);
            
            System.debug(i + ' |BEFORE| ' + keyToInstructWrapMap.get(i));
            
            if (i==601){
                instructWrap = instructWrap.replace('jmp', 'nop');
            }
            
            if (sawThem.contains(i)){
                //System.debug(i + ' | ' + keyToInstructWrapMap.get(i));
                //System.debug('210' + ' | ' + keyToInstructWrapMap.get(210));
                //System.debug(i + ' |in ' + keyToInstructWrapMap.get(i));
                return ('asdfasdf ' + string.valueOf(i));
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
            
            System.debug(i + ' |AFTER| ' + keyToInstructWrapMap.get(i));
            
            sawThem.add(i);
            
            
            
            
        }
        return null;
    }
}