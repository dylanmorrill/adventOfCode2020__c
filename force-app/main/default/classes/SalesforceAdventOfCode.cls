public class SalesforceAdventOfCode {
    
    public static void runSolutions(Integer whichDay, Integer whichSolve){
        
        switch on whichDay{
            when 1{
                System.debug(Advent_Day1.theSolve());
            }when 2{
                System.debug(Advent_Day2.theSolve());
            }when 3{
                System.debug(Advent_Day3.theSolve());
            }when 4{
                System.debug(Advent_Day4.theSolve());
            }when 5{
                switch on whichSolve{
                    when 1{
                        System.debug(Advent_Day5.theSolve_Part1());
                    }when 2{
                        System.debug(Advent_Day5.theSolve_Part2());
                    }
                }
            }when 6{
                switch on whichSolve{
                    when 1{
                        System.debug(Advent_Day6.theSolve_Part1());
                    }when 2{
                        System.debug(Advent_Day6.theSolve_Part2());
                    }
                }
            }    
        }
        
    }
}