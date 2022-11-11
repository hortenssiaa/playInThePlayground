import Foundation

/*
 Type Casting?
 - class instance의 타입을 확인하거나
    >> is
 - 어떤 class instance를 해당 클래스의 슈퍼 / 서브 클래스로 취급(casting)하는 방법
    >> as
 */

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [ // library: [MediaItem]
    Movie(name: "기생충", director: "봉준호"),
    Song(name: "Butter", artist: "BTS"),
    Movie(name: "올드보이", director: "박찬욱"),
    Song(name: "Girls on Top", artist: "Boa"),
    Song(name: "I'm my fan", artist: "자우림"),
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie { // item이 Movie type 일때
        movieCount += 1
    } else if item is Song { // item이 Song type 일때
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")




// down casting
/*
 MovieItem 타입으로 선언된 library 배열을
 -> Movie / Song type으로 다운캐스팅 가능!
 
 1. as?
 - down casting에 실패할 수도 있어,
    >> 다운캐스팅하려는 티입의 optional 타입으로 반환
 
 2. as!
 - 강제 unmapping
    >> 항상 성공할것을 확신할때만 사용!
    >> if not, run-time error
 */
for item in library {
    if let movie = item as? Movie {
        // library: [MediaItem] 타입인 인스턴스가, 그 서브 클래스인 Movie or Song 중 Movie로 다운캐스팅 될수 있을때!
        print("Movie: \(movie.name), dir: \(movie.director)")
    } else if let song = item as? Song {
        // library: [MediaItem] 타입인 인스턴스가, 그 서브 클래스인 Movie or Song 중 Song로 다운캐스팅 될수 있을때!
        print("Song: \(song.name), by \(song.artist)")
    }
}
