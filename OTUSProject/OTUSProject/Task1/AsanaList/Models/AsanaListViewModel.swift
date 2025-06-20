//
//  AsanaListViewModel.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 10.03.2025.
//

import SwiftUI

class AsanaListViewModel: ObservableObject {
    @Published var asanas: [AsanaModel] = [
        AsanaModel(id: 0, name: "Триконасана", image: "triko"),
        AsanaModel(id: 1, name: "Падмасана", image: "lotus"),
        AsanaModel(id: 2, name: "Ширшасана", image: "shirsha")
    ]
}
