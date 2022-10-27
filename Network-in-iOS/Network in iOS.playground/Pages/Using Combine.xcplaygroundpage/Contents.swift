import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case transportError(Error)
    case responseError(statusCode: Int)
    case noData
    case decodingError(Error)
}

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) { // 1. configuration
        session = URLSession(configuration: configuration) // 2. session
    }
    
    /*
     Combine
     : 기존의 fetchProfile처럼, completion을 내보내지 않는다. -> Publisher을 내보냄
     */
    func fetchProfile(userName: String) -> AnyPublisher<GithubProfile, Error> { // Publisher
        let url = URL(string: "https://api.github.com/users/\(userName)")!
        
        let publisher = session
            .dataTaskPublisher(for: url) // 3. dataTaskPublisher (Network + Combine)
        // TO-DO
        // 1). 서버에서 받은 response 확인 및 data 확인
            .tryMap { result -> Data in // 데이터 형변환, ((data: Data, response: URLResponse) 을 받는데, 하나로(result) 사용해서 .찍어서 사용 가능)
                guard let httpResponse = result.response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                    // responser error 상황
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1 // response가 optional이라서, statuscode없다면, -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                // response success -> return Data type data
                return result.data
            }
        // 2) 받은 Data 디코딩
            .decode(type: GithubProfile.self, decoder: JSONDecoder()) // Operator을 도와주는 decoder
            .eraseToAnyPublisher() // type erasing
            /*
             return type이 Publisher가 아니고, AnyPublisher
             -> 따라서, eraseToAnyPublisher은 지금까지의 데이터 스트림이 어떠했던 최종적인 형태의 Publisher를 리턴
             */
        return publisher
    }
}

// 만든 fetchProfile(name) Publisher 사용하기
let networkService = NetworkService(configuration: .default) // Network담당 객체

let subscription = networkService
    .fetchProfile(userName: "hortenssiaa")
    .receive(on: RunLoop.main)
//    .retry(3) // error 경우를 대비하여, n번 재실행
    .print()
    .sink { completion in // type == Subscribers.Completion<Error>
        print("completion: \(completion)") // error or finished
    } receiveValue: { profile in // data
        print("profile: \(profile)")
    }

