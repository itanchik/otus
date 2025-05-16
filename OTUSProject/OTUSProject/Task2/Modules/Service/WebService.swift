//
//  WebService.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 12.05.2025.
//

import Foundation
import Combine

struct MakeAppApi: ServerApi {
    private let urlString = "http://makeup-api.herokuapp.com/api/v1/products.json"
    
    func getData() -> AnyPublisher<[Product], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map { $0.data }
            .decode(type: [Product].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
