//
//  ContentView.swift
//  geomatcher
//
//  Created by T Krobot on 1/8/26.
//

// main page where the ppl scroll profiles

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var selectedProfile: Profile? = nil

    var body: some View {
        ZStack {
            if let profile = selectedProfile {
                ProfileDetailView(profile: profile, animation: animation) {
                    withAnimation(.snappy) {
                        selectedProfile = nil
                    }
                }
            } else {
                NavigationStack {
                    ScrollView {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()), GridItem(.flexible()),
                            ],
                            spacing: 16
                        ) {
                            ForEach(Profiles) { profile in
                                ProfileCardView(
                                    profile: profile,
                                    animation: animation
                                )
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        selectedProfile = profile
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Geomatcher")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
