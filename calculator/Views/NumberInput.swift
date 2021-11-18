//
//  NumberInput.swift
//  calculator
//
//  Created by Louis Andrew on 18.11.21.
//

import SwiftUI

struct NumberInput: View {
    let rows = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "x"],
        ["1", "2", "3", "-"],
        [".", "0", "=", "+"]
    ]
    
    public var action: (String) -> Void;
    public var op: String?
    
    var body: some View {
        ForEach(rows, id: \.self) { row in
            HStack(alignment: .top, spacing: 0) {
                Spacer(minLength: 13)
                ForEach(row, id: \.self) { column in
                    Button(action: {
                        self.action(column)
                    }, label: {
                        Text(column)
                            .font(.system(size: getFontSize(column)))
                            .foregroundColor(getForegroundColor(column, self.op))
                            .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                    })
                        .background(getBackgroundColor(column, self.op))
                        .padding(.all, 4)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct NumberInput_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NumberInput(action: { value in
                
            }, op: "")
        }
        .background(AppColors.secondary)
        .frame(maxHeight: .infinity / 2)
    }
}


func getBackgroundColor(_ columnValue: String, _ op: String?) -> Color {
    if !isOperand(columnValue) {
        if op == columnValue {
            return AppColors.accent
        }
        return AppColors.primary
    }
    
    return AppColors.secondary
}

func getForegroundColor(_ columnValue: String, _ op: String?) -> Color {
    if op == columnValue {
        return AppColors.primary
    }
    
    return AppColors.text
}

func getFontSize(_ columnValue: String) -> CGFloat {
    if !isOperand(columnValue) {
        return 24
    }
    
    return 28
}
