## LMS Node 10. 프로젝트 - 사각형 만들기 / Kiosk만들기
## 1. 사각형 넓이 구하기

### 설계하면서 만들기

-  직사각형, 평행사변형, 사다리꼴의 넓이를 모두 구할 수 있는 클래스는 설계하는 것을 목표로 한다.
 -  설계 시 주의사항
	 -  직사각형은 가로, 세로를 입력 받아야한다.
	 -  평행사변형은 밑변, 높이를 입력 받아야한다.
	 -  (등변) 사다리꼴은 밑변, 윗변, 높이를 입력 받아야한다.
 -  각 형별 공식
	 -  직사각형 **:**   가로 X 세로
	 -  평행사변형 **:**  밑변 X 높이
	 -  (등변) 사다리꼴 **:**  ((밑변 + 윗변) X 높이) / 2
#### 🔶 사각형 클래스 만들기
-  3가지 사각형 넓이를 구할 수 있는 사각형 클래스를 만들겠습니다.
	```python
	class Square:  
    def __init__(self):  
       # 직사각형, 평행사변형, 사다리꼴의 넓이 구하기 중 어떤 넓이를 구할지 묻기  
        r = 0  
        while r not in [1, 2, 3]:  
            square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요. \n 1.직사각형, 2.평행사변형, 3.사다리꼴 \n >>>'))  
            if square == 1:  
                print('직사각형의 함수는 rect()입니다.')  
                break  
            elif square == 2:  
                print('평행사변형의 함수는 par()입니다.')  
                break  
            elif square == 3:  
                print('사다리꼴의 함수는 trape()입니다.')  
                break  
            else:  
                print('1, 2, 3 중에서 다시 입력해주세요.\n')
	```

-  위 코드는 3가지 사각형 넓이 중 어떤 사각형의 넓이를 구할지 묻는 코드를 `class` 함수안에
	`while문`으로 반복하여 잘못 입력을 하더라도 다시 되물어 원하는 사각형을 선택할 수 있게 한다.
##### 🔶 `split()`
- 사각형의 넓이를 구하는 메서드에서 가로, 세로 입력받는 방법은 2 가지가 있다.
	1. 가로와 세로를 각 각 `input()` 함수로 따로 받는 방법
	2.  `split()`함수를 사용하여 가로와 세로를 한번에 입력 받고 두 개로 나누어 각 각의 변수에 저장하는 방법

- 아래의 예시는 `split()`을 이용한 예시이다.
	```python
	# split() 함수 예시
	a, b, c = '가, 나, 다'.split(',')
	print(b)
	```

##### 🔶 `map()`
-  `map(function, iterable)` 함수의 기본 구조이다.
	여기서 이터러블은 '반복할 수 있는 객체'
	
-  아래의 예시는 `map()`함수를 이용한 예시이다.
	```python
	# 3, 4 입력
	aa, bb = map(int, input('a, b를 입력하시오. 예시 : a,b').split(','))
	print(aa, type(aa))

	>> 3, <class 'int'>
	```

- 위 `split()`, `map()` 함수의 예시를 통해 `int`형 자료로 묶을 수 있게 되었다. 
	위 내용을 바탕으로 코드로 작성하면 아래와 같다.
	```python
	class Square:  
    def __init__(self):  
       # 직사각형, 평행사변형, 사다리꼴의 넓이 구하기 중 어떤 넓이를 구할지 묻기  
        r = 0  
        while r not in [1, 2, 3]:  
            square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요. \n 1.직사각형, 2.평행사변형, 3.사다리꼴 \n >>>'))  
            if square == 1:  
                print('직사각형의 함수는 rect()입니다.')  
                break  
            elif square == 2:  
                print('평행사변형의 함수는 par()입니다.')  
                break  
            elif square == 3:  
                print('사다리꼴의 함수는 trape()입니다.')  
                break  
            else:  
                print('1, 2, 3 중에서 다시 입력해주세요.\n')
	
	def rect(self):  
    width, vertical = map(int, input('가로, 세로를 입력하세요. 예시: 가로,세로\n >>>').split(','))  
    area = width * vertical # 직사각형 넓이 구하는 공식
    result = '직사각형의 넓이는: ' + str(area)  
    return result
	```

-  잘 만들어졌는지 확인해 보기
	```python
	# 객체 만들기
	a = Square()
	# 메서드 써보기
	a.rect()
	```

-  실행 후 아래의 사진으로 결과값이 실행됨을 알 수 있다.
![[Pasted image 20231117020024.png]]
#### 🔶 평행사변형과 사다리꼴 메서드 만들기
-  위에서 사각형 클래스와 직사각형 메서드를 만들어보았다.
	여기에선 평행사변형과 사다리꼴 메서드를 만들어본다.
	```python
		# 평행사변형 메서드  
		def par(self):  
		    base, height = map(int, input('밑변, 높이를 입력하세요. 예시: 밑변,높이\n >>>').split(','))  
		    area = base * height  # 평행사변형 공식
		    result = '평행사변형의 넓이는: ' + str(area)  
		    return result  
		# 사다리꼴 메서드  
		def trape(self):  
		    base, top, height = map(int, input('밑변, 윗변, 높이를 입력하세요. 예시: 밑변,윗변,높이\n >>>').split(','))  
		    area = (base + top) * height / 2  # 사다리꼴 공식
		    result = '사다리꼴의 넓이는: ' + str(area)  
		    return result
	```

-  이 후 클래스를 완성해본다.
	```python
	class Square:  
    def __init__(self):  
       # 직사각형, 평행사변형, 사다리꼴의 넓이 구하기 중 어떤 넓이를 구할지 묻기  
        r = 0  
        while r not in [1, 2, 3]:  
            square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요. \n 1.직사각형, 2.평행사변형, 3.사다리꼴 \n >>>'))  
            if square == 1:  
                print('직사각형의 함수는 rect()입니다.')  
                break  
            elif square == 2:  
                print('평행사변형의 함수는 par()입니다.')  
                break  
            elif square ==3:  
                print('사다리꼴의 함수는 trape()입니다.')  
                break  
            else:  
                print('1, 2, 3 중에서 다시 입력해주세요.\n')  
  
    # 직사각형 메서드  
    def rect(self):  
        width, vertical = map(int, input('가로, 세로를 입력하세요. 예시: 가로,세로\n >>>').split(','))  
        area = width * vertical  
        result = '직사각형의 넓이는: ' + str(area)  
        return result  
    # 평행사변형 메서드  
    def par(self):  
        base, height = map(int, input('밑변, 높이를 입력하세요. 예시: 밑변,높이\n >>>').split(','))  
        area = base * height  
        result = '평행사변형의 넓이는: ' + str(area)  
        return result  
    # 사다리꼴 메서드  
    def trape(self):  
        base, top, height = map(int, input('밑변, 윗변, 높이를 입력하세요. 예시: 밑변,윗변,높이\n >>>').split(','))  
        area = (base + top) * height / 2  
        result = '사다리꼴의 넓이는: ' + str(area)  
        return result  
  
	a = Square()  
	print(a.par())
	print(a.trape())
	```

-  평행사변형 결과값 
![[Pasted image 20231117021028.png]]
-  사다리꼴 결과값
![[Pasted image 20231117021103.png]]

## 2. 키오스크 만들기

### 키오스크 만들기
-  실생활에서 키오스크를 이용한 주문이 많아진다.
	이번 챕터에서는 키오스크로 주문표를 만들어본다.

-  아래의 예시처럼 만들어본다.
	```python
	# 주문 번호 코드로 출력  
	print('⟝' + '-' * 30 + '⟞')
	print('|' + ' ' * 31 + '|')
	print('|' + ' ' * 31 + '|')
	print('|' + ' ' * 31 + '|')
	print('|' + ' ' * 31 + '|')
	print('상품명 : HOT 아메리카노')
	print('총 주문 금액 : 1500원')
	print('|' + ' ' * 31 + '|')
	print('|' + ' ' * 31 + '|')
	print('|' + ' ' * 31 + '|')
	print('|' + ' ' * 31 + '|')
	print('⟝' + '-' * 30 + '⟞')
	```

![[Pasted image 20231117021622.png]]

-  필요한 변수들을 목록으로 만들어본다.
	-  HOT or ICE
	-  주문 메뉴
	-  주문 금액

-  HOT or ICE **:**  메뉴를 고르면 HOT또는 ICE중에서 고를 수 있도록 한다.
-  주문메뉴 **:**  메뉴는 커피 메뉴와 논커피 메뉴 3가지씩 준비한다.
	`커피 = [아메리카노, 라떼, 모카]`
	`논커피 = [유자차, 녹차, 초코라떼]`
-  주문 금액 **:**  메뉴 리스트 순서에 맞추어 리스트로 적는다.
	`커피 = [2000, 3000, 3000]`
	`논커피 = [2500, 2500, 3000]`

#### 🔶 메뉴판 만들기
-  위 리스트를 메뉴와 가격으로 리스트화 해본다.
	```python
	menu = ['아메리카노', '라떼', '모카', '유자차', '녹차', '초코라떼']
	price = [2000, 3000, 3000, 2500, 2500, 3000]
	```

- `Kiosk` 클래스를 본격적으로 만들어본다. (자동으로 호출되는 생성자 안에 메뉴와 가격을 속성으로 추가한다.)
	```python
	class Kiosk:
		def __init__(self): # 생성자 작성
			self.menu = menu # 위 메뉴를 자동으로 호출되게 속성으로 추가
			self.price = price # 위 금액을 자동으로 호출되게 속성으로 추가

	a = Kiosk() # 객체 생성
	a.menu # 메뉴 객체 속성을 출력
	>>> ['아메리카노', '라떼', '모카', '유자차', '녹차', '초코라떼'
	
	a.price # 금액 객체 속성을 출력
	>>> [2000, 3000, 3000, 2500, 2500, 3000]
	```

#### 🔶 메뉴판 출력하기
-  음료 주문을 받으면 고객에게 메뉴판을 보여줘야한다.  `self.menu`에 있는 갯수만큼 메뉴를 출력하는 `menu_print()`를 출력해보자.
	```python
	class Kiosk:
		def __init__(self): # 생성자 작성
			self.menu = menu # 위 메뉴를 자동으로 호출되게 속성으로 추가
			self.price = price # 위 금액을 자동으로 호출되게 속성으로 추가
		
		def menu_print(self): # 메뉴판 출력하기 위한 메서드
			for i in range(len(self.menu)): # self.menu에 리스트 수 만큼 반복
				print(i+1, self.menu[i],":", self.price[i],"원")
	a = Kiosk()
	a.menu_print() # 메뉴판 출력 객체 속성 출력
	>>> 1 아메리카노 : 2000원
	>>> 2 라떼 : 3000원
	>>> 3 모카 : 3000원
	>>> 4 유자차 : 2500원
	>>> 5 녹차 : 2500원
	>>> 6 초코라떼 : 3000원	
	```
-  실행 시 6 가지 음료가 잘 출력됨을 볼 수 있다.

#### 🔶 주문하기
-  이번에는 음료를 주문받는 코드를 만들어보자.
	```python
	def menu_select(self):
		n = int(input("음료의 번호를 입력하세요: "))
		self.price_sum = self.price[n-1] # n-1을 하는 이유는 self.price 리스트의 인덱스가 0부터 시작하기에 input에서 받은 정수값을 빼줘야 맞는 인덱스를 찾아갈 수 있기 때문
		print(self.menu[n-1], ":", self.price[n-1], '원') # 입력받은 메뉴 및 금액 출력
	```

-  이 때 음료의 번호를 잘못 입력할 수도 있으니 예외 처리도 추가한다.
	```python
	def menu_select(self):
		while True: # 원하는 음료가 나올때까지 반복
			n = int(input("음료의 번호를 입력하세요: "))
			if 1 <= n & n <= len(menu) # if-else문으로 예외처리함
				self.price_sum = self.price[n-1]
				print(self.menu[n-1], ":", self.price[n-1], '원')
				break # 원하는 음료가 나왔으므로 break를 통해 반복문 탈출
			else:
				print("없는 메뉴입니다. 번호를 다시 입력해주세요.")
	```

-  이제 위 코드와 합쳐서 주문을 해보기
	```python
	menu = ['아메리카노', '라떼', '모카', '유자차', '녹차', '초코라떼']
	price = [2000, 3000, 3000, 2500, 2500, 3000]

	class Kiosk:
		def __init__(self):
			self.menu = menu
			self.price = price
		
		def menu_print(self):
			for i in range(len(menu)):
				print(i+1, self.menu[i], ":", self.price[i], '원')

		def menu_select(self):
			while True:
				n = int(input("음료의 번호를 입력하세요: "))
				if 1 <= n & n <= len(menu)
					self.price_sum = self.price[n-1]
					print(self.menu[n-1], ":", self.price[n-1], '원')
					break
				else:
					print("없는 메뉴입니다. 번호를 다시 입력해주세요.")

	a = Kiosk()
	a.menu_print()
	>>> 1 아메리카노 : 2000원
	>>> 2 라떼 : 3000원
	>>> 3 모카 : 3000원
	>>> 4 유자차 : 2500원
	>>> 5 녹차 : 2500원
	>>> 6 초코라떼 : 3000원	
	
	a.menu_select()
	>>> "음료 번호를 입력하세요" : 1
	>>> 아메리카노 : 2000원
	```
-  실행 시 문제 없이 출력되는 결과를 볼 수 있다.

-  이번에는 음료의 온도를 확인하고 출력하는 것을 해본다.
	```python
	menu = ['아메리카노', '라떼', '모카', '유자차', '녹차', '초코라떼']
	price = [2000, 3000, 3000, 2500, 2500, 3000]

	class Kiosk:
		def __init__(self):
			self.menu = menu
			self.price = price
		
		def menu_print(self):
			for i in range(len(menu)):
				print(i+1, self.menu[i], ":", self.price[i], '원')

		def menu_select(self):
			while True:
				n = int(input("음료의 번호를 입력하세요: "))
				if 1 <= n & n <= len(menu)
					self.price_sum = self.price[n-1]
					print(self.menu[n-1], ":", self.price[n-1], '원')
					break
				else:
					print("없는 메뉴입니다. 번호를 다시 입력해주세요.")
			
			# 음료 온도 물어보기	
			while True:
				t = int(input("HOT 음료는 1을, ICE음료는 2를 입력하세요 : "))
				if t == 1:
					self.temp = "HOT"
				elif t == 2:
					self.temp = "ICE"
				else:
					print("1과 2 중 하나를 입력해주세요.")
				break
			print(f"주문 음료 {self.temp} {self.menu[n-1]} : {self.price[n-1]}원 ")

	a = Kiosk()
	a.menu_print()
	>>> 1 아메리카노 : 2000원
	>>> 2 라떼 : 3000원
	>>> 3 모카 : 3000원
	>>> 4 유자차 : 2500원
	>>> 5 녹차 : 2500원
	>>> 6 초코라떼 : 3000원

	a.menu_select()
	>>> "음료 번호를 입력하세요" : 1
	>>> "HOT 음료는 1을, ICE음료는 2를 입력하세요" : 2
	>>> 주문 음료 ICE 아메리카노 : 2000 원
	```
-  실행 시 문제 없이 출력되는 결과를 볼 수 있다.

#### 🔶 추가 주문
-  음료를 하나만 주문할 수도 있지만, 주문을 추가로 더 할 수도 있으므로 추가 주문 코드도 만들어보자.
	 ```python
	menu = ['아메리카노', '라떼', '모카', '유자차', '녹차', '초코라떼']
	price = [2000, 3000, 3000, 2500, 2500, 3000]

	class Kiosk:
		def __init__(self):
			self.menu = menu
			self.price = price
		
		def menu_print(self):
			for i in range(len(menu)):
				print(i+1, self.menu[i], ":", self.price[i], '원')

		def menu_select(self):
			self.order_menu = []  # 주문 리스트
			self.order_price = []  # 가격 리스트
			
			while True:
				n = int(input("음료의 번호를 입력하세요: "))
				if 1 <= n & n <= len(menu)
					self.price_sum = self.price[n-1]
					print(self.menu[n-1], ":", self.price[n-1], '원')
					break
				else:
					print("없는 메뉴입니다. 번호를 다시 입력해주세요.")
			
			while True:
				t = int(input("HOT 음료는 1을, ICE음료는 2를 입력하세요 : "))
				if t == 1:
					self.temp = "HOT"
				elif t == 2:
					self.temp = "ICE"
				else:
					print("1과 2 중 하나를 입력해주세요.")
				break
			print(f"주문 음료 {self.temp} {self.menu[n-1]} : {self.price[n-1]}원 ")

			# 추가 주문하기
			while True:
				print() # 줄바꿈
				# 추가 주문 또는 지불
				n = int(input("추가 주문은 음료 번호를, 지불은 0을 누르세요 : "))
				if 1 < n and n < len(menu) + 1:
					while True:
						t = int(input("HOT 음료는 1을, ICE음료는 2를 입력하세요 : "))
						if t == 1:
							self.temp = "HOT"
						elif t == 2:
							self.temp = "ICE"
						else:
							print("1과 2 중 하나를 입력해주세요.")
						break
					# 추가 메뉴를 .order_menu에 더하기
					self.order_menu.append(self.temp + " " + self.menu[n-1])
					# 추가 금액을 .order_price에 더하기
					self.order_price.append(self.price[n-1])
					# 추가된 금액을 합계로 구하기
					self.price_sum += self.price[n-1]
				else:
					if n == 0: # 지불을 입력하면
						print("주문이 완료되었습니다.")
						print(self.order_menu, self.price_menu) # 확인을 위한 리스트 출력
					else: # 없는 번호를 입력할 때
						print("없는 메뉴입니다. 다시 주문해 주세요.")

	a = Kiosk()
	a.menu_print()
	>>> 1 아메리카노 : 2000원
	>>> 2 라떼 : 3000원
	>>> 3 모카 : 3000원
	>>> 4 유자차 : 2500원
	>>> 5 녹차 : 2500원
	>>> 6 초코라떼 : 3000원

	a.menu_select()
	>>> "음료 번호를 입력하세요" : 1
	>>> "HOT 음료는 1을, ICE음료는 2를 입력하세요" : 2
	>>> "음료 번호를 입력하세요" : 1
	>>> "HOT 음료는 1을, ICE음료는 2를 입력하세요" : 2
	>>> "음료 번호를 입력하세요" : 1
	>>> "HOT 음료는 1을, ICE음료는 2를 입력하세요" : 2
	>>> "음료 번호를 입력하세요" : 6
	>>> "HOT 음료는 1을, ICE음료는 2를 입력하세요" : 2
	>>> "음료 번호를 입력하세요" : 6
	>>> "HOT 음료는 1을, ICE음료는 2를 입력하세요" : 2
	>>> # 총 다섯잔 주문 후
	>>> 주문이 완료되었습니다.
		['ICE americano', 'ICE americano', 'ICE americano', 'ICE choco_latte', 
		'ICE choco_latte'] [2000, 2000, 2000, 3000, 3000]
	```
-  실행 시 문제 없이 출력되는 결과를 볼 수 있다.

#### 🔶 지불
-  주문이 완료 되었으니 지불을 해야한다. 지불 할 메서드를 만들어 보자.
	```python
	
	```
