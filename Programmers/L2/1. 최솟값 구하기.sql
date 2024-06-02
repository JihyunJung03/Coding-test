문제 설명
ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. 
ANIMAL_INS 테이블 구조는 다음과 같으며, 
ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는
각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

NAME TYPE NULLABLE 
ANIMAL_ID VARCHAR(N) FALSE 
ANIMAL_TYPE VARCHAR(N) FALSE 
DATETIME DATETIME FALSE 
INTAKE_CONDITION VARCHAR(N) FALSE 
NAME VARCHAR(N) TRUE 
SEX_UPON_INTAKE	VARCHAR(N) FALSE

# 문제 설명 
가장 먼저 들어온 동물은 Jack이고, Jack은 2013-10-14 15:38:00에 들어왔습니다

ANIMAL_ID ANIMAL_TYPE DATETIME INTAKE_CONDITION	NAME SEX_UPON_INTAKE
A399552	Dog 2013-10-14 15:38:00	Normal Jack Neutered Male
A379998	Dog 2013-10-23 11:42:00	Normal Disciple Intact Male
A370852	Dog 2013-11-03 15:04:00	Normal Katie Spayed Female
A403564	Dog 2013-11-18 17:03:00	Normal Anna Spayed Female

# 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

시간 
2013-10-14 15:38:00 
# 컬럼 이름(위 예제에서는 "시간")은 일치하지 않아도 됩니다.


문제
동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.

ID 컬럼명은 ID, 길이 컬럼명은 LENGTH로 해주세요.

풀이
# 가장 먼저 들어온 동물에 대한 datetime
SELECT MIN(DATETIME) AS 시간
FROM ANIMAL_INS;

▶ MIN과 MAX 함수는 SQL에서 가장 작은 값과 가장 큰 값을 반환하는 데 사용되는 집계 함수이다.

1. MIN 함수

기능: 지정된 컬럼의 가장 작은 값을 반환한다.
사용 예: 날짜/시간 데이터에서 가장 이른 시간, 숫자 데이터에서 가장 작은 값 등을 찾을 때 사용된다.

SELECT MIN(DATETIME) AS 시간
FROM ANIMAL_INS;
# ANIMAL_INS 테이블에서 가장 이른 DATETIME 값을 반환한다.


2. MAX 함수

기능: 지정된 컬럼의 가장 큰 값을 반환한다.
사용 예: 날짜/시간 데이터에서 가장 늦은 시간, 숫자 데이터에서 가장 큰 값 등을 찾을 때 사용된다.

SELECT MAX(DATETIME) AS 시간
FROM ANIMAL_INS;
# ANIMAL_INS 테이블에서 가장 늦은 DATETIME 값을 반환한다.

