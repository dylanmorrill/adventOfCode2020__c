public class Advent_Day6 {
    
    private static List<String> daySixInput = [SELECT Body 
                                               FROM StaticResource 
                                               WHERE name = 'day6'
                                               LIMIT 1][0].Body.toString().split('\n\n');
    
    public static Integer theSolve_Part1(){
        
        Integer answer = 0;
        for (String customsFormGroup : daySixInput){
            answer += new Set<String>(customsFormGroup.replaceAll('\n', '').split('')).size();
        }
        
        return answer;
    }
    
    public static Integer theSolve_Part2(){
        
        Integer answer = 0;
        
        for (String customsFormGroup : daySixInput){
            Map<String,Integer> yesAnswerToNumberMap = new Map<String,Integer>();
            
            List<String> customForms = customsFormGroup.split('\n');
            Integer numPeople = customForms.size();
            
            for (String customForm : customsFormGroup.split('\n')){
                for (String formData : customForm.split('')){
                    if (!yesAnswerToNumberMap.containsKey(formData)){
                        yesAnswerToNumberMap.put(formData, 0);
                    }
                    
                    Integer currentOccurrences = yesAnswerToNumberMap.get(formData) + 1;
                    yesAnswerToNumberMap.put(formData, currentOccurrences);
                    
                    if ((currentOccurrences) == numPeople){
                        answer ++;
                    }
                }
            }
        }
        
        return answer;
    }
    
}