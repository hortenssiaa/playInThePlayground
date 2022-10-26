import Foundation

/*
 * Decode
 : 다운받은 data를, Codable (Encodable, Decodable)을 이용하여 > Swift 객체로 바꿔준다.
 
 * Codable
 : App Model <- (Decodable) -- (Encodable) -> JSON
 - codable은 Decodable과 Encodable를 섞은 protocol 이다.
 - codingKey라는 것을 통해, 서로를 맵핑 시켜줄 수 있다. (decode)
 */

// 1. swift로 바꾸기 원하는 객체 만들기
struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey { // JSON의 속성들 key값 (decoding시 읽는다)
        case login
        case avatarUrl = "avatar_url" // For Swift follows Camelcase
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

// For networking: Configuration, session, task
let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/hortenssiaa")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("--> response: \(response)")
        return
    }
    
    guard let data = data else { return }
    
    // TO-DO
    // data -> GithubProfile type로 만들기
    // tip! >> decoder 사용하기
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(GithubProfile.self, from: data) // decode시, 실패할 수 있으므로 try 로
        print("profile: \(profile)")
    } catch let erorr as NSError {
        print("error: \(erorr)")
    }
}

task.resume()
