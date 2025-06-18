//
//  POPDataLoader.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine

protocol POPDataLoaderProtocol: ObservableObject {
    
    var loadedPopulationListPublisher: Published<[POPItem]>.Publisher { get }
    var loadedPopulationList: [POPItem] { get }
    var isLoading: Bool { get }
    func loadData()
}

class POPDataLoader: ObservableObject, POPDataLoaderProtocol {
    
    @Published private(set) var loadedPopulationList: [POPItem] = []
    @Published var isLoading: Bool = false
    
    var loadedPopulationListPublisher: Published<[POPItem]>.Publisher { $loadedPopulationList }
    private let api: POPServerApi
    private var cancellables = Set<AnyCancellable>()
    
    init(api: POPServerApi) {
        self.api = api
        loadData()
    }
    
    func loadData() {
        isLoading = true
        api.getPOPData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                guard let self else { return }
                self.loadedPopulationList = items
                self.isLoading = false
            }
            .store(in: &cancellables)
    }
}
