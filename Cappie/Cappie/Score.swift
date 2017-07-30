//
//  Score.swift
//  Cappie
//
//  Created by Scott Wallace on 2017-07-29.
//  Copyright © 2017 Scott Wallace. All rights reserved.
//

class Score {
    
    var course: Course
    var strokes: Int
    
    init(course: Course, strokes: Int) {
        self.course = course
        self.strokes = strokes
    }
}
