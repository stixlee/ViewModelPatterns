//
//  PanelView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct PanelView: View {
    
    @EnvironmentObject var appViewModel: SharedAppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(appViewModel.panelTitle)
                .padding(.leading, 24)
                .font(.subheadline)
            ZStack {
                VStack(alignment: .leading, spacing: 18) {
                    ForEach(appViewModel.itemViewModels) { itemViewModel in
                        ItemView()
                            .environmentObject(itemViewModel)
                        if itemViewModel.shortName != (appViewModel.itemViewModels.last?.shortName ?? "") {
                            Divider()
                                  .frame(minHeight: 1)
                                  .background(Color.gray)
                                  .padding(.leading, 24)
                        }
                    }
                }
            }
            .padding([.top, .bottom], 18)
            .background(Color.panelBackground)
                .cornerRadius(15)
        }    }
}

#Preview {
    PanelView()
        .environmentObject(SharedAppViewModel())
}
