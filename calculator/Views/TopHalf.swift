//
//  TopHalf.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

struct TopHalf: View {

    @State var value: String = "##"
    @State var operations: [String] = ["12", "+", "324"]

    var primaryColor: Color
    var body: some View {
        VStack {
            VStack {
                Text(join(self.operations))
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.text)
                    .padding(.trailing, 16)
                    .padding(.bottom, 2)

                Text(self.value)
                    .fontWeight(.light)
                    .font(.system(size: 64))
                    .foregroundColor(.white)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.bottom, 32)
            .padding(.trailing, 32)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(primaryColor)
    }
}

struct TopHalf_Previews: PreviewProvider {
    static var previews: some View {
        TopHalf(primaryColor: AppColors.primary)
    }
}

func join(_ array: [String]) -> String {
    return array.joined(separator: " ")
}
