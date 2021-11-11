//
//  ContentView.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

let operators = ["/", "x", "-", "+", "="]

struct ContentView: View {
    let rows = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "x"],
        ["1", "2", "3", "-"],
        [".", "0", "=", "+"]
    ]
    
    @State var value: String = "##"
    @State var operations: [String] = ["12", "+", "324"]

    var body: some View {
        VStack {
            Display(operations: join(self.operations), value: self.value)
            
             VStack {
                ForEach(rows, id: \.self) { row in
                    HStack(alignment: .top, spacing: 0) {
                        Spacer(minLength: 13)
                        ForEach(row, id: \.self) { column in
                            Button(action: {
                                //Action to be added later.
                            }, label: {
                                Text(column)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 32))
                                    .foregroundColor(getForegroundColor(column))
                                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                            })
                            .background(getBackgroundColor(column))
                            .padding(.all, 4)
                            .cornerRadius(20)
                        }
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding(16)
            .padding(.top, 32)
            .padding(.bottom, 32)
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

func isOperator(_ value: String) -> Bool {
    return operators.contains(value)
}

func getBackgroundColor(_ columnValue: String) -> Color {
    if isOperator(columnValue) {
        return AppColors.text
    }
    
    return AppColors.secondary
}

func getForegroundColor(_ columnValue: String) -> Color {
    if isOperator(columnValue) {
        return AppColors.primary
    }
    
    return AppColors.text
}

func join(_ array: [String]) -> String {
    return array.joined(separator: " ")
}