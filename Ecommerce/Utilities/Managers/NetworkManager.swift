//
//  NetworkManager.swift
//  Ecommerce
//
//  Created by Khumbongmayum Tonny on 19/01/24.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    func loadData(from file: String) async throws -> [Product] {

        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            throw NetworkError.fileNotFound
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decode = JSONDecoder()
            let decodedData = try decode.decode(ProductResponse.self, from: data)

            return decodedData.audiences.first?.categories.first?.products ?? []
        } catch {
            throw error
        }

    }
}


enum NetworkError: Error {
    case fileNotFound
}
