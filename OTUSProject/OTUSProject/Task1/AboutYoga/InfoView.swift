//
//  InfoView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

struct InfoView: View {
    @State private var showSheet = false
    private let title = "Что такое йога?"
    
    var body: some View {
        VStack() {
            Button(title) {
                showSheet.toggle()
            }
            .font(.title)
            .bold()
            .fullScreenCover(isPresented: $showSheet) {
                AboutYogaView(title: title)
            }
        }
        .padding()
    }
}

#Preview {
    InfoView()
}
