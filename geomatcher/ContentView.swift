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
            // The grid stays mounted the whole time. matchedGeometryEffect animates an
            // inserted view out of the frame of the *removed* view with the same id, so
            // the card that supplies that frame has to still be alive and laid out when
            // the detail view appears.
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
                                animation: animation,
                                isSelected: selectedProfile?.id == profile.id
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
            .disabled(selectedProfile != nil)

            if let profile = selectedProfile {
                ProfileDetailView(profile: profile, animation: animation) {
                    withAnimation(.snappy) {
                        selectedProfile = nil
                    }
                }
                .zIndex(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
