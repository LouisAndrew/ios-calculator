//
//  Utils.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import Foundation

let operators = ["/", "x", "-", "+", "="]

func isOperand(_ value: String) -> Bool {
    return !operators.contains(value)
}

func join(_ array: [String]) -> String {
    return array.joined(separator: " ")
}

func compute(first: Float, second: Float, op: String?) -> Float {
    if op == nil {
        return first
    }

    switch op {
        case "/":
            return first / second
        case "x":
            return first * second
        case "-":
            return first - second
        case "+":
            return first + second
        default:
            return first
    }
}

func asNumber(_ value: String) -> Float {
    return (value as NSString).floatValue
}
