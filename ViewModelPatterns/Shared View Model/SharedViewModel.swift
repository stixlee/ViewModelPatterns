//
//  SharedViewModel.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

@Observable final class SharedViewModel: ObservableObject {
    
    var sharedScreenTitle: String
    var sharedScreenIcon: String
    var showSideMenu: Bool
    var accentColor: Color
    
    init(sharedScreenTitle: String, sharedScreenIcon: String, showSideMenu: Bool, accentColor: Color) {
        self.sharedScreenTitle = sharedScreenTitle
        self.sharedScreenIcon = sharedScreenIcon
        self.showSideMenu = showSideMenu
        self.accentColor = accentColor
    }
    
    init() {
        self.sharedScreenTitle = "Shared Pattern"
        self.sharedScreenIcon = "house.fill"
        self.showSideMenu = false
        self.accentColor = .blue
    }
    
}
