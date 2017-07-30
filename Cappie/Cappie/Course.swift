//
//  Course.swift
//  Cappie
//
//  Created by Scott Wallace on 2017-07-29.
//  Copyright © 2017 Scott Wallace. All rights reserved.
//

class Course {
    
    var name: String
    var par: Int
    var rating: Double
    var slope: Int
    
    init(name: String, par: Int, rating: Double, slope: Int) {
        self.name = name
        self.par = par
        self.rating = rating
        self.slope = slope
    }
}
