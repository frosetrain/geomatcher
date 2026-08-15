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
        // No NavigationStack here on purpose: it lays its content out in its own pass,
        // which lands a frame after the transition starts and makes the detail view snap
        // into place instead of growing out of the card.
        VStack(spacing: 0) {
            Image(profile.picture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, minHeight: 0)
                .aspectRatio(1, contentMode: .fit)
                .matchedGeometryEffect(
                    id: "image_\(profile.id)",
                    in: animation
                )

            VStack(alignment: .leading, spacing: 8) {
                Text("\(profile.name)")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .fixedSize(horizontal: false, vertical: true)
                    .matchedGeometryEffect(
                        id: "text_\(profile.id)",
                        in: animation,
                        properties: .position,
                        anchor: .topLeading
                    )
                Text(profile.bio)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(uiColor: .systemBackground))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .overlay(alignment: .topTrailing) {
            Button(action: {
                onClose()
            }) {
                Image(systemName: "xmark")
                    .padding(4)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            .padding()
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
