//
//  POPDataLoader.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine

protocol POPDataLoaderProtocol: ObservableObject {
    var loadedPopulationList: [POPItem] { get }
    var isLoading: Bool { get }
    func loadData()
}

class POPDataLoader: POPDataLoaderProtocol, ObservableObject {
    private let api: POPServerApi
    private var cancellables = Set<AnyCancellable>()
    private let populationListSubject = CurrentValueSubject<[POPItem], Never>([])
    private let isLoadingSubject = CurrentValueSubject<Bool, Never>(false)
    
    var loadedPopulationListPublisher: AnyPublisher<[POPItem], Never> {
        return populationListSubject.eraseToAnyPublisher()
    }
    
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        return isLoadingSubject.eraseToAnyPublisher()
    }
    
    var loadedPopulationList: [POPItem] {
        return populationListSubject.value
    }
    
    var isLoading: Bool {
        return isLoadingSubject.value
    }
    
    init(api: POPServerApi) {
        self.api = api
        loadData()
    }
    
    func loadData() {
        isLoadingSubject.send(true)
        api.getPOPData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                guard let self else { return }
                self.populationListSubject.send(items)
                self.isLoadingSubject.send(false)
            }
            .store(in: &cancellables)
    }
}
