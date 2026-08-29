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
                .background(.regularMaterial)
                .overlay {
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
                }
                .overlay(alignment: .bottomLeading) {
                    Text("\(profile.name)")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundStyle(.white)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                        .matchedGeometryEffect(
                            id: "text_\(profile.id)",
                            in: animation,
                            properties: .position,
                            anchor: .topLeading
                        )
                        .padding(24)
                }

            // A ScrollView, not a List: a List lays out in its own pass and would land a
            // frame late, the same way NavigationStack does.
            List {
                row(
                    "Age",
                    value: "\(profile.age)",
                    systemImage: "birthday.cake.fill"
                )
                row(
                    "Followers",
                    value: profile.followers,
                    systemImage: "heart.fill"
                )
                row(
                    "Gender",
                    value: profile.gender,
                    systemImage: "person.fill"
                )
                row(
                    "Orientation",
                    value: profile.orientation,
                    systemImage: "heart.circle.fill"
                )
                row(
                    "Likes",
                    value: profile.likes,
                    systemImage: "hand.thumbsup.fill"
                )
                row(
                    "Dislikes",
                    value: profile.dislikes,
                    systemImage: "hand.thumbsdown.fill"
                )
                .background(
                    Color(uiColor: .secondarySystemGroupedBackground),
                    in: RoundedRectangle(cornerRadius: 12)
                )

                VStack(alignment: .leading, spacing: 8) {
                    Text("Bio")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                        .textCase(.uppercase)
                    Text(profile.bio)
                        .font(.body)
                }
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topTrailing) {
            Button(action: {
                onClose()
            }) {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .padding(4)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            .padding()
        }
    }

    private func row(_ title: String, value: String, systemImage: String)
        -> some View
    {
        LabeledContent {
            Text(value)
                .foregroundStyle(.secondary)
        } label: {
            Label(title, systemImage: systemImage)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    @Previewable @Namespace var namespace
    ProfileDetailView(profile: Profiles[1], animation: namespace, onClose: {})
}
