//
//  ServerApi.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import Combine

protocol ServerApi {
    func getData() -> AnyPublisher<[Product], Never>
}
