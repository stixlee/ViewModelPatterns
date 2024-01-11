//
//  SharedView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct SharedPatternView: View {
    
    @StateObject var viewModel: SharedViewModel = SharedViewModel()
    
    var body: some View {
        VStack {
            SharedPatternHeaderView()
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
