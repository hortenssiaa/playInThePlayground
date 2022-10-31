//
//  Network.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import Foundation
import Combine

///// Defines the Network service errors.
enum NetworkError: Error {
    case invalidRequest
    case invalidResponse
    case responseError(statusCode: Int)
    case jsonDecodingError(error: Error)
}

final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error> { // network 처리 메소드 
        guard let request = resource.urlRequest else { // resource(== url) 넘겨주면, 필요한 뽑아주고
            return .fail(NetworkError.invalidRequest)
        }
        
        return session
            .dataTaskPublisher(for: request) // 뽑은 url request로 session에게, dataTask Publisher 만들어줘
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data // 데이터까지 받아서, 넘겨주는것 까지 완료하는 클래스
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
