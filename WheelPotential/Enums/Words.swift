//
//  WordColorEnum.swift
//  WheelPotential
//
//  Created by Gregory Schroeder on 10/21/17.
//  Copyright © 2017 Schroeder Studios. All rights reserved.
//

import Foundation

enum Words: Int, CaseCountable {
    case Love
    case Gratitude
    case Joy
    case Passion
    case Happiness
    case Excitement
    case JoyfulExpectation
    case Hope
    case Satisfaction
    case Calm
    case Boredom
    case Annoyance
    case Worry
    case Blame
    case Anger
    case Revenge
    case Hate
    case Resentment
    case Guilt
    case Depression
    case Apathy
    case Fear
    
    var name: String {
        switch self {
        case .Love:
            return "Love"
        case .Gratitude:
            return "Gratitude"
        case .Joy:
            return "Joy"
        case .Passion:
            return "Passion"
        case .Happiness:
            return "Happiness"
        case .Excitement:
            return "Excitement"
        case .JoyfulExpectation:
            return "Joyful Expectation"
        case .Hope:
            return "Hope"
        case .Satisfaction:
            return "Satisfaction"
        case .Calm:
            return "Calm"
        case .Boredom:
            return "Boredom"
        case .Annoyance:
            return "Annoyance"
        case .Worry:
            return "Worry"
        case .Blame:
            return "Blame"
        case .Anger:
            return "Anger"
        case .Revenge:
            return "Revenge"
        case .Hate:
            return "Hate"
        case .Resentment:
            return "Resentment"
        case .Guilt:
            return "Guilt"
        case .Depression:
            return "Depression"
        case .Apathy:
            return "Apathy"
        case .Fear:
            return "Fear"
        }
    }
    
    var color: String {
        switch self {
        case .Love:
            return "00A651"
        case .Gratitude:
            return "00AB4E"
        case .Joy:
            return "0DB14B"
        case .Passion:
            return "50B848"
        case .Happiness:
            return "72BF44"
        case .Excitement:
            return "8DC63F"
        case .JoyfulExpectation:
            return "A6CE39"
        case .Hope:
            return "BFD730"
        case .Satisfaction:
            return "D7DF23"
        case .Calm:
            return "FFE17F"
        case .Boredom:
            return "FFCD67"
        case .Annoyance:
            return "FDBA4D"
        case .Worry:
            return "FAA634"
        case .Blame:
            return "F7941D"
        case .Anger:
            return "FBBEA7"
        case .Revenge:
            return "F9AA8F"
        case .Hate:
            return "F69679"
        case .Resentment:
            return "F58466"
        case .Guilt:
            return "F37053"
        case .Depression:
            return "F15B40"
        case .Apathy:
            return "EF4130"
        case .Fear:
            return "ED1C24"
        }
    }
    
    var value: Int {
        switch self {
        case .Love:
            return 11
        case .Gratitude:
            return 10
        case .Joy:
            return 9
        case .Passion:
            return 8
        case .Happiness:
            return 7
        case .Excitement:
            return 6
        case .JoyfulExpectation:
            return 5
        case .Hope:
            return 4
        case .Satisfaction:
            return 3
        case .Calm:
            return 2
        case .Boredom:
            return 1
        case .Annoyance:
            return -1
        case .Worry:
            return -2
        case .Blame:
            return -3
        case .Anger:
            return -4
        case .Revenge:
            return -5
        case .Hate:
            return -6
        case .Resentment:
            return -7
        case .Guilt:
            return -8
        case .Depression:
            return -9
        case .Apathy:
            return -10
        case .Fear:
            return -11
        }
    }
    
    static let caseCount = Words.countCases()
}
