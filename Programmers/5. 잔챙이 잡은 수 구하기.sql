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
잡은 물고기 중 길이가 10cm 이하인 물고기의 수를 출력하는 SQL 문을 작성해주세요.
물고기의 수를 나타내는 컬럼 명은 FISH_COUNT로 해주세요.

풀이 
# 풀이 1
SELECT 
    COUNT(ID) AS FISH_COUNT # ID를 COUNT 하고 열 이름을 FISH_COUNT로 변경
FROM 
    FISH_INFO # FISH_INFO 테이블
WHERE 
  LENGTH is null; # LENGTH 가 null인 데이터

# 풀이 2
SELECT 
  COUNT(*) AS FISH_COUNT # COUNT 하고 열 이름을 FISH_COUNT로 변경
FROM 
  FISH_INFO # FISH_INFO 테이블
WHERE 
  IFNULL(LENGTH,10) <= 10; # LENGTH열의 데이터가 NULL일 경우 10을 반환
 
LENGTH가 NULL 값인 데이터를 10으로 변경(10cm이하인 물고기들은 NULL) 하여 COUNT 하는 방법과, 
데이터 자체가 NULL인 경우를 조건으로 COUNT하는 방법을 두 가지로 풀어보았다.

