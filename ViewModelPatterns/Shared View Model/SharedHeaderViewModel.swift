//
//  SharedViewModel.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

@Observable final class SharedHeaderViewModel: ObservableObject {
    
    var title: String
    var icon: String
    var showSideMenu: Bool
    var accentColor: Color
    
    init() {
        self.title = "Shared Pattern"
        self.icon = "house.fill"
        self.showSideMenu = false
        self.accentColor = .blue
    }
    
}
