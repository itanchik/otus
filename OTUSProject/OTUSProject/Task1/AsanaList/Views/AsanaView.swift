//
//  AsanaView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.03.2025.
//

import SwiftUI

struct AsanaView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300, alignment: .center)
    }
}

#Preview {
    AsanaView(imageName: "triko")
}
