
var FaceBookApp = {
    	FBScopes: {scope: 'public_profile,email'},
    	accessToken: '',
    	// 초기화 함수
    	init: function(d, s, id) {
    	    	window.fbAsyncInit = function() {
    	    	    	FB.init({
    	    	    	    	appId : '950393115078074',
    	    	    	    	xfbml : true,
    	    	    	    	version : 'v2.6'
    	    	    	});
    	    	};

    	    	var js, fjs = d.getElementsByTagName(s)[0];
    	    	if (d.getElementById(id)) {return;}
    	     js = d.createElement(s); js.id = id;
    	    	js.src = "//connect.facebook.net/en_US/sdk.js";
    	     fjs.parentNode.insertBefore(js, fjs);
    	},
    	statusChangeCallback: function(response) {
    	    	FaceBookApp.accessToken = response.authResponse.accessToken;

    	    	// 연결 성공
    	    	if (response.status === 'connected') {
    	    	    	// 연결 성공시 실행할 코드
    	    	    	FaceBookApp.FBsigninCallback();
    	    	// 인증 거부
    	    	} else if (response.status === 'not_authorized') {
    	    	    	console.log('Please log into this app.');
    	    	// 그 밖..
    	    	} else {
    	    	    	console.log('Please log into Facebook.');
    	    	}
    	},
    	FBsigninCallback: function() {
    	    	FB.api('/me?fields=id,email,name', function(response) {
    	    	    	var id = response.id;
    	    	    	var token = FaceBookApp.accessToken;
    	    	    	var memberName = response.name;
    	    	    	var email = response.email;
    	    	    	location.href='../member.do?command=facebookLogin&&facebookId='+id+'&&email='+email;
    	    	    	// 실행할 코

     	   	});
    	}
};
// 초기화 실행
FaceBookApp.init(document, 'script', 'facebook-jssdk');