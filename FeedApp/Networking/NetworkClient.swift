//
//  NetworkClient.swift
//  FeedApp
//
//  Created by panther on 06/12/24.
//

import Foundation
import Combine

protocol NetworkClient {
    var session: URLSession { get }
    func execute<T>(request: URLRequest, decodingType: T.Type, queue: DispatchQueue, retries: Int) ->
    AnyPublisher<T, Error> where T: Decodable
}

extension NetworkClient {
    func execute<T>(request: URLRequest, decodingType: T.Type, queue: DispatchQueue = .main, retries: Int) ->
    AnyPublisher<T, Error> where T: Decodable {
        return session
            .dataTaskPublisher(for: request)
            .mapError{ _ in APIError.noConnection }
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw APIError.responseUnsuccessful
                }
                return $0.data
            }
            .decode(type: decodingType.self, decoder: JSONDecoder())
            .mapError({ error in
                switch error {
                case is Swift.DecodingError :
                    return APIError.jsonParsingFailure
                case let urlError as URLError:
                    if (urlError.networkUnavailableReason != nil) {
                        return APIError.noConnection
                    } else {
                        return APIError.requestFailed
                    }
                default:
                    return APIError.other(error)
                }
            })
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
