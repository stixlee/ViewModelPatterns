//
//  SharedViewModel.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

@Observable final class SharedViewModel: ObservableObject {
    
    var title: String
    var icon: String
    var showSideMenu: Bool
    var accentColor: Color
    
    init(title: String, icon: String, showSideMenu: Bool, accentColor: Color) {
        self.title = title
        self.icon = icon
        self.showSideMenu = showSideMenu
        self.accentColor = accentColor
    }
    
}
