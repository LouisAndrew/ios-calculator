//
//  RomanInput.swift
//  calculator
//
//  Created by Louis Andrew on 15.11.21.
//

import SwiftUI

struct RomanInput: View {
    public var action: (String) -> ()

    @State var isInvalidRoman: Bool = false
    @State var inputValue: String = ""
    
    var body: some View {
                    
             VStack {

                 Text("Roman numeral")
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.text)
                    .frame(maxWidth: .infinity, alignment: .leading)

                 TextField("Roman numeral", text: $inputValue)
                     .textCase(.uppercase)
                     .foregroundColor(.white)
                     .padding(.top, 8)
                     .padding(.bottom, 20)

                
                
                HStack {

                    Button(action: {
                        let valid = validateRoman(self.inputValue)
                        if valid {
                            self.action(self.inputValue)
                        } else {
                            self.isInvalidRoman = true
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
