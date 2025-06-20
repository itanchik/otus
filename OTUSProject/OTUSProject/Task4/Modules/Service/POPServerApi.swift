//
//  POPServerApi.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import Combine

protocol POPServerApi {
    func getPOPData() -> AnyPublisher<[POPItem], Never>
}
