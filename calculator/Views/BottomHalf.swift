//
//  BottomHalf.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

struct BottomHalf: View {
    var primaryColor: Color
    var secondaryColor: Color 
    var body: some View {
        VStack {}
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(secondaryColor)
    }
}

struct BottomHalf_Previews: PreviewProvider {
    static var previews: some View {
        BottomHalf(primaryColor: AppColors.primary, secondaryColor: AppColors.secondary)
    }
}
