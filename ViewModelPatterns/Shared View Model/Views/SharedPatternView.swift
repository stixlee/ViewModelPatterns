//
//  SharedView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct SharedPatternView: View {
    
    @EnvironmentObject var sharedAppViewModel: SharedAppViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Color.appBackground
                VStack {
                    // Header View
                    SharedPatternHeaderView()
                        .environmentObject(sharedAppViewModel.headerViewModel)
                    
                    VStack {
                        ScrollView(.vertical, showsIndicators: false) {
                            // Market Snapshot
                            PanelView()
                                .environmentObject(sharedAppViewModel)
                                .padding([.leading, .trailing], 18)
                                .padding(.bottom, 24)
                            
                        }
                    }
                    .padding([.leading, .trailing], 8)
                    .padding(.top, 18)
                    Spacer()
                }
            }
            Spacer()
            Divider()
                .padding(0)
        }
        .edgesIgnoringSafeArea([.leading, .trailing, .top])
        .refreshable {
            await sharedAppViewModel.loadData()
        }
        .task {
            await sharedAppViewModel.loadData()
        }
    }
}

#Preview {
    SharedPatternView()
        .environmentObject(SharedAppViewModel())
    
}
