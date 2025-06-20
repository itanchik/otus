//
//  OnboardingView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 08.04.2025.
//

import SwiftUI

struct OnboardingView: View {
    let array = [
        OnboardingItem(
            title: "Welcome to MakeApp!",
            text: "We’re thrilled to have you here! This app is designed to help you unleash your creativity in the world of makeup. Let’s get started!\nTell us about yourself! Share your makeup preferences, skin type, and favorite colors. This will help us provide you with personalized recommendations.\nDive into a variety of video tutorials and step-by-step guides from professional makeup artists. Find a style you love and start creating! "
        ),
        OnboardingItem(
            title: "Explore Our Tutorials",
            text: "Use our virtual makeup feature to try on different looks. Experiment with colors and textures without any risk!\nDon’t hesitate to share your masterpieces with the community! Upload photos of your looks and inspire others.\nSubscribe to our updates so you never miss out on new trends, skincare tips, and special offers.Ready to begin? Tap \"Next\" to dive into the world of beauty!Feel free to customize this text according to the specific features and style of your app!"
        )
    ]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0.0) {
                ForEach(Array(array.enumerated()), id: \.element.title) { index, item in
                    OnboardingItemView(item: item, currentIndex: index, total: array.count)
                        .containerRelativeFrame([.horizontal, .vertical], count: 1, spacing: 0)
                }
            }
        }
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    OnboardingView()
}
