//
//  geomatcherApp.swift
//  geomatcher
//
//  Created by T Krobot on 1/8/26.
//

// this is for the individual person's icons/small photos for when you scroll the home page

import SwiftUI

struct ProfileCardView: View {
    let profile: Profile
    let animation: Namespace.ID
    var isSelected: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: -8) {
            ZStack(alignment: .bottomLeading) {
                // While this profile is open we swap in an invisible copy that carries no
                // matchedGeometryEffect. That removes the real one from the matched group
                // (which is what drives the transition) without tearing down the grid cell,
                // so the layout underneath never moves.
                if isSelected {
                    picture.hidden()
                } else {
                    picture
                        .matchedGeometryEffect(
                            id: "image_\(profile.id)",
                            in: animation
                        )
                }

                Rectangle()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.clear, .black],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )
                    .matchedGeometryEffect(
                        id: "black_\(profile.id)",
                        in: animation
                    )

                if isSelected {
                    name.hidden()
                } else {
                    name
                        // .position only, not the default .frame: the card uses .title2 and
                        // the detail view uses .largeTitle, and matching frames across two
                        // different font sizes squashes the text instead of moving it.
                        .matchedGeometryEffect(
                            id: "text_\(profile.id)",
                            in: animation,
                            properties: .position,
                            anchor: .topLeading
                        )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(8)

            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "birthday.cake.fill")
                    Text("\(profile.age)")
                        .font(.callout)
                        .bold()
                }
                Divider()
                    .frame(height: 20)
                    .padding(4)
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    Text("\(profile.followers)")
                        .font(.callout)
                        .bold()
                }
            }
            .padding(8)
        }
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.15), radius: 6, x: 3, y: 3)
    }

    private var picture: some View {
        Image(profile.picture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, minHeight: 0)
            .aspectRatio(1, contentMode: .fit)
    }

    private var name: some View {
        Text("\(profile.name)")
            .font(.system(.title2, design: .rounded))
            .bold()
            .foregroundStyle(.white)
            .fixedSize(horizontal: false, vertical: true)
            .padding(12)
    }
}

#Preview {
    @Previewable @Namespace var namespace
    ProfileCardView(profile: Profiles[4], animation: namespace)
        .frame(width: 200)
        .fixedSize(horizontal: false, vertical: true)
}
