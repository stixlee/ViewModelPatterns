//
//  ViewModelPatternsApp.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

@main
struct ViewModelPatternsApp: App {
    
    @StateObject var viewModel = SharedViewModel()
        
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
