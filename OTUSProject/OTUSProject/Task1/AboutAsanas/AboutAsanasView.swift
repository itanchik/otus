//
//  Tab1TableView.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 05.03.2025.
//

import SwiftUI

struct AboutAsanasView: View {
    var viewModel: ViewModelIndexes
    
    let text = "А́са́на (санскр. आसन, IAST: āsana — поза, сидячая поза, место для сидения) — название определённого неподвижного положения тела в йоге, принимаемого на несколько секунд или минут с целью телесного и душевного оздоровления. В классической йоге Патанджали асаны являются третьей ступенью среди других семи практик — ямы, ниямы, пранаямы, пратьяхары, дхараны, дхьяны и самадхи."
    let lotus = "По́за ло́тоса или падмасана (тур. bağdaş — скрестив ноги) — одна из основных асан для медитации. Является базовой основой для любых комплексов асан. Её положение — сидя, скрестив ноги, положив стопы поперечными сводами на противоположные бёдра."

    var body: some View {
        NavigationStack {
            Text(text)
                .padding()
            Text(lotus)
                .padding()
            Button {
                viewModel.changeTab(newTab: .asanas)
                viewModel.selectedCellIndex = 1
            } label: {
                Text("Подробнее")
            }
            .navigationTitle("Об асанах")
        }
        .padding()
    }
}

#Preview {
    AboutAsanasView(viewModel: ViewModelIndexes())
}
