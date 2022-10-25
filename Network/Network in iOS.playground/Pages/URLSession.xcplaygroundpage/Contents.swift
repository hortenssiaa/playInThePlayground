import Foundation

// Networking 을 위해서는.
// Configuration -> URLSession -> URLSessionTask

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/hortenssiaa")!

let task = session.dataTask(with: url) { data, response, error in // url에서 받은 내용들 요청한 데이터(data), 요청한 응답(response), 그 사이에 에러 없었는지(error)
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("--> response: \(response)")
        return
    }
    /*
     1. response(URLResponse) type -> HTTPURLResponse 로
     2. (200 <= httpResponse.statusCode < 300) 즉, 200대에 있는지
         - 2xx : 성공
         - 3xx: 리다이렉션 메시지
         - 4xx: 클라이언트 에러
         - 5xx: 서버 에러
     */
    
    guard let data = data else { return } // data는 optional이기 때문에, (받아온데이터가 있을수도 없을수도) guard해준다.
    let result = String(data: data, encoding: .utf8) // encoding
    print(result)
}

// task를 실행시키려면, resume을 시켜줘야 한다.
task.resume()
