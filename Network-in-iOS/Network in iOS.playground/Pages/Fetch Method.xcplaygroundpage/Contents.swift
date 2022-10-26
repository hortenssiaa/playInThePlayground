import Foundation

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

// TO-DO
// 1) Network를 담당하는 NetworkService를 만들었음
//      예) view의 page를 그리려면, 담당하는 viewController를 만들듯
// 2) 실제로, NetworkService 객체로 네트워크 작업을 만든다.


// 1). Network 담당 클래스 만들기
final class NetworkService {
    // configuration, session, task
    let session: URLSession
    
    // NetworkService가 생성될때, session을 받도록 설정
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
        
        /*
         1. URLSessionConfiguration 을 받으면
         2. 실제로 session 을 생성한다.
         2-1. session은 ui property로 갖고있게 만들어 주면 된다 (= 위에서 let session 변수 생성)
         */
    }
    
    // github server에서 사용자 profile 받아오는 메소드
    //  fetch : 데이터를 땡겨오다
    /*
     - completion : Result type으로 반환하고 있다.
     - Result Type이란?
        - 간단하게는 enum type이다.
        - 성공/실패 케이스가 있다 (= case success(Success == 값 == GithubProfile type 값), case failure(Failure == 실패 이유/error내용)
     */
    func fetchProfile(userName: String, completion: @escaping (Result<GithubProfile, Error>) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(userName)")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // 1. Network간, error가 없는지 check, Error 처리
            // error있으면, completion에서 error type 넘겨준다.
            if let error = error {
                completion(.failure(NetworkError.transportError(error))) // 만들어 놓은 error
                return
            }
            
            // 2. Response Error check
            // 만약 response status code가 200..<300이 아니라면 responseError
            if let httpResponse = response as? HTTPURLResponse,
                  !(200..<300).contains(httpResponse.statusCode) {
                completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            // 3. data Error check
            // data는 optional 이기 때문에, nil 일 경우 대비
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            // 4. Decoding : 위의 1,2,3이 모두 error아닐경우 실행
            do {
                let decoder = JSONDecoder()
                let profile = try decoder.decode(GithubProfile.self, from: data)
                completion(.success(profile)) // Success
            } catch let error as NSError {
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume()
    }
}


// 2) NetworkService 객체로 네트워크 작업을 만들기
let networkService = NetworkService(configuration: .default)

networkService.fetchProfile(userName: "hortenssiaa") { result in
    // result == Result type은 enum 이다. > 따라서, .failure, .success case가 있다.
    switch result {
    case .success(let profile):
        print("Profile: \(profile)")
    case .failure(let error):
        print("error: \(error)")
    }
}
/*
 username으로 넣은 결과를 fetch하는데, 결과는 비동기로 내려오게 된다.
 */
