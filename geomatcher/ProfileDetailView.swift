//
//  ProfileDetailView.swift
//  geomatcher
//
//  Created by Jiayi on 5/8/26.
//

//this is for when u click the small profile and it zooms with matched geometry to become something that fills up the screen


import SwiftUI
import SwiftData

struct ProfileDetailView: View {
    let profile: Profile
    var animation: Namespace.ID
    var onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image("bolognese")
                    .scaledToFill()
                    .matchedGeometryEffect(id: "image_\(profile.id)", in: animation)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                    .clipped()
                

                Button(action: onClose) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("\(profile.name), \(profile.age)")
                    .font(.largeTitle)
                    .bold()
                    .matchedGeometryEffect(id: "text_\(profile.id)", in: animation)
                
                Text(profile.bio)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(UIColor.systemBackground))
        }
        .matchedGeometryEffect(id: "card_\(profile.id)", in: animation)
        .ignoresSafeArea()
        .onTapGesture {
            onClose()
        }
    }
}
