public class Advent_Day2 {
    
    private static final String MIN_SEPERATOR = '-';
    private static final String MAX_PWORD_SEPERATOR = ' ';
    private static final String CHAR_SEPERATOR = ':';
    
    public static Integer theSolve(){
        
        List<String> dayOneInput = [SELECT Body 
                                    FROM StaticResource 
                                    WHERE name = 'day2'
                                    LIMIT 1][0].Body.toString().split('\n');
        
        Integer theAnswer = 0;
        
        for (String row : dayOneInput){
            Integer firstPos = Integer.valueOf(row.substringBefore(MIN_SEPERATOR));
            Integer secondPos = Integer.valueOf(row.substringBetween(MIN_SEPERATOR, MAX_PWORD_SEPERATOR));
            
            String character = row.substringBetween(MAX_PWORD_SEPERATOR, CHAR_SEPERATOR);
            String password = row.substringAfterLast(MAX_PWORD_SEPERATOR);
            
            Integer numChars = password.countMatches(character);
            
            Boolean firstCheckGood = password.substring(firstPos-1, firstPos) == character;
            Boolean secondTestGood = password.substring(secondPos-1, secondPos) == character;
            
            if (firstCheckGood && !secondTestGood){
                theAnswer ++;
            }else if (!firstCheckGood && secondTestGood){
                theAnswer++;
            }
        }
        return theAnswer;
    }
}