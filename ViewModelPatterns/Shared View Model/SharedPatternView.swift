//
//  SharedView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct SharedPatternView: View {
    
    @StateObject var viewModel: SharedViewModel = SharedViewModel(
        title: "Shared Pattern",
        icon: "house.fill",
        showSideMenu: false,
        accentColor: Color.blue)
    
    var body: some View {
        VStack {
            SharedPatternHeaderView(viewModel: viewModel)
            Spacer()
            VStack {
                Spacer()
                Text("Shared Pattern")
                Spacer()
            }
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])
    }
}

#Preview {
    SharedPatternView()
}
