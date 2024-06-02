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
FISH_INFO 테이블에서 2021년도에 잡은 물고기 수를 출력하는 SQL 문을 작성해주세요. 
이 때 컬럼명은 'FISH_COUNT' 로 지정해주세요.

풀이 1
SELECT 
  COUNT(*) AS FISH_COUNT # FISH_COUNT로 컬럼명 변경
FROM 
  FISH_INFO # FISH_INFO 테이블
WHERE 
  TIME >= '2021-01-01' AND TIME <= '2021-12-31'; 
  # 2021년 1월 1일 보다 크거나 같고 2021년 12월 31일 보다 작거나 같다
풀이 2
SELECT
    COUNT(ID) FISH_COUNT # FISH_COUNT로 컬럼명 변경
FROM
    FISH_INFO # FISH_INFO 테이블
WHERE
    YEAR(TIME) = '2021'; # TIME열 내에서 2021년을 추출

