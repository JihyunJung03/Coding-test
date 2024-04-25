문제 설명
다음은 어느 자동차 대여 회사에서 대여중인 자동차들의 정보를 담은 CAR_RENTAL_COMPANY_CAR 테이블입니다. 
CAR_RENTAL_COMPANY_CAR 테이블은 아래와 같은 구조로 되어있으며, 
CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS 는
각각 자동차 ID, 자동차 종류, 일일 대여 요금(원), 자동차 옵션 리스트를 나타냅니다.

Column name Type Nullable
CAR_ID INTEGER FALSE
CAR_TYPE VARCHAR(255) FALSE
DAILY_FEE INTEGER FALSE
OPTIONS	VARCHAR(255) FALSE
 
자동차 종류는 '세단', 'SUV', '승합차', '트럭', '리무진' 이 있습니다. 
자동차 옵션 리스트는 콤마(',')로 구분된 키워드 리스트(옵션 리스트 값 예시: '열선시트', '스마트키', '주차감지센서')로 되어있으며, 
키워드 종류는 '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트' 가 있습니다.

문제
CAR_RENTAL_COMPANY_CAR 테이블에서 '네비게이션' 옵션이 포함된 
자동차 리스트를 출력하는 SQL문을 작성해주세요. 
결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.

풀이

풀이 1 - 정규식
SELECT CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS # CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS열
FROM CAR_RENTAL_COMPANY_CAR # CAR_RENTAL_COMPANY_CAR 테이블
WHERE options REGEXP '네비게이션' # '네비게이션'이 포함된 데이터
ORDER BY car_id DESC; # CAR_ID를 기준으로 내림차순

풀이 2 - INSTR
SELECT CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS # CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS열
FROM CAR_RENTAL_COMPANY_CAR # CAR_RENTAL_COMPANY_CAR 테이블
WHERE instr(options, '네비게이션') > 0 #'네비게이션' 문자열이 "options" 열에 포함되어 있는지를 확인
# instr은 첫번째 인자에서 두번째 인자의 첫 위치를 반환하는데 없을 경우 자동으로 0이기에 부등호는 필요없음
ORDER BY car_id DESC; # CAR_ID를 기준으로 내림차순

풀이 3 - LIKE
SELECT CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS # CAR_ID, CAR_TYPE, DAILY_FEE, OPTIONS열
FROM CAR_RENTAL_COMPANY_CAR # CAR_RENTAL_COMPANY_CAR 테이블의
WHERE options LIKE '%네비게이션%' # '네비게이션'이라는 문자열이 "options" 열에 포함된 모든 경우
ORDER BY car_id DESC; # CAR_ID를 기준으로 내림차순
 
나는 LIKE를 사용하여 풀었지만 정규식과 INSTR에 대한 다른 정답들도 있어서 정리해보았다. 추가로 궁금한것들도 정리!

정규 표현식 - 
정규 표현식(Regular Expression, regex 또는 regexp로 줄여서 표기)은 문자열의 패턴을 나타내는데 사용되는 특별한 문자열이다.
주로 문자열에서 특정한 문자 패턴을 찾거나 추출하는 데 사용된다. 정규 표현식은 다양한 문자 및 메타 문자를 사용하여 패턴을 정의한다.
예를 들어, .은 어떤 문자 하나와 일치하고, *는 앞의 문자가 0회 이상 반복되는 것과 일치한다.

예를 들어, 정규 표현식 a.*b는 문자열에서 'a'로 시작하고 'b'로 끝나는 모든 문자열과 일치한다.
즉, 중간에 어떤 문자가 오더라도 상관없이 'a'로 시작하고 'b'로 끝나는 문자열을 찾는다.
정규 표현식은 다양한 용도로 사용될 수 있다. 주로 문자열 검색, 문자열 대체, 문자열 분리 등에 활용된다.
데이터베이스에서는 특정 패턴을 가진 데이터를 검색하는데 자주 사용된다. 종종 복잡한 검색 또는 패턴 일치를 수행할 때 유용하다.

 

REGEXP (Regular Expression) -

REGEXP는 정규 표현식을 사용하여 문자열을 비교한다. 이를 통해 복잡한 문자열 패턴을 검색하고 일치하는 값을 찾을 수 있다.

 
사용법 : 
REGEXP '패턴'
 
예시 : 
1. 'apple'이나 'apples'와 같은 단어를 찾음 
SELECT * FROM fruits WHERE name REGEXP 'apple'; 
2. 숫자로 시작하는 단어를 찾음 
SELECT * FROM words WHERE word REGEXP '^[0-9]';
 

INSTR -
INSTR 함수는 문자열에서 특정 문자열이나 문자의 위치를 찾는다. 문자열의 시작부터 검색하며, 찾는 문자열이 없으면 0을 반환한다.문자열에서 하위 문자열을 찾는 함수이다.

사용법 :
INSTR(대상문자열, 찾을문자열)
 
예시 : 
1. 'Hello World'에서 'World'를 찾음 
SELECT INSTR('Hello World', 'World'); 
2. 'Banana'에서 'na'가 처음으로 나타나는 위치를 찾음 
SELECT INSTR('Banana', 'na');
 
LIKE - LIKE 연산자는 패턴 매칭을 수행하여 문자열을 검색한다. 
와일드카드 문자인 %와 _를 사용하여 패턴을 지정할 수 있다. 특정 패턴과 일치하는 문자열을 찾는다.

사용법 :
LIKE '패턴'
 
예시 : 

1. 'apple'이나 'apples'와 같은 단어를 찾음
SELECT * FROM fruits WHERE name LIKE 'apple%';

2. 'a'로 시작하는 단어를 찾음
SELECT * FROM words WHERE word LIKE 'a%';
 
 