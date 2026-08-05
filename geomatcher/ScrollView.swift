//
//  ContentView.swift
//  geomatcher
//
//  Created by T Krobot on 1/8/26.
//



//main page where the ppl scroll profiles


import SwiftUI

struct ProfileFeedView: View {
    @Namespace private var animation
    @State private var selectedProfile: Profile? = nil
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(ExampleProfiles) { profile in
                        if selectedProfile?.id != profile.id {
                            ProfileCardView(profile: profile, animation: animation)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        selectedProfile = profile
                                    }
                                }
                        }
                        
                        else {
                            Color.clear
                                .frame(height: 200)
                        }
                    }
                }
                .padding()
            }
            
            if let profile = selectedProfile {
                ProfileDetailView(profile: profile, animation: animation) {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        selectedProfile = nil
                    }
                    
                }
            }
        }
    }
}
