<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="resources/css/styleRegister.css">

<link rel="icon" href="resources/img/favicon.png">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <title>회원가입 - lxtagram</title>
</head>

<body>
   <div class="center" id="container">
      <div class="center" id="main">
         <div id="top" style="width:340px">
            <div id="title">
               <h1>lxtagram</h1>
            </div>
            <div id="description">
               <p>친구들의 사진과 동영상을 보려면<br> 가입하세요.</p>
            </div>
            <div id="fb-login">
               <i class="fa fa-facebook fb-icon" aria-hidden="true"></i>
               Facebook으로 로그인
            </div>
            <div id="or">또는</div>
            <form action="signup-action.do" id="signup-form">
               <input class="input-field" type="text" id="memName" name="memName" placeholder="성명" required="required">
               <div class="check_font" id="name_check"></div>
               <input class="input-field" type="text" id="memId" name="memId" placeholder="사용자이름(ID)" required="required">
               <div class="check_font" id="id_check"></div>
               <input class="input-field" type="password" id="memPw" name="memPw"placeholder="비밀번호" required="required">
               <div class="check_font" id="pw_check"></div>
               <input class="input-field" type="text" id="memPhone" name="memPhone"placeholder="휴대폰 번호" required="required">
               <div class="check_font" id="phone_check"></div>
               <input class="input-field" type="text" id="memEmail" name="memEmail"placeholder="이메일 주소" required="required">
               <div class="check_font" id="email_check"></div>
               

               <button class="btn-signup" type="submit" value="가입" id="signup_submit">가입</button>
            </form>
            
         </div>
         <div class="center" id="bottom">
            <div id="existing-user">계정이 있으신가요? <a class="blue-text" href="login-form.do">로그인</a>
            </div>
            <div>앱을 다운로드하세요.</div>
            <div class="dl-links">
               <a class="app-dl-links" href="#"><img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" alt=""></a>
               <a class="app-dl-links" href="#"><img src="https://lh3.googleusercontent.com/cjsqrWQKJQp9RFO7-hJ9AfpKzbUb_Y84vXfjlP0iRHBvladwAfXih984olktDhPnFqyZ0nu9A5jvFwOEQPXzv7hr3ce3QVsLN8kQ2Ao=s0" alt=""></a>
            </div>

         </div>
      </div>
      <div id="links">
         <ul>
            <li>소개</li>
            <li>블로그</li>
            <li>채용 정보</li>
            <li>도움말</li>
            <li>API</li>
            <li>개인정보처리방침</li>
            <li>Terms</li>
            <li>인기 계정</li>
            <li>해시태그</li>
            <li>위치</li>
         </ul>
         <div id="copyright">
            <select name="" id="lang">
               <option value="ko">한국어</option>
            </select>
            &copy; 2021 Spring Team2 Ixtagram 
         </div>
      </div>
   </div>
   
   <script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
   <script src="resources/js/signup-form.js">
   </script>

	

</body>

</html>