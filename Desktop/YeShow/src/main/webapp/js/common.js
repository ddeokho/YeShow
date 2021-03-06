	/**/
	var isUserid=function(obj){
		var uidVal=obj.value;//아이디 입력값
		var pattern=new RegExp(/^[a-zA-Z0-9_!]{4,16}$/);//+는 하나 이상
		var bool=pattern.test(uidVal);
		//사용자가 입력한 값이 패턴에 맞으면 true반환
		//아니면 false를 반환
		//alert("bool="+bool);
		return bool;
	}//-----------
	/* 0~9사이의 숫자, -, + 기호로 시작하거나 끝나야 한다. */
	var isTel=function(obj){
		var val=obj.value;//전화번호 입력값
		var pattern=new RegExp(/^[0-9-+]+$/);//[+는 기호 혀용]+하나이상
		var bool=pattern.test(val);
		return bool;
		/*
			^ : 시작을 의미
			$ : 끝을 의미
			a-z : 알파벳 소문자
			A-Z : 알파벳 대문자
			0-9 : 숫자
			+ : 패턴이 한 번 이상 반복된다는 의미
		*/
		
	}//-----isTel
	
	/*생년월일 날짜 유형 체크
		yyyy-MM-dd
		[0-9]{4}
	
	*/
	var isDate=function(obj){
		var val=obj.value;
		var pattern=new RegExp(/^\b\d{4}[-\/]\d{1,2}[-\/]\d{1,2}\b$/);
		return pattern.test(val);
		/*
		\b : 단의어 경계를 나타내며, 해당 패턴이 정확히 일치해야 함을 의미한다.
		
		\d{4} : 숫자 4개가 나와야 한단 의미
		
		[-\/] : 하이픈(-) 이나 슬래스(/)를 허용하겠단 의미
		\d{1,2} : 숫자가 1개 또는 2개 올 수 있다는 의미
		
		*/
	}//----------------
	
	
	var isCp=function(obj){
		var val=obj.value;
		var pattern=new RegExp(/^\b(010|011)[-]\d{3,4}[-]\d{4}\b$/);
		return pattern.test(val);
	}//---현드폰
	
	/*이베일 형식 체크
	as123@naver.com
	알파벳숫자 5~12자리,하이플[-] =>as134[5,12]
	@가 와야하고
	알파벳소문자[2,10]
	. (1개 오던지 생략 가능. 여러개는 안됨)
	알파벳소문자[2,3]
	
	*/
	var isEmail=function(obj){
		var val=obj.value;
		var pattern=new RegExp(/^[\w-_]{5,12}@[a-z]{2,10}[\.]([a-z]{2,3}[\.])?[a-z]{2,3}$/);
		return pattern.test(val);
	}
	