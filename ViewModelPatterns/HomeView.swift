//
//  HomeView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct HomeView: View {
    let sideMenuWidth = 100.0
    
    @State var showSideView: Bool = false
    
    var body: some View {
        ZStack {
            TabView {
                
                SharedPatternView()
                    .tabItem {
                        Label("Shared", systemImage: "house.fill")
                    }
                PlaceholderView()
                    .tabItem {
                        Label("Aggregate", systemImage: "bitcoinsign.circle.fill")
                    }
                PlaceholderView()
                    .tabItem {
                        Label("Composite", systemImage: "sunglasses.fill")
                    }
                PlaceholderView()
                    .tabItem {
                        Label("Isolated", systemImage: "graduationcap.fill")
                    }
                PlaceholderView()
                    .tabItem {
                        Label("Binding", systemImage: "person.fill")
                    }
            }
            .background(Color.primary)
            .accentColor(.orange)
        }

    }
}

#Preview {
    HomeView()
}
