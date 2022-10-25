# 🧮 Network in iOS
### - URLSession을 이용해서 HTTP 방식으로 서버와 소통
    • URL Request
    • URL Response
<br>

### - Networking 하기위한 3가지 설정
1. **URLSessionConfiguration** *(설정값)*
    - .default
      - 단순한 네트워크 작업<br>
        > 예) 데이터 요청, 브라우저 요청
      - 디스크를 이용한 데이터 저장
      <br>
    - .ephemeral
       - 개인정보 보호설정된 모드<br>
          > 예) 크롬 시크릿 모드 
       - .default와 비슷하지만, 몇가지 정보를 저장하지 않음 (쿠키, 인증서 등) 
       <br>
    - .background
      - 파일 다운받을때 사용
      - 백그라운드에서도 앱 다운 가능 
      <br>

2. **URLSession** *(주요 주체)*
  - URLSession의 생성을 위해, URLSessionConfiguration 먼저 필요 
<br>

3. **URLSessionTask**
  - 만들어진 URLSession으로, 실제 Network작업 만드는 역할! 
    - dataTask
      - 네트워크에서 데이터를 받아오는 작업
        > 받은 데이터를 가공하여 쓴다. (decoding) 
    <br>

    - uploadTask
      - 내가 갖고있는 데이터를 서버에 올리는 작업
    <br>
    
    - downloadTask
      - 네트워크에서 받은 데이터를 내 disk에 저장하는 작업 
