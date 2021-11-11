//
//  TopHalf.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

struct TopHalf: View {
    var primaryColor: Color
    var body: some View {
        VStack {}
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(primaryColor)
    }
}

struct TopHalf_Previews: PreviewProvider {
    static var previews: some View {
        TopHalf(primaryColor: AppColors.primary)
    }
}
