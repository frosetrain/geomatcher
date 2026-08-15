//
//  TextResizeUtils.swift
//  geomatcher
//
//  Created by T Krobot on 8/8/26.
//

// Taken from
// https://stackoverflow.com/questions/70298791/is-it-possible-to-resize-text-with-matched-geometry-effect

import SwiftUI

// A modifier that animates a font through various sizes.
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-animate-the-size-of-text
struct AnimatableCustomFontModifier: ViewModifier, Animatable {
    var name: String
    var size: Double

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}

// To make that easier to use, I recommend wrapping
// it in a `View` extension, like this:
extension View {
    func animatableFont(name: String, size: Double) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
}
