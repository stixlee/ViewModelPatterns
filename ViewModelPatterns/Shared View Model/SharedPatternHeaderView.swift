//
//  SharedPatternHeaderView.swift
//  ViewModelPatterns
//
//  Created by Michael Lee on 1/10/24.
//

import SwiftUI

struct SharedPatternHeaderView: View {
    
    @ObservedObject var viewModel: SharedViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack(alignment: .center) {
                    Button {
                        print("Notifications tapped!")
                    } label: {
                        Image(systemName: "bell.fill")
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.primary)
                    }
                    Spacer()
                }
                .padding(.leading, 8)

                HStack(alignment: .center) {
                    Spacer()
                    Button {
                        print("Tapped Side View")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.headline)
                            .foregroundColor(Color.primary)
                    }
                }
                .padding(.trailing, 8)
                HStack(alignment: .center) {
                    Spacer()
                    Label(
                        title: {
                            Text(viewModel.title)
                                .font(.headline)
                        },
                        icon: {
                            Image(systemName: viewModel.icon)
                                .font(.headline)
                                .foregroundColor(viewModel.accentColor)
                                .padding(.trailing, 4)
                        }
                    )
                    Spacer()
                }
            }
            .padding(.bottom, 2)
            .padding(.top, 56)
        }
    }}

#Preview {
    SharedPatternHeaderView(viewModel: SharedViewModel(
        title: "Shared Pattern",
        icon: "house.fill",
        showSideMenu: false,
        accentColor: Color.blue)
    )
}
