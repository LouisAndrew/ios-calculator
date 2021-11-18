//
//  ContentView.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

let nullInputIdentifier = "#"

struct ContentView: View {
    
    @State var inputValue: String = ""
    
    @State var op: String? = nil
    @State var value: Float = 0
    @State var displayValue: String = nullInputIdentifier
    @State var operations: [String] = []
    @State var isRomanInputDisplayed = false
    
    var body: some View {
        VStack {
            Display(operations: join(self.operations), value: self.displayValue)
            
            VStack {
                
                HStack {
                    Button(action: {
                        self.isRomanInputDisplayed.toggle()
                    }, label: {
                        Text(self.isRomanInputDisplayed ? "Display default view" :  "Display roman input")
                            .font(.system(size: 20))
                            .foregroundColor(AppColors.text)
                            .padding(.all, 8)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                    })
                        .background(AppColors.primary)
                        .frame(minHeight: 20, idealHeight: 25, alignment: .leading)
                        .cornerRadius(16)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if isRomanInputDisplayed  {
                    RomanInput(action: { romanInput in
                        let uppercased = romanInput.uppercased()
                        self.inputValue = uppercased
                        self.displayValue = uppercased
                        self.isRomanInputDisplayed.toggle()
                    })
                } else {
                    NumberInput(action: { column in
                        if isOperand(column) {
                            if !self.inputValue.isEmpty && validateRoman(self.inputValue) {
                                // todo: handle roman + number input
                                return
                            }
                            
                            if column == "." {
                                // Ignore if the current input is already a decimal number
                                if self.inputValue.contains(".") {
                                    return
                                }
                            }
                            
                            self.inputValue = "\(self.inputValue)\(column)"
                            self.displayValue = self.inputValue
                        } else {
                            if column == "=" {
                                if op != nil {
                                    // Compute the operation
                                    let second = self.inputValue
                                    let first = self.value
                                    self.value = compute(
                                        first: first,
                                        second: asNumber(second),
                                        op: self.op
                                    )
                                    
                                    // Display operations
                                    self.operations = [asDisplay(first), "\(self.op ?? "")", second]
                                    self.inputValue = "\(self.value)"
                                    self.op = nil
                                    self.displayValue = "\(asDisplay(self.value))" // Display the result
                                } else {
                                    
                                    // Clear input
                                    self.value = 0
                                    self.op = nil
                                    self.inputValue = ""
                                    self.displayValue = nullInputIdentifier
                                    self.operations = []
                                }
                            } else {
                                if self.op != nil {
                                    // Compute result and then save the operator
                                    let first = self.value
                                    let second = self.inputValue
                                    
                                    self.value = compute(
                                        first: first,
                                        second: asNumber(second),
                                        op: self.op
                                    )
                                    
                                    self.operations = [asDisplay(first), "\(self.op!)", second]
                                    self.inputValue = ""
                                    self.displayValue = "\(asDisplay(self.value))"
                                } else {
                                    // Save the input to be the current value and save the operator
                                    self.operations = [self.inputValue]
                                    self.value = asNumber(self.inputValue)
                                    self.inputValue = ""
                                    self.displayValue = nullInputIdentifier
                                }
                                self.op = column
                            }
                        }
                    }, op: self.op)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding(16)
            .padding(.bottom, 20)
            .padding(.top, 20)
            .background(AppColors.secondary)
        }
        .background(AppColors.secondary)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 

