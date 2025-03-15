//
//  AboutYogaView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.03.2025.
//

import SwiftUI

struct AboutYogaView: View {
    @Environment(\.dismiss) var dismiss
    var title: String
    
    private let textYoga = "Йо́га (санскр. योग, IAST: yoga — связь, единение, сосредоточение, усилие) — совокупность психофизических практик, разработанных в различных направлениях индуизма и буддизма с целью достижения человеком возвышенного духовного и психического состояния. В более узком смысле, йога — одна из шести ортодоксальных школ (даршан) философии индуизма."
    
    @State var text = NSAttributedString(string: "Основные направления йоги: раджа-йога, карма-йога, джнана-йога, бхакти-йога и хатха-йога. В контексте философии индуизма, под йогой понимается система раджа-йоги, изложенная в «Йога-сутрах» Патанджали и тесным образом связанная с основополагающими принципами санкхьи.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19), NSAttributedString.Key.foregroundColor: UIColor.systemBlue])

    
    var body: some View {
        NavigationStack {
            Text(textYoga)
                .padding()
            TextView(text: $text)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding()
            
                .navigationTitle(title)
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            
        }
        .padding()
    }
}

#Preview {
    AboutYogaView(title: "title")
}
