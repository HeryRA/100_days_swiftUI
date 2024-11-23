//
//  Objects.swift
//  Habit-tracker
//
//  Created by RATSIMANOSIKA HERY on 11/11/2024.
//

import Foundation
import Observation

struct Habit: Hashable {
    let title: String
    let motivation: String
}

@Observable
class Activities {
    var classification: [(key: String, value: [Habit])] = [
        ("health", [Habit]()),
        ("relationship", [Habit]()),
        ("spiritual", [Habit]()),
        ("financial", [Habit]()),
        ("selfDevelopment", [Habit]()),
        ("career", [Habit]()),
        ("environment", [Habit]()),
        ("others", [Habit]())
    ]
}
