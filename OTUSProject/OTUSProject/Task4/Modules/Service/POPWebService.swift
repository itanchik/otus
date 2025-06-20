//
//  POPWebService.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine
import Network

struct POPApi: POPServerApi {
    private let popUrlString = "https://datausa.io/api/data?drilldowns=Nation&measures=Population"
    
    private let userDefaultsManager = POPUserDefaultsManager()
    
    func getPOPData() -> AnyPublisher<[POPItem], Never> {
        if isConnectedToInternet() {
            guard let url = URL(string: popUrlString) else {
                if let cachedItems = userDefaultsManager.loadPOPItems() {
                    return Just(cachedItems).eraseToAnyPublisher()
                } else {
                    return Just([]).eraseToAnyPublisher()
                }
            }
            
            return URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: ResponseData.self, decoder: JSONDecoder())
                .map { response in
                    userDefaultsManager.savePOPItems(response.data)
                    return response.data
                }
                .catch { error -> Just<[POPItem]> in
                    if let cachedItems = userDefaultsManager.loadPOPItems() {
                        return Just(cachedItems)
                    } else {
                        return Just([])
                    }
                }
                .eraseToAnyPublisher()
        } else {
            if let cachedItems = userDefaultsManager.loadPOPItems() {
                return Just(cachedItems).eraseToAnyPublisher()
            } else {
                return Just([]).eraseToAnyPublisher()
            }
        }
    }
    
    func isConnectedToInternet() -> Bool {
        let monitor = NWPathMonitor()
        var isConnected = false
        let semaphore = DispatchSemaphore(value: 0)
        
        monitor.pathUpdateHandler = { path in
            isConnected = path.status == .satisfied
            semaphore.signal()
            monitor.cancel()
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
        
        _ = semaphore.wait(timeout: .now() + 1)
        return isConnected
    }
}



