# dplyr 패키지
# 전처리 패키지
install.packages('dplyr')
library(dplyr)

# rename - 열 이름 변경 함수
mtcars <- rename(mtcars, 무게=wt, 기통=cyl)
mtcars
# mutate - 파생 변수 생성 함수
mutate(mtcars, 정지힘=무게 * 2, 정지거리=정지힘 * 무게 / 5)
# select - 데이터 검색 함수
select(mtcars, -기통:-기어)

# 파이프 라인 %>%
# 데이터 프레임 %>% 함수(입력값) -> 함수(데이터 프레임, 입력값)
mtcars %>% 
  mutate(정지힘=무게 * 2, 
         정지거리=정지힘 * 무게 / 5) %>% 
                                     select(기통:정지거리)

# mtcars 정지거리와 정지힘, 그리고 2개의 추가 파생변수를 만들고
# 파생변수들만 출력하는 코드 작성
mtcars <- mtcars %>% rename(
  기름소모량=mpg,
  화면밝기=disp,
  마력=hp,
  제동거리=drat,
  속도=qsec,
  엔진종류=vs,
  메뉴얼종류=am,
  기화기종류=carb
) 


mtcars %>% 
  mutate(
    정지힘=속도*마력/2,
    정지거리=제동거리+정지힘,
    가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
    면허증종류=메뉴얼종류
) %>%
  select(
   정지힘:면허증종류 
  )

#filter - 필요한 행만 검색
filter(mtcars, 마력== 110)
mtcars

# bind_rows - 제약
# 열 개수가 동일
# 열 타입의 개수가 동일
# 중복된 데이터를 더해서 추가함(중복된데이터를 거르지 않음)
bind_row(select(mtcars, 속도, 기통),select(mtcarsm, 속도))
mtcars %>% bind_rows(mtcars) #bind_rows(mtcars, mtcars)

mtcars %>% 
  filter(
    마력 == 110 & 기어 == 4
  ) %>%
  bind_rows(
    mtcars %>%
      filter(
        마력 < 110
      )
  ) %>% 
  mutate(
    정지힘=속도*마력/2,
    정지거리=제동거리+정지힘,
    가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
    면허증종류=메뉴얼종류
  )

# 가격이 평균 가격보다 작은 차량중 오토 차량 목록
# 가격이 평균 가격보다 큰 차량중 6기통 오토 차랑 목록
# 위 두 목록을 합친 목록
mtcars %>%
  mutate(
    정지힘=속도*마력/2,
    정지거리=제동거리+정지힘,
    가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
    면허증종류=메뉴얼종류
  ) %>%
  filter(
    가격 < mean(가격) & 메뉴얼종류==1
  ) %>%
    bind_rows( #union
      mtcars %>%
      mutate(
        정지힘=속도*마력/2,
        정지거리=제동거리+정지힘,
        가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
        면허증종류=메뉴얼종류
      ) %>%
        filter(
        가격 < mean(가격) &  메뉴얼종류==1 & 기통==6
        )
    )

#arrange > sort
arrange(mtcars, desc(기름소모량),기통)
mtcars %>% 
  arrange(
    기통, 
    desc(기름소모량)
  )
#summarise - 통계를 구할 때
summary(mtcars)
mtcars %>%
        summarise(
          기름소모평균=mean(기름소모량), # 평균
          기름소모최고=max(기름소모량),
          기름소모최하=min(기름소모량),
          기름소모총량=sum(기름소모량),
          기름소모평균2=median(기름소모량), # mean에 가까운 데이터
          기름소모표준편차=sd(기름소모량)
          )
#group_by - 데이터 자르기 > 묶기
summarise(group_by(mtcars, 기통), 기름소모평균=mean(기름소모량))
mtcars %>%
  group_by(
    기통
  ) %>%
  filter(
    기름소모량 < mean(기름소모량)
  )

# 오토, 수동 별 차량 가격평균
# 기통 별 차량 가격 표준편차
# 오토, 수동 별 차량 정렬(동일 한 경우 기통, 속토 순으로 정렬)
mtcars %>%
  mutate(
    정지힘=속도*마력/2,
    정지거리=제동거리+정지힘,
    가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
    면허증종류=메뉴얼종류
  ) %>%
    group_by(
      메뉴얼종류
    ) %>%
    summarise(
      차량가격평균=mean(가격)
    ) 

mtcars %>%
  mutate(
    정지힘=속도*마력/2,
    정지거리=제동거리+정지힘,
    가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
    면허증종류=메뉴얼종류
  ) %>%
    group_by(
      기통
    ) %>%
      summarise(
        차량가격표준편차=sd(기통)
      )

mtcars %>%
  mutate(
    정지힘=속도*마력/2,
    정지거리=제동거리+정지힘,
    가격=100-기름소모량+화면밝기*3+마력*20+속도*50,
    면허증종류=메뉴얼종류
  ) %>%
  arrange(
    메뉴얼종류,
    기통,
    속도
  )


mtcars %>%
  group_by(
    기통
  ) %>%
  mutate(
    차량종류=ifelse(메뉴얼종류==1, '오토','수동')
  )


      
 