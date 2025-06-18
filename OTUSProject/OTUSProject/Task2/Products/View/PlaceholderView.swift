//
//  PlaceholderView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import SwiftUI

struct PlaceholderView: View {
    
    var body: some View {
        Image("noimage")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview{
    PlaceholderView()
}
