//
//  TextView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.03.2025.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: NSAttributedString

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = text
    }
}
