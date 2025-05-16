//
//  OnboardingItemView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.05.2025.
//

import SwiftUI

struct OnboardingItemView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    let item: OnboardingItem
    let currentIndex: Int
    let total: Int
    
    var body: some View {
        VStack{
            Text(item.title)
                .font(
                    .largeTitle.width(.standard)
                    .bold()
                )
                .padding()
            
            Text(item.text)
                .padding()
            Spacer()
            
            if currentIndex == total-1 {
                Button(action: {
                    viewModel.closeOnboarding()
                }) {
                    Text("Next")
                }
                .padding(50)
            }
            
            HStack{
                ForEach(0..<total, id: \.self){ index in
                    Image(systemName:  index == currentIndex ? "heart.fill" : "heart")
                        .foregroundStyle(Color(uiColor: .systemGray))
                }
            }
        }
        .padding(.vertical, 100)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}
