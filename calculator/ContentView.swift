//
//  ContentView.swift
//  calculator
//
//  Created by Louis Andrew on 11.11.21.
//

import SwiftUI

struct ContentView: View {

    let textContent = "Stay Hungry. Stay Foolish."

    var body: some View {
        VStack {
            TopHalf(primaryColor: AppColors.primary)
            BottomHalf(primaryColor: AppColors.primary, secondaryColor: AppColors.secondary)
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
