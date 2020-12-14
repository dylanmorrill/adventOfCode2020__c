public class Advent_Day7 {
    private static List<String> daySevenInput = [SELECT Body 
                                               FROM StaticResource 
                                               WHERE name = 'day7'
                                               LIMIT 1][0].Body.toString().split('\n');
    
    private static final String SHINY_GOLD = 'clearyellow';
    
    public static Integer numBagsSolve2 = 0;
    public static Map<String,Map<String,Integer>> colorToValidColorsMapSolve2 = new Map<String,Map<String,Integer>>();
    
    public static String formatChildColor(String childColor, Set<String> stringsToReplace){
        for (String toReplace : stringsToReplace){
           childColor = childColor.replaceAll(toReplace, '');
        }
        System.debug(childColor);
        return childColor;
    }
    
    public static Integer theSolve_Part1(){
        Map<String,Set<String>> colorToValidColorsMap = new Map<String,Set<String>>();
        Set<String> colorsCanHaveShinyGold = new Set<String>();
        Set<String> stringsToReplace = new Set<String>{
            '[0-9]',
            ' ',
            'bags',
            'bag',
            'contain',
            '\\.'
        };

        for (String s : daySevenInput){
            Integer firstBreak = s.indexOf('bags')-1;
            
            String thisColor = s.substring(0, firstBreak).replaceAll(' ', '');
            Set<String> childColorsList = new Set<String>(formatChildColor(s.substring(firstBreak), stringsToReplace).split(','));
            
            if (childColorsList.contains(SHINY_GOLD)){
                colorsCanHaveShinyGold.add(thisColor);
            }

            colorToValidColorsMap.put(thisColor, childColorsList);
        }
        
        Boolean didWeFindAnyNewOnes = false;
        do {
            didWeFindAnyNewOnes = false;
            
            for (String color : colorToValidColorsMap.keySet()){
                Set<String> childColorsList = colorToValidColorsMap.get(color);
                
                Integer origSize = childColorsList.size();
                childColorsList.removeAll(colorsCanHaveShinyGold);
                Integer newSize = childColorsList.size();
                
                didWeFindAnyNewOnes = origSize != newSize;
                if (didWeFindAnyNewOnes){
                    colorsCanHaveShinyGold.add(color);
                } 
            }
        }while (didWeFindAnyNewOnes);
        
        return colorsCanHaveShinyGold.size();
    }
    
    public static Integer theSolve_Part2(){
       	Set<String> stringsToReplace = new Set<String>{
            'bags',
            'bag',
            'contain',
            '\\.',
                'no other'
        };
            
        for (String s : daySevenInput){
            Integer firstBreak = s.indexOf('bags')-1;
            
            String thisColor = s.substring(0, firstBreak).replaceAll(' ', '');
            List<String> childColorsList = formatChildColor(s.substring(firstBreak), stringsToReplace).split(',');
            
            colorToValidColorsMapSolve2.put(thisColor, new Map<String,Integer>());
            
            for (String otherColorsWithNum : childColorsList){  
                String theColor = '';
                Integer theNum;

                for (String specificChars : otherColorsWithNum.split(' ')){
                    
                    if (specificChars == ''){
                        continue;
                    }
                    
                    if (theNum == null){
                        theNum = Integer.valueOf(specificChars);
                        continue;
                    }
                    
                    theColor += specificChars;
                }
                colorToValidColorsMapSolve2.get(thisColor).put(theColor, theNum);
                
            }

        }
        
        findNumBags(SHINY_GOLD);
        system.debug(theint);
        return numBagsSolve2;
    }
    
    static integer theint = 0;

    
    public static void findNumBags(String parentColor){
        for (String childColor : colorToValidColorsMapSolve2.get(parentColor).keySet()){
            Integer numBags = colorToValidColorsMapSolve2.get(parentColor).get(childColor);
            
            for (Integer i=0; i<numBags; i++){
                numBagsSolve2 ++;
                theint ++;
                findNumBags(childColor);
            }
        }
    }
}