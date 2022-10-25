install.packages('dplyr')
library(dplyr)

mtcars <- mtcars %>%
  rename(
    기름소모량=mpg,
    기통=cyl,
    화면밝기=disp,
    마력=hp,
    제동거리=drat,
    무게=wt,
    속도=qsec,
    엔진종류=vs, # 0번: v자 엔진, 1번: 일자 엔진
    메뉴얼종류=am, # 0번: 오토, 1번: 수동
    기화기종류=carb
  )
mtcars <- mtcars %>%
  rename(
    기어=gear
  )

#left_join > 데이터추가
#특정 열을 기준으로 둔 데이터 추가

left_join(
  select(mtcars, 기어, 엔진종류, 속도),
  select(mtcars, 기어, 무게, 기화기종류),
  by='기어'
)


# distinct - 중복 제외
mtcars %>%
  mutate(
    번호=row_number(속도)
  ) %>%
  

# row_number - 번호 매기기 함수
mtcars %>%
  filter(
    속도 <= mean(속도)
  ) %>%
  tally() # tally - 행 개수 세는 함수
  #mutate(
    #번호=row_number(기통)
  #) %>%
  #arrange()

mtcars %>%
  filter(
    속도 <= mean(속도)
  ) %>%
  filter(
    메뉴얼종류==0
  ) %>%
  tally()

mtcars %>%
  distinct(
    속도
  ) %>%
  mutate(
    번호=row_number(속도)
  ) %>%
  arrange(
    번호
  )

# 결측치 - NA, NULL
# 불필요한 데이터를 걸러내기위한 함수
mtcars %>%
  mutate(
    썬팅여부=ifelse(속도 < mean(속도),1,0),
    소유자=ifelse(속도 < mean(속도), '이름', NA)
  ) %>%
  filter(
    !is.na(소유자)
  )

# 이상치 - 범위를 벗어난 데이터
mtcars %>%
  mutate(
    제동거리=ifelse(제동거리 > 3.9, NA, 제동거리),
    화면밝기=ifelse(화면밝기 < 100, NA, 화면밝기)
  ) %>%
  na.omit() %>%
  filter(
    화면밝기 <= mean(화면밝기) # 통계의 분모
  ) %>%
  tally()

# 메뉴얼 종류를 1,0이 아닌 오토, 수동으로 변경
# 엔진종류를 1,0이 아닌 일자,v자로 변경
# 4기통 엔진에는 v자 엔진이 없다
# 8기통 엔진의 차량은 오토가 없다
# 사고차량 파생변수를 만들어서 제동거리 3.9 이상은 사고차량으로
# 사고차량이 아닌것은 NA로
# 제대로된 전체 차량의 평균 속도 구하기
result <- mtcars %>%
  mutate(
    메뉴얼종류=ifelse(메뉴얼종류==1, '오토', '수동'),
    엔진종류=ifelse(엔진종류==1, '일자', 'V자')
  ) %>%
  mutate(
    엔진종류=ifelse(기통==4 & 엔진종류=='V자',NA,엔진종류),
  ) %>%
  mutate(
    메뉴얼종류=ifelse(기통==8 & 메뉴얼종류=='오토', NA, 메뉴얼종류)
  ) %>%
  mutate(
    사고차량=ifelse(제동거리 >= 3.9, '사고차량', NA)
  ) %>%
  filter(
    is.na(사고차량)
  ) %>%
  select(
    속도, 엔진종류, 메뉴얼종류
  ) %>%
  na.omit()
mean(result$속도)

# 예제 데이터 생성 기능
# 무작위 데이터 선택 기능
#min(mtcars$기름소모량) # 10.4
#max(mtcars$기름소모량) # 33.9
#기통(4,6,8), 화면밝기, 제동거리, 무게, 속도, 엔진종류(0,1), 메뉴얼종류(0,1), 기어(3,4,5), 기화기종류()
test <- test %>%
  test %>%
  bind_rows(
    data.frame(
      기름소모량=sample(((min(mtcars$기름소모량)*10):(max(mtcars$기름소모량)*10))/10,1000,replace = TRUE),
      기통=sample(c(4,6,8),1000,replace = TRUE),
      화면밝기=sample(((min(mtcars$화면밝기)*10):(max(mtcars$화면밝기)*10))/10,1000,replace = TRUE),
      마력=sample(((min(mtcars$마력)):(max(mtcars$마력))),1000,replace = TRUE),
      제동거리=sample(((min(mtcars$제동거리)*100):(max(mtcars$제동거리)*100))/100,1000,replace = TRUE),
      무게=sample(((min(mtcars$무게)*1000):(max(mtcars$무게)*1000))/1000,1000,replace = TRUE),
      속도=sample(((min(mtcars$속도)*100):(max(mtcars$속도)*100))/100,1000,replace = TRUE),
      엔진종류=sample(c(1,0),1000,replace = TRUE),
      메뉴얼종류=sample(c(1,0),1000,replace = TRUE),
      기어=sample(c(3,4,5),1000,replace = TRUE),
      엔진종류=sample(c(1,2,3,4,5,6,7,8),1000,replace = TRUE)
      )
    )
tail(test)

# 메뉴얼 종류를 1,0이 아닌 오토, 수동으로 변경
# 엔진종류를 1,0이 아닌 일자,v자로 변경
# 4기통 엔진에는 v자 엔진이 없다
# 8기통 엔진의 차량은 오토가 없다
# 사고차량 파생변수를 만들어서 제동거리 3.9 이상은 사고차량으로
# 사고차량이 아닌것은 NA로
# 제대로된 전체 차량의 평균 속도 구하기

test %>%
  mutate(
    메뉴얼종류=ifelse(메뉴얼종류==1, '오토', '수동'),
    엔진종류=ifelse(엔진종류==1, '일자', 'V자')
  ) %>%
  mutate(
    엔진종류=ifelse(기통==4 & 엔진종류=='V자',NA,엔진종류),
  ) %>%
  mutate(
    메뉴얼종류=ifelse(기통==8 & 메뉴얼종류=='오토', NA, 메뉴얼종류)
  ) %>%
  mutate(
    사고차량=ifelse(제동거리 >= 3.9, '사고차량', NA)
  ) %>%
  head()

test %>%
  mutate(
    메뉴얼종류=ifelse(메뉴얼종류==1, '오토', '수동'),
    엔진종류=ifelse(엔진종류==1, '일자', 'V자')
  ) %>%
  mutate(
    엔진종류=ifelse(기통==4 & 엔진종류=='V자',NA,엔진종류),
  ) %>%
  mutate(
    메뉴얼종류=ifelse(기통==8 & 메뉴얼종류=='오토', NA, 메뉴얼종류)
  ) %>%
  mutate(
    사고차량=ifelse(제동거리 >= 3.9, '사고차량', NA)
  ) %>%
  filter(
    is.na(사고차량)
  ) %>%
  select(
    속도, 엔진종류, 메뉴얼종류
  ) 

# 속도가 10~100을 가진 차량을 무작위로 생성
# 기통이 4,6,8,10을 가진 차량을 무작위로 생성
# 속도가 30 이상인 차량은 잘못된 차량
# 기통이 10인 차량은 잘못된 차량
# 제대로된 차량의 총 대수와 평균 속도 출력
max(mtcars$속도)

test %>%
  mutate(
    상태=ifelse(속도<30,'정상',NA)
  ) %>%
  mutate(
    상태=ifelse(기통==10,NA,ifelse(is.na(상태),NA,'정상'))
  ) %>% 
  na.omit() %>%
  head(100)

test <- test %>%
  bind_rows(
    data.frame(
      기름소모량=sample(((min(mtcars$기름소모량)*10):(max(mtcars$기름소모량)*10))/10,1000,replace = TRUE),
      기통=sample(c(4,6,8,10),1000,replace = TRUE),
      화면밝기=sample(((min(mtcars$화면밝기)*10):(max(mtcars$화면밝기)*10))/10,1000,replace = TRUE),
      마력=sample(((min(mtcars$마력)):(max(mtcars$마력))),1000,replace = TRUE),
      제동거리=sample(((min(mtcars$제동거리)*100):(max(mtcars$제동거리)*100))/100,1000,replace = TRUE),
      무게=sample(((min(mtcars$무게)*1000):(max(mtcars$무게)*1000))/1000,1000,replace = TRUE),
      속도=sample((1000:10000)/100,1000,replace = TRUE),
      엔진종류=sample(c(1,0),1000,replace = TRUE),
      메뉴얼종류=sample(c(1,0),1000,replace = TRUE),
      기어=sample(c(3,4,5),1000,replace = TRUE),
      엔진종류=sample(c(1,2,3,4,5,6,7,8),1000,replace = TRUE)
  )
)





