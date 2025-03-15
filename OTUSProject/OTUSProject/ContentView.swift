//
//  ContentView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 30) {
            Button {
                showSheet.toggle()
            } label: {
                Text("Задание 1")
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .sheet(isPresented: $showSheet) {
            YogaView()
        }
    }
}

#Preview {
    ContentView()
}
