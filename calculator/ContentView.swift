//
//  ContentView.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

struct ContentView: View {
    let rows = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "x"],
        ["1", "2", "3", "-"],
        [".", "0", "=", "+"]
    ]

    @State var inputValue: String = ""

    @State var op: String? = nil
    @State var value: Float = 0
    @State var displayValue: String = "##"
    @State var operations: [String] = ["12", "+", "324"]

    var body: some View {
        VStack {
            Display(operations: join(self.operations), value: self.displayValue)
            
             VStack {
                      
                HStack {
                    Button(action: {
                        // TODO: 
                        self.displayValue = "12"
                    }, label: {
                        Text("Input Roman")
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
        
                ForEach(rows, id: \.self) { row in
                    HStack(alignment: .top, spacing: 0) {
                        Spacer(minLength: 13)
                        ForEach(row, id: \.self) { column in
                            Button(action: {
                                if isOperand(column) {
                                    if column == "." {
                                        if self.inputValue.contains(".") {
                                           return
                                        }
                                    } 
                                    self.inputValue = "\(self.inputValue)\(column)"
                                    self.displayValue = self.inputValue
                                } else {
                                    if column == "=" {
                                        if inputValue != "" {
                                            self.value = compute(
                                                first: self.value,
                                                second: asNumber(self.inputValue),
                                                op: self.op
                                            )
                                            self.inputValue = ""
                                            self.op = nil
                                            self.displayValue = "\(self.value)"
                                        } else {
                                            self.value = 0
                                            self.op = nil
                                            self.displayValue = "0"
                                        }
                                    } else {
                                        if self.op != nil {
                                            self.value = compute(
                                                first: self.value,
                                                second: asNumber(self.inputValue),
                                                op: self.op
                                            )
                                            self.inputValue = ""
                                            self.displayValue = "\(self.value)"
                                        } else {
                                            self.value = asNumber(self.inputValue)
                                            self.inputValue = ""
                                        }
                                        self.op = column
                                    }
                                }
                            }, label: {
                                Text(column)
                                    .font(.system(size: getFontSize(column)))
                                    .foregroundColor(getForegroundColor(column))
                                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                            })
                            .background(getBackgroundColor(column, self.op))
                            .padding(.all, 4)
                            .cornerRadius(20)
                        }
                    }
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

func getBackgroundColor(_ columnValue: String, _ op: String?) -> Color {
    if !isOperand(columnValue) {
        return AppColors.primary
    }
    
    return AppColors.secondary
}

func getForegroundColor(_ columnValue: String) -> Color {
    return AppColors.text
}

func getFontSize(_ columnValue: String) -> CGFloat {
    if !isOperand(columnValue) {
        return 24
    }

    return 28
}
