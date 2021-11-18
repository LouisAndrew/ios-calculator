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
    if !value.isEmpty && validateRoman(value) {
        return romanToNumber(value.uppercased())
    }
    
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

let ROMAN_BASE_SYMBOLS = [
    (symbol: "CM", value: 900),
    (symbol: "CD", value: 400),
    (symbol: "XC", value: 90),
    (symbol: "XL", value: 40),
    (symbol: "IX", value: 9),
    (symbol: "IV", value: 4),
    (symbol: "M", value: 1000),
    (symbol: "D", value: 500),
    (symbol: "C", value: 100),
    (symbol: "L", value: 50),
    (symbol: "X", value: 10),
    (symbol: "V", value: 5),
    (symbol: "I", value: 1),
]

func romanToNumber(_ roman: String) -> Float {
    var value = 0
    var pos = roman.startIndex
    while pos != roman.endIndex {
        let current = roman[pos...]
        let foundSymbol = ROMAN_BASE_SYMBOLS.first { (symbol: String, value: Int) in
            return current.starts(with: symbol)
        }
        
        if foundSymbol != nil {
            value += foundSymbol?.value ?? 0
            pos = roman.index(pos, offsetBy: foundSymbol?.symbol.count ?? 0)
        } else {
            break
        }
    }
    return Float(value)
}
