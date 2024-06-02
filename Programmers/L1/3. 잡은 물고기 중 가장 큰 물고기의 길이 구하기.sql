문제 설명
낚시앱에서 사용하는 FISH_INFO 테이블은 잡은 물고기들의 정보를 담고 있습니다. 
FISH_INFO 테이블의 구조는 다음과 같으며 ID, FISH_TYPE, LENGTH, TIME은 
각각 잡은 물고기의 ID, 물고기의 종류(숫자), 잡은 물고기의 길이(cm), 물고기를 잡은 날짜를 나타냅니다.

Column name Type Nullable 
ID INTEGER FALSE # 물고기 ID
FISH_TYPE INTEGER FALSE # 물고기 종류
LENGTH FLOAT TRUE # 물고기 길이
TIME DATE FALSE # 잡은 날짜

단, 잡은 물고기의 길이가 10cm 이하일 경우에는 LENGTH 가 NULL 이며, 
LENGTH 에 NULL 만 있는 경우는 없습니다.


문제
FISH_INFO 테이블에서 잡은 물고기 중 가장 큰 물고기의 길이를 'cm' 를 붙여 출력하는 SQL 문을 작성해주세요. 
이 때 컬럼명은 'MAX_LENGTH' 로 지정해주세요.

풀이 
SELECT CONCAT(MAX(LENGTH),'cm') AS MAX_LENGTH
FROM FISH_INFO;

정답에 대해서 추가적으로 설명을 한번 더 적어보았다.

SELECT: 데이터베이스에서 정보를 선택하여 가져온다. MAX_LENGTH라는 새로운 열을 선택하여 출력한다.
CONCAT: 문자열을 결합하는 함수이다. 가장 큰 물고기의 길이와 'cm'을 결합하여 최종적으로 출력할 문자열을 생성한다.
MAX(LENGTH): LENGTH 열에서 최대값을 찾는 함수이다. 즉, FISH_INFO 테이블에서 가장 큰 물고기의 길이를 나타낸다.
AS MAX_LENGTH: 결과 열의 이름을 지정하는 구문이다. 여기서는 결과 열의 이름을 MAX_LENGTH로 지정하여 출력한다.
FROM FISH_INFO: 데이터를 가져올 테이블을 지정하는 구문이다. 여기서는 FISH_INFO 테이블에서 데이터를 가져온다.

부트캠프때 배웠던 CONCAT을 써보았다. CONCAT의 쓰임에 대해서 한번 더 기억해봐야겠다. string1,2...등으로 문자열과 결합할 수 있다는것!

CONCAT 함수는 하나 이상의 문자열을 결합하여 새로운 문자열을 생성하는 함수이다. 일반적으로 SQL에서 사용되며 다음과 같은 형식을 가진다.

 CONCAT(string1, string2, ...)
 
 # 예시 만들어 보기
 SELECT CONCAT('Hello', ' ', 'World') AS Result;

Result
Hello world

여기서 string1, string2, ... 등은 결합하고자 하는 문자열이며, 최대 255개까지 지정할 수 있다. 이 함수는 각 문자열을 연결하여 하나의 문자열로 반환한다.

