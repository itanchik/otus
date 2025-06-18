//
//  ContentView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @EnvironmentObject var container: DependencyContainer
    
    @State private var showSheet1 = false
    @State private var showSheet2 = false
    @State private var showSheet3 = false
    @State private var showSheet4 = false
    
    var body: some View {
        VStack(spacing: 30) {
            Button {
                showSheet1.toggle()
            } label: {
                Text("Задание 1")
            }
            .buttonStyle(.bordered)
            Button {
                showSheet2.toggle()
            } label: {
                Text("Задание 2")
            }
            .buttonStyle(.bordered)
            Button {
                showSheet3.toggle()
            } label: {
                Text("Задание 3")
            }
            .buttonStyle(.bordered)
            Button {
                showSheet4.toggle()
            } label: {
                Text("Задание 4")
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .fullScreenCover(
            isPresented: $showSheet1,
            onDismiss: {
            }, content: {
                YogaView()
            }
        )
        .fullScreenCover(
            isPresented: $showSheet2,
            onDismiss: {
            }, content: {
                VStack{
                    TabsView()
                }
                .fullScreenCover(isPresented: $appViewModel.showOnboarding){
                    OnboardingView()
                }
            }
        )
        .fullScreenCover(
            isPresented: $showSheet3,
            onDismiss: {
            }, content: {
                MulipleerView()
            }
        )
        .fullScreenCover(
            isPresented: $showSheet4,
            onDismiss: {
            }, content: {
                VStack{
                    POPTabsView()
                }
            }
        )
    }
}

#Preview {
    ContentView()
}
