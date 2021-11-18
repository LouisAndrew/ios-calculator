//
//  RomanInput.swift
//  calculator
//
//  Created by Louis Andrew on 15.11.21.
//

import SwiftUI

struct RomanInput: View {
    public var action: (String) -> Void
    
    @State var isValidRoman: Bool = true
    @State var inputValue: String = ""
    
    var body: some View {
        
        VStack {
            
            Text("Roman numeral")
                .font(.system(size: 24))
                .foregroundColor(AppColors.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(AppColors.primary)
                    .frame(height: 48)
                
                TextField("Roman numeral", text: $inputValue)
                    .onChange(of: self.inputValue, perform: { newValue in
                        self.isValidRoman = validateRoman(newValue.uppercased())
                    })
                    .font(.system(size: 24))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                
            }
            .padding(.top, 12)
            .padding(.bottom, 6)
            
            if !self.inputValue.isEmpty {
                let textContent = self.isValidRoman ? "Input valid" : "!! Input value is not a roman numeral"
                let textColor = self.isValidRoman ? AppColors.text : Color.red
                
                Text(textContent)
                    .font(.system(size: 16))
                    .foregroundColor(textColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            HStack {
                
                Button(action: {
                    if isValidRoman {
                        self.action(self.inputValue)
                        self.inputValue = ""
                    }
                }, label: {
                    Text("Confirm")
                        .font(.system(size: 20))
                        .foregroundColor(AppColors.text)
                        .padding(.all, 8)
                        .padding(.trailing, 16)
                        .padding(.leading, 16)
                })
                    .background(AppColors.primary)
                    .frame(idealHeight: 25, alignment: .leading)
                    .cornerRadius(16)
            }
            .padding(.top, 6)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding(16)
        .padding(.bottom, 20)
        .padding(.top, 20)
        .background(AppColors.secondary)
    }
}

struct RomanInput_Previews: PreviewProvider {
    static var previews: some View {
        RomanInput { String in
            
        }
    }
}
