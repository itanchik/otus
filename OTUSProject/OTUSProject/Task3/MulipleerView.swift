//
//  MulipleerView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 13.05.2025.
//

import SwiftUI

struct MulipleerView : View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var manager = MultipeerManager()
    @State private var messageText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(manager.messages, id: \.self) { message in
                        Text(message)
                    }
                }
                HStack {
                    TextField("Enter message", text: $messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Send") {
                        if !messageText.isEmpty {
                            manager.send(text: messageText)
                            messageText = ""
                        }
                    }
                    .padding()
                    .disabled(!manager.isConnected)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Mesh")
                        .font(
                            .subheadline
                                .bold()
                        )
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(manager.isConnected ? "Connected" : "Not Connected")
                        .foregroundColor(manager.isConnected ? .green : .red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}
