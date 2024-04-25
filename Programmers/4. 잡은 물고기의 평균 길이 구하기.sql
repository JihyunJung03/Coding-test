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
잡은 물고기의 평균 길이를 출력하는 SQL문을 작성해주세요. 
평균 길이를 나타내는 컬럼 명은 AVERAGE_LENGTH로 해주세요. 
평균 길이는 소수점 3째자리에서 반올림하며, 
10cm 이하의 물고기들은 10cm 로 취급하여 평균 길이를 구해주세요.

풀이 
SELECT 
    ROUND(AVG(IFNULL(LENGTH, 10)),2) AS AVERAGE_LENGTH
FROM 
    FISH_INFO;

1. 물고기 길이(LENGTH)의 평균값 구하기 - SUM,AVERAGE
2. 길이 평균값을 소수점 셋째 자리까지 구하기 - ROUND
3. 길이가 10cm 이하인 NULL 값을 INT 즉 10으로 바꿔주기 머릿속으로 정리를 해보았다.

# IF 문을 활용해 보려 했지만 SQL의 IF 문은 주로 데이터를 조회하거나 업데이트할 때 사용되는데, 
# 예를 들어 특정 조건에 따라 조회 결과를 필터링하거나 값을 변경할 때 IF 문을 사용할 수 있다. 
# 그리고 NULL 값이 아닌 숫자 등의 값을 다룰 때에도 IF 문을 활용할 수 있으므로 
# NULL이 포함되어 있기 때문에 사용불가 따라서 IFNULL을 사용했다.

# 풀이 해설 
SELECT 
  IFNULL(LENGTH, 10) AS AVERAGE_LENGTH 
  # LENGTH 열에서 NULL이 아닌 경우 LENGTH 즉 해당 데이터를 출력하고
  # LENGTH 열에서 NULL일 경우 10으로 변환시켜 준다.
  # 열 이름은 AVERAGE_LENGTH로 변환한다.
  
  SELECT 
    AVG(IFNULL(LENGTH, 10)) AS AVERAGE_LENGTH 
  # LENGTH 열에서 NULL이 아닌 경우 LENGTH 즉 해당 데이터를 출력하고
  # LENGTH 열에서 NULL일 경우 10으로 변환시켜 준다.
  # LENGTH 데이터의 평균을 구한다.
  # 열 이름은 AVERAGE_LENGTH로 변환한다.
  
   SELECT 
     ROUND(AVG(IFNULL(LENGTH, 10)),3) AS AVERAGE_LENGTH 
  # LENGTH 열에서 NULL이 아닌 경우 LENGTH 즉 해당 데이터를 출력하고
  # LENGTH 열에서 NULL일 경우 10으로 변환시켜 준다.
  # LENGTH 데이터의 평균을 구한다.
  # 결과를 소수점 셋째 자리까지 반환한다.
  # 열 이름은 AVERAGE_LENGTH로 변환한다.
 

IFNULL - 첫 번째 매개변수가 NULL이 아니면 해당 값을 반환하고, NULL이면 두 번째 매개변수를 반환한다. 이를 통해 NULL 값을 다른 값으로 대체할 수 있다.

IFNULL(expression, replacement)
# expression은 평가할 값 또는 열
# replacement는 expression이 NULL일 경우 반환할 대체값
# IFNULL 함수를 사용하여 특정 열이 NULL인 경우 0으로 대체할 수 있다.
 

ROUND - ROUND 함수는 숫자를 지정된 소수점 자리수로 반올림하여 반환하는 SQL 함수이다. 이 함수는 다양한 상황에서 숫자를 다룰 때 유용하게 활용된다.

ROUND(expression, decimals)
# expression은 반올림할 숫자나 숫자 열
# decimals는 반올림하여 유지할 소수점 자리 수
 

예를 들어, ROUND 함수를 사용하여 3.456을 소수점 둘째 자리로 반올림하면 3.46이 된다. 
만약 소수점 첫째 자리로 반올림하려면 3.456은 3.5가 된다. ROUND 함수는 양수 또는 음수의 값을 가질 수 있으며, 
decimals 매개변수를 사용하여 반올림할 소수점 자리 수를 지정할 수 있다.
