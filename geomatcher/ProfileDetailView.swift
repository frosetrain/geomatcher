//
//  ProfileDetailView.swift
//  geomatcher
//
//  Created by Jiayi on 5/8/26.
//

// this is for when u click the small profile and it zooms with matched geometry to become something that fills up the screen

import SwiftUI

struct ProfileDetailView: View {
    let profile: Profile
    let animation: Namespace.ID
    let onClose: () -> Void

    var body: some View {
        NavigationStack {
            VStack {
                // Top image
                ZStack(alignment: .topLeading) {
                    Image(profile.picture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, minHeight: 0)
                        .aspectRatio(1, contentMode: .fit)
                        .matchedGeometryEffect(
                            id: "image_\(profile.id)",
                            in: animation
                        )
                }
                .toolbar {
                    Button(action: onClose) {
                        Image(systemName: "xmark")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("\(profile.name)")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .matchedGeometryEffect(
                            id: "text_\(profile.id)",
                            in: animation
                        )
                        .fixedSize(horizontal: true, vertical: true)
                    Text(profile.bio)
                        .font(.title3)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(UIColor.systemBackground))
            }
            .matchedGeometryEffect(id: "card_\(profile.id)", in: animation)
            .ignoresSafeArea()
        }
    }
}

// Provide a dummy namespace for previewing
struct ProfileDetailPreview: PreviewProvider {
    struct Container: View {
        @Namespace var dummyNamespace
        var body: some View {
            ProfileDetailView(
                profile: Profiles[1],
                animation: dummyNamespace,
                onClose: {}
            )
        }
    }
    static var previews: some View {
        Container()
    }
}
