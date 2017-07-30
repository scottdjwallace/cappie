//
//  HandicapCalculator.swift
//  Cappie
//
//  Created by Scott Wallace on 2017-07-29.
//  Copyright © 2017 Scott Wallace. All rights reserved.
//

class HandicapCalculator {
    
    var numOfRounds: Int
    var scores = [Score]()
    
    init() {
        self.numOfRounds = 8
        
        // Courses
        let millRunHighland = Course(name: "Mill Run Highland", par: 59, rating: 56.1, slope: 81)
        let millRunChampionship = Course(name: "Mill Run Championship", par: 72, rating: 68.5, slope: 129)
        let colonadde = Course(name: "Colonadde", par: 71, rating: 68.8, slope: 112)
        
        // Scores
        let testScore1 = Score(course: colonadde, strokes: 95)
        let testScore2 = Score(course: millRunChampionship, strokes: 103)
        let testScore3 = Score(course: millRunHighland, strokes: 77)
        let testScore4 = Score(course: millRunHighland, strokes: 75)
        let testScore5 = Score(course: millRunHighland, strokes: 75)
        let testScore6 = Score(course: millRunHighland, strokes: 76)
        let testScore7 = Score(course: millRunHighland, strokes: 82)
        let testScore8 = Score(course: millRunHighland, strokes: 71)
        
        self.scores = [
            testScore1,
            testScore2,
            testScore3,
            testScore4,
            testScore5,
            testScore6,
            testScore7,
            testScore8,
        ];
    }
    
    func calculate() -> String {
        
        // 1. Load scores & num of rounds (5-20)
        // Using test data for now
        
        // 2. Calculate the differentials
        var differentials = [Double]()
        for score in scores {
            differentials.append(calculateDifferential(score: score))
        }
        
        // 3. Determine # of differentials to use
        let numOfDifferentialsToUse = getNumOfDifferentialsToUse(numOfRounds: numOfRounds)
        
        // 4. Select lowest "numOfDifferentialsToUse" to use in calculation
        let differentialsToUse = getDifferentialsToUse(numOfDifferentialsToUse: numOfDifferentialsToUse, differentials: differentials)
        
        // 5. Calc the handicap index = (Sum of differentials / number of differentials) * 0.96
        let index = calcAverageOfDifferentials(differentialsToUse: differentialsToUse, numOfDifferentialsToUse: numOfDifferentialsToUse) * 0.96
        
        return String(format:"%.2f", index)
    }
    
    func calculateDifferential(score: Score) -> Double {
        return (Double(score.strokes) - score.course.rating) * 113.0 / Double(score.course.slope)
    }
    
    
    func getNumOfDifferentialsToUse(numOfRounds: Int) -> Int {
        // diffs = [ numOfRounds: numOfDifferentialsToUse ]
        var diffs = [
            5: 1,
            6: 1,
            7: 2,
            8: 2,
            9: 3,
            10: 3,
            11: 4,
            12: 4,
            13: 5,
            14: 5,
            15: 6,
            16: 6,
            17: 7,
            18: 8,
            19: 9,
            20: 10
        ]
        
        return diffs[numOfRounds]!
    }
    
    func getDifferentialsToUse(numOfDifferentialsToUse: Int, differentials: [Double]) -> [Double] {
        // returns the num value of lowest differentials in an array
        // get the num of lowest diffs and return those in a list,
        // sort, then return the subset
        var new = differentials.sorted()
        print("sprted list \(new)")
        let it: [Double] = Array(new[0...numOfDifferentialsToUse-1])
        print("subset list \(it)")
        return it
    }
    
    func calcAverageOfDifferentials(differentialsToUse: [Double], numOfDifferentialsToUse: Int) -> Double {
        var total = 0.0
        for d in differentialsToUse {
            total += d
        }
        
        return total / Double(numOfDifferentialsToUse)
    }

}
