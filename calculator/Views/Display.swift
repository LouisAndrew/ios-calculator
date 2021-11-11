//
//  Display.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

struct Display: View {
    var operations: String
    var value: String
    
    var body: some View {
        VStack {
            VStack {
                Text(operations)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.text)
                    .padding(.trailing, 16)
                    .padding(.bottom, 2)

                Text(value)
                    .fontWeight(.light)
                    .font(.system(size: 64))
                    .foregroundColor(.white)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.bottom, 32)
            .padding(.trailing, 32)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(AppColors.primary)
    }

}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display(operations: "1 + 2", value: "3")
    }
}
