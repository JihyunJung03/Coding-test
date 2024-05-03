문제 설명
DEVELOPER_INFOS 테이블은 개발자들의 프로그래밍 스킬 정보를 담은 테이블입니다. 
DEVELOPER_INFOS 테이블 구조는 다음과 같으며
ID, FIRST_NAME, LAST_NAME, EMAIL, SKILL_1, SKILL_2, SKILL_3는
각각 ID, 이름, 성, 이메일, 첫 번째 스킬, 두 번째 스킬, 세 번째 스킬을 의미합니다.

NAME TYPE UNIQUE NULLABLE
ID VARCHAR(N) Y	N # ID
FIRST_NAME VARCHAR(N) N	Y # 이름  
LAST_NAME VARCHAR(N) N Y # 성
EMAIL VARCHAR(N) Y N # 이메일
SKILL_1	VARCHAR(N) N Y # 스킬 1
SKILL_2	VARCHAR(N) N Y # 스킬 2
SKILL_3	VARCHAR(N) N Y # 스킬 3

문제
DEVELOPER_INFOS 테이블에서 Python 스킬을 가진 개발자의 정보를 조회하려 합니다.
Python 스킬을 가진 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성해 주세요.
결과는 ID를 기준으로 오름차순 정렬해 주세요.

풀이 
# 파이썬 스킬 가진 개발자 정보 조회
# ID, 이메일, 이름, 성
# ID를 기준으로 오름차순

풀이 
# 풀이 1
SELECT 
  ID,EMAIL,FIRST_NAME,LAST_NAME # ID,EMAIL,이름,성
FROM 
  DEVELOPER_INFOS # DEVELOPER_INFOS 테이블
WHERE 
  SKILL_1 = 'Python' or SKILL_2 = 'Python' or SKILL_3 = 'Python'# SKILL1,2,3 Python에 해당하는 데이터
ORDER BY # ID를 기준으로 오름차순 정렬
  ID ASC;

# 풀이 2 
SELECT 
  ID,EMAIL,FIRST_NAME,LAST_NAME # ID,EMAIL,이름,성
FROM 
  DEVELOPER_INFOS # DEVELOPER_INFOS 테이블
WHERE 
  'Python' IN (SKILL1, SKILL2, SKILL_3) # SKILL1,2,3에서 Python에 해당하는 데이터
ORDER BY # ID를 기준으로 오름차순 정렬
  ID ASC;

Python 스킬을 가진 개발자에 대한 조건을 기준으로 ID, 이메일, 이름, 성을 조회 한 뒤, 
오름차순 정렬해 주었다. WHERE 절에서 IN을 사용하여 풀이하는 방법에 대해서도 추가로 정리하였다.

