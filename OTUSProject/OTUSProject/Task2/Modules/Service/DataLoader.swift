//
//  DataLoader.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine

protocol DataLoaderProtocol: ObservableObject {
    
    var loadedProductListPublisher: Published<[Product]>.Publisher { get }
    var loadedProductList: [Product] { get }
    var isLoading: Bool { get }
    func loadData()
}

class DataLoader: ObservableObject, DataLoaderProtocol {
    
    @Published private(set) var loadedProductList: [Product] = []
    @Published var isLoading: Bool = false
    
    var loadedProductListPublisher: Published<[Product]>.Publisher { $loadedProductList }
    private let api: ServerApi
    private var cancellables = Set<AnyCancellable>()
    
    init(api: ServerApi) {
        self.api = api
        loadData()
    }
    
    func loadData() {
        isLoading = true
        api.getData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] products in
                guard let self else { return }
                self.loadedProductList = products
                self.isLoading = false
            }
            .store(in: &cancellables)
    }
}
