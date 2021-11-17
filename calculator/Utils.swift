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
            return round(first / second)
        case "x":
            return round(first * second)
        case "-":
            return (first - second)
        case "+":
            return first + second
        default:
            return first
    }
}

func round(_ value: Float) -> Float {
    if value.truncatingRemainder(dividingBy: 1) != 0 {
        return (value * 1000).rounded() / 1000
    }

    return value
}

func asNumber(_ value: String) -> Float {
    return (value as NSString).floatValue
}

func asDisplay(_ value: Float) -> String {
    if value.truncatingRemainder(dividingBy: 1) != 0 {
        return "\(value)"
    }
    
    return String(format: "%.0f", value)
}

func validateRoman(_ value: String) -> Bool {
    let pattern = "^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})"
    let predicate = NSPredicate(format: "self MATCHES [c] %@", pattern)
    return predicate.evaluate(with: value)
}
