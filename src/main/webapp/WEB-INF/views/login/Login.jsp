<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Đăng nhập</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/login.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="icon" href="data:,">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />

</head>
<body>
	<div id="toast"></div>
	<header>
		<div class="hero-container">
			<div class="items-start">
				<div>
					<img
						src="<%=request.getContextPath()%>/assets/user/image/vietnam.svg"
						width="26" alt="language icon"> <span
						class="mx-2">vi</span> <img
						src="<%=request.getContextPath()%>/assets/user/image/icon_form_droplist.svg"
						alt="icon_form_droplist">
				</div>
				<div>
					<img
						src="<%=request.getContextPath()%>/assets/user/image/download_app.svg"
						width="26" alt="download app icon"> <span
						class="mx-2">Tải ứng dụng</span> <img
						src="<%=request.getContextPath()%>/assets/user/image/icon_form_droplist.svg"
						alt="icon_form_droplist">
				</div>
			</div>

			<img
				src="<%=request.getContextPath()%>/assets/user/image/home_logo.svg"
				alt="FUTA Bus Lines" class="hero-image">

			<div class="justify-end">
				<img
					src="<%=request.getContextPath()%>/assets/user/image/person.svg"
					width="26" style="margin: 0 10px" alt="download app icon"> <a
					href="javascript:void(0)" class="gap-3 cursor-pointer"
					onclick="redirectToLogin()"> Đăng nhập/Đăng ký </a>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="left">
			<img
				src="<%=request.getContextPath()%>/assets/user/image/logoText.svg"
				alt="Logo"> <img
				src="<%=request.getContextPath()%>/assets/user/image/TVC.svg"
				alt="Xe trung chuyển">
		</div>

		<div class="right">
			<div class="login-box">
				<h2 id="form-title">Đăng nhập tài khoản</h2>
				<div class="tabs">
					<button class="active" onclick="showLoginForm()">ĐĂNG NHẬP</button>
					<button onclick="showRegisterForm()">ĐĂNG KÝ</button>
				</div>

				<form id="login-form">
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/email.png"
							alt="Email Icon" class="email-icon"> <input type="text"
							id="email" placeholder="Nhập email" autocomplete="username">
					</div>
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/password.svg"
							alt="password" class="password-icon"> <input
							type="password" placeholder="Nhập mật khẩu" id="password"
							autocomplete="current-password"> <img
							src="<%=request.getContextPath()%>/assets/user/image/hide.png"
							alt="eye" class="eye-icon" onclick="togglePassword(this)">
					</div>
					<button type="submit" class="btn" id="login-button">Đăng
						nhập</button>
					<div class="forgot-password-container">
						<a href="#" class="forgot-password"
							onclick="showForgotPasswordForm(); return false;">Quên mật
							khẩu?</a> <img
							src="<%=request.getContextPath()%>/assets/user/image/google.png"
							alt="Google" class="google-icon" style="cursor: pointer;" onclick="signInWithGoogle()">
					</div>
				</form>

				<form id="register-form" style="display: none;">
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/email.png"
							alt="Email Icon" class="email-icon"> <input type="text"
							id="register-email" placeholder="Nhập email"
							autocomplete="username">
					</div>
					<button type="submit" class="btn" id="send-otp-button">Gửi
						mã</button>
				</form>

				<form id="otp-form" style="display: none;">
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/email.png"
							alt="Email Icon" class="email-icon"> <input type="text"
							placeholder="Nhập mã OTP" id="otp-code">
					</div>
					<button type="submit" class="btn" id="register-button">Xác
						minh</button>
				</form>

				<form id="password-form" style="display: none;">
					<input type="text" name="username" id="username"
						autocomplete="username" hidden
						value="<%=session.getAttribute("email")%>">
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/password.svg"
							alt="password" class="password-icon"> <input
							type="password" placeholder="Nhập mật khẩu" id="password1"
							autocomplete="current-password"> <img
							src="<%=request.getContextPath()%>/assets/user/image/hide.png"
							alt="eye" class="eye-icon" onclick="togglePassword(this)">
					</div>
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/password.svg"
							alt="password" class="password-icon"> <input
							type="password" placeholder="Nhập lại mật khẩu" id="password2"
							autocomplete="current-password"> <img
							src="<%=request.getContextPath()%>/assets/user/image/hide.png"
							alt="eye" class="eye-icon" onclick="togglePassword(this)">
					</div>
					<button type="submit" class="btn" id="create-account-button">Xác
						nhận</button>
				</form>

				<form id="forgot-password-form" style="display: none;">
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/email.png"
							alt="Email Icon" class="email-icon"> <input type="text"
							id="forgot-email" placeholder="Nhập email để đặt lại mật khẩu"
							autocomplete="username">
					</div>
					<button type="submit" class="btn" id="send-forgot-otp-button">Gửi
						mã</button>
				</form>

				<form id="verify-otp-form" style="display: none;">
					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/email.png"
							alt="Email Icon" class="email-icon"> <input type="text"
							id="verify-otp-code" name="otp"
							placeholder="Nhập mã OTP được gửi đến email của bạn">
					</div>
					<button type="submit" class="btn" id="verify-otp-button">Xác
						minh</button>
				</form>

				<form id="reset-password-form" style="display: none;">
					<input type="text" name="username" id="reset-username"
						autocomplete="username" hidden
						value="<%=session.getAttribute("email")%>">

					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/password.svg"
							alt="password" class="password-icon"> <input
							type="password" placeholder="Nhập mật khẩu mới"
							id="reset-password1" autocomplete="new-password"> <img
							src="<%=request.getContextPath()%>/assets/user/image/hide.png"
							alt="eye" class="eye-icon" onclick="togglePassword(this)">
					</div>

					<div class="input-group">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/password.svg"
							alt="password" class="password-icon"> <input
							type="password" placeholder="Nhập lại mật khẩu mới"
							id="reset-password2" autocomplete="new-password"> <img
							src="<%=request.getContextPath()%>/assets/user/image/hide.png"
							alt="eye" class="eye-icon" onclick="togglePassword(this)">
					</div>

					<button type="submit" class="btn" id="reset-account-button">Đặt
						lại mật khẩu</button>
				</form>
			</div>
		</div>
	</div>

	<section class="promotions">
		<h3>Kết nối FUTA Group</h3>
		<span>Đa dạng hệ sinh thái FUTA Group qua App FUTA: mua vé xe
			Phương Trang, Xe Hợp Đồng, Xe Buýt, Giao hàng...</span> <img
			src="<%=request.getContextPath()%>/assets/user/image/ketnoi.svg"
			alt="ketnoi" class="ketnoi-image">
	</section>

	<footer>
		<div class="footer-container">
			<div class="footer-contact">
				<h3>TRUNG TÂM TỔNG ĐÀI & CSKH</h3>
				<p class="hotline">1900 6067</p>
				<p>CÔNG TY CỔ PHẦN XE KHÁCH PHƯƠNG TRANG</p>
				<p>Địa chỉ: Số 01 Tô Hiến Thành, Phường 3, TP. Đà Lạt.</p>
				<p>Email: hotro@futa.vn</p>
				<p>Điện thoại: 02838386852</p>
				<p>Fax: 02838386853</p>
			</div>
			<div class="footer-links">
				<h4>FUTA Bus Lines</h4>
				<ul>
					<li><a href="#">Về chúng tôi</a></li>
					<li><a href="#">Lịch trình</a></li>
					<li><a href="#">Tuyển dụng</a></li>
					<li><a href="#">Tin tức & Sự kiện</a></li>
					<li><a href="#">Mạng lưới văn phòng</a></li>
				</ul>
			</div>
			<div class="footer-support">
				<h4>Hỗ trợ</h4>
				<ul>
					<li><a href="#">Tra cứu thông tin đặt vé</a></li>
					<li><a href="#">Điều khoản sử dụng</a></li>
					<li><a href="#">Câu hỏi thường gặp</a></li>
					<li><a href="#">Hướng dẫn đặt vé trên Web</a></li>
					<li><a href="#">Hướng dẫn nạp tiền trên App</a></li>
				</ul>
			</div>
			<div class="footer-apps">
				<h4>TẢI APP FUTA</h4>
				<a href="#"><img
					src="<%=request.getContextPath()%>/assets/user/image/CHPlay.svg"
					alt="CH Play"></a> <a href="#"><img
					src="<%=request.getContextPath()%>/assets/user/image/AppStore.svg"
					alt="App Store"></a>
			</div>
		</div>
		<div class="footer-logos">
			<img
				src="<%=request.getContextPath()%>/assets/user/image/BusLines.svg"
				alt="FUTA Bus Lines"> <img
				src="<%=request.getContextPath()%>/assets/user/image/logo_futa_express.svg"
				alt="FUTA Express"> <img
				src="<%=request.getContextPath()%>/assets/user/image/_FUTA_Advertising.svg"
				alt="FUTA Advertising"> <img
				src="<%=request.getContextPath()%>/assets/user/image/reststop.png"
				alt="Phúc Lộc Rest Stop">
		</div>
		<div class="footer-bottom">
			<p>© 2025 | Học viện Công nghệ Bưu chính Viễn thông cơ sở TP. Hồ
				Chí Minh | Thiết kế bởi: Nguyễn Văn Dũng - Nguyễn Hữu Vinh - Lê Minh
				Thông</p>
		</div>
	</footer>

	<script>
	function togglePassword(icon) {
	    var passwordField = icon.previousElementSibling;

	    if (passwordField.type === "password") {
	        passwordField.type = "text";
	        icon.src = "<%=request.getContextPath()%>/assets/user/image/eye.png";
	    } else {
	        passwordField.type = "password";
	        icon.src = "<%=request.getContextPath()%>/assets/user/image/hide.png";
	    }
	}
	
	function showLoginForm() {
	    document.getElementById('form-title').innerText = 'Đăng nhập tài khoản';
	    document.getElementById('login-form').style.display = 'block'; 
	    document.getElementById('register-form').style.display = 'none'; 
	    document.getElementById('forgot-password-form').style.display = 'none';
	    document.getElementById('verify-otp-form').style.display = 'none';
	    document.getElementById('reset-password-form').style.display = 'none';
	    document.getElementById('otp-form').style.display = 'none'; 
	    document.getElementById('password-form').style.display = 'none';
	    document.getElementById('login-button').style.display = 'inline-block';
	    document.getElementById('register-button').style.display = 'none';
	    
	    const loginButton = document.querySelector('.tabs button:first-child');
	    const registerButton = document.querySelector('.tabs button:last-child');

	    loginButton.classList.add('active');
	    registerButton.classList.remove('active');
	}

	function showRegisterForm() {
	    document.getElementById('form-title').innerText = 'Đăng ký tài khoản';
	    document.getElementById('register-form').style.display = 'block'; 
	    document.getElementById('forgot-password-form').style.display = 'none';
	    document.getElementById('verify-otp-form').style.display = 'none';
	    document.getElementById('reset-password-form').style.display = 'none';
	    document.getElementById('login-form').style.display = 'none'; 
	    document.getElementById('otp-form').style.display = 'none'; 
	    document.getElementById('password-form').style.display = 'none';
	    document.getElementById('register-button').style.display = 'inline-block';
	    document.getElementById('login-button').style.display = 'none'; 
	    
	    const loginButton = document.querySelector('.tabs button:first-child');
	    const registerButton = document.querySelector('.tabs button:last-child');
	    
	    registerButton.classList.add('active');
	    loginButton.classList.remove('active');
	}
	
	function showOTPForm() {
	    document.getElementById('register-form').style.display = 'none';
	    document.getElementById('forgot-password-form').style.display = 'none';
	    document.getElementById('verify-otp-form').style.display = 'none';
	    document.getElementById('reset-password-form').style.display = 'none';
	    document.getElementById('login-form').style.display = 'none';
	    document.getElementById('password-form').style.display = 'none';
	    document.getElementById('otp-form').style.display = 'block';
	    document.getElementById('form-title').innerText = 'Xác thực mã OTP';
	}
	
	function passwordForm() {
	    document.getElementById('register-form').style.display = 'none';
	    document.getElementById('forgot-password-form').style.display = 'none';
	    document.getElementById('verify-otp-form').style.display = 'none';
	    document.getElementById('reset-password-form').style.display = 'none';
	    document.getElementById('login-form').style.display = 'none';
	    document.getElementById('otp-form').style.display = 'none';
	    document.getElementById('password-form').style.display = 'block';
	    document.getElementById('form-title').innerText = 'Xác nhận mật khẩu';
	}
	
	function showForgotPasswordForm() {
	    document.getElementById('form-title').innerText = 'Quên mật khẩu';
	    
	    document.getElementById('login-form').style.display = 'none';
	    document.getElementById('register-form').style.display = 'none';
	    document.getElementById('otp-form').style.display = 'none';
	    document.getElementById('password-form').style.display = 'none';
	    document.getElementById('verify-otp-form').style.display = 'none';
	    document.getElementById('reset-password-form').style.display = 'none';

	    document.getElementById('forgot-password-form').style.display = 'block';

	    document.getElementById('login-button').style.display = 'none';
	    document.getElementById('register-button').style.display = 'none';

	    const loginButton = document.querySelector('.tabs button:first-child');
	    const registerButton = document.querySelector('.tabs button:last-child');

	    if (loginButton && registerButton) {
	        loginButton.classList.remove('active');
	        registerButton.classList.remove('active');
	    }
	}
	
	function resetPasswordForm() {
	    document.getElementById('register-form').style.display = 'none';
	    document.getElementById('forgot-password-form').style.display = 'none';
	    document.getElementById('verify-otp-form').style.display = 'none';
	    document.getElementById('password-form').style.display = 'none';
	    document.getElementById('login-form').style.display = 'none';
	    document.getElementById('otp-form').style.display = 'none';
	    document.getElementById('reset-password-form').style.display = 'block';
	    document.getElementById('form-title').innerText = 'Đặt lại mật khẩu';
	}

	function redirectToLogin() {
        window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
    }
	
	document.getElementById("login-form").addEventListener("submit", function(event) {
	    event.preventDefault();

	    const email = document.getElementById("email").value.trim();
	    const password = document.getElementById("password").value.trim();
	    
	    var isValid = true;

	    if (email === "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Vui lòng nhập email để đăng nhập!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    }

	    if (!email.endsWith("@gmail.com") && email !== "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Email phải có đuôi @gmail.com!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    }

	    if (password === "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Vui lòng nhập mật khẩu!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    }
	    
	    if (isValid) {
	    	fetch("http://localhost:8085/FutaBus_Backend/api/user/login", {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/json"
	            },
	            credentials: "include",
	            body: JSON.stringify({
	                email: email,
	                matKhau: password
	            })
	        })
	        .then(response => response.json())
	        .then(data => {
	            if (data.status === "success") {
	            	toast({
	    	      		title: "Thành công!",
	    	      		message: "Đăng nhập thành công.",
	    	       		type: "error",
	    	    		duration: 1000
	    	        });
	            	
	            	if (data.nguoiDung.idPhanQuyen === 2) {
	            		localStorage.setItem("nguoiDung", JSON.stringify(data.nguoiDung));
	            		setTimeout(function() {
	            			window.location.href = "http://localhost:8086/FutaBus_Frontend/admin";
	            		}, 1000);
	            	} else {
	            		localStorage.setItem("nguoiDung", JSON.stringify(data.nguoiDung));
	            		setTimeout(function() {
	            			window.location.href = "http://localhost:8086/FutaBus_Frontend";
	            		}, 1000);
	            	}
	            } else {
	            	toast({
	    	      		title: "Chú ý!",
	    	      		message: "Email hoặc mật khẩu chưa chính xác!",
	    	       		type: "error",
	    	    		duration: 1000
	    	        });
	            }
	        })
	        .catch(error => {
	            console.error("Lỗi khi gửi yêu cầu đăng nhập:", error);
	            showToast("Lỗi hệ thống, vui lòng thử lại sau!");
	        });
	    }

	});
	
	document.getElementById("register-form").addEventListener("submit", function(event) {
	    event.preventDefault();

	    const email = document.getElementById("register-email").value.trim();
	    
	    var isValid = true;

	    if (email === "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Vui lòng nhập email để đăng ký!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    }

	    if (!email.endsWith("@gmail.com") && email !== "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Email phải có đuôi @gmail.com!",
	       		type: "success",
	    		duration: 1000
	        });
	        isValid = false;
	    }

	    if (isValid) {
	    	const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/send-otp');
	    	
	    	fetch(url, {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/json"
	            },
	            credentials: "include",
	            body: JSON.stringify({ email: email })
	        })
	        .then(response => response.json())
	        .then(data => {
	            if (data.success) {
	            	showOTPForm();
	            } else {
	            	toast({
	    	      		title: "Chú ý!",
	    	      		message: "Email đã được đăng ký!",
	    	       		type: "error",
	    	    		duration: 1000
	    	        });
	            }
	        })
	        .catch(error => {
	        	toast({
    	      		title: "Chú ý!",
    	      		message: "Đã có lỗi xảy ra!",
    	       		type: "error",
    	    		duration: 1000
    	        });
	            console.error("Lỗi:", error);
	        });
	    }
	});
	
	document.getElementById("otp-form").addEventListener("submit", function (event) {
	    event.preventDefault();

	    const email = document.getElementById("register-email").value.trim();
	    const otp = document.getElementById("otp-code").value.trim();

	    if (otp === "") {
	        toast({
	            title: "Chú ý!",
	            message: "Vui lòng nhập mã OTP!",
	            type: "error",
	            duration: 1000
	        });
	        return;
	    }
	    
	    const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/verify-otp');

	    fetch(url, {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        credentials: "include",
	        body: JSON.stringify({ email: email, otp: otp })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            passwordForm();
	        } else {
	            toast({
	                title: "Lỗi!",
	                message: "OTP không đúng hoặc đã hết hạn!",
	                type: "error",
	                duration: 1000
	            });
	        }
	    })
	    .catch(error => {
	        console.error("Lỗi:", error);
	        toast({
	            title: "Lỗi!",
	            message: "Đã có lỗi khi xác thực OTP!",
	            type: "error",
	            duration: 1000
	        });
	    });
	});
	
	document.getElementById("password-form").addEventListener("submit", function (event) {
	    event.preventDefault();

	    const email = document.getElementById("register-email").value.trim();
	    const otp = document.getElementById("otp-code").value.trim();
	    const password1 = document.getElementById("password1").value.trim();
	    const password2 = document.getElementById("password2").value.trim();
	    var isValid = true;
	    let specialCharPattern = /[^A-Za-z0-9]/;
	    let whitespacePattern = /\s/;
	    
	    if (password1 === "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Không được để trống mật khẩu!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    else if (whitespacePattern.test(password1)) {
	        toast({
	            title: "Chú ý!",
	            message: "Mật khẩu không được chứa khoảng trắng!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    else if (specialCharPattern.test(password1)) {
	        toast({
	            title: "Chú ý!",
	            message: "Mật khẩu không được chứa ký tự đặc biệt!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    }
	    
	    else if (password2 === "" && password1 !== "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Vui lòng xác nhận lại mật khẩu!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    else if (password2 !== password1 && password1 !== "") {
	        toast({
	            title: "Chú ý!",
	            message: "Mật khẩu không trùng nhau!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    if (isValid) {
	        console.log("email: ", email);
	        console.log("pass: ", password1);
	        console.log("otp: ", otp);
	        const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/create-account');

		    fetch(url, {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json"
		        },
		        credentials: "include",
		        body: JSON.stringify({ email: email, otp: otp, password: password1 })
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            toast({
		                title: "Thành công!",
		                message: "Tạo tài khoản thành công!",
		                type: "success",
		                duration: 1500
		            });
		            showLoginForm();
		        } else {
		            toast({
		                title: "Lỗi!",
		                message: "OTP không đúng hoặc đã hết hạn!",
		                type: "error",
		                duration: 1000
		            });
		        }
		    })
		    .catch(error => {
		        console.error("Lỗi:", error);
		        toast({
		            title: "Lỗi!",
		            message: "Đã có lỗi khi xác thực OTP!",
		            type: "error",
		            duration: 1000
		        });
		    });
	    } 
	});
	
	document.getElementById("forgot-password-form").addEventListener("submit", function(event) {
	    event.preventDefault();

	    const email = document.getElementById("forgot-email").value.trim();
	    let isValid = true;

	    if (email === "") {
	        toast({
	            title: "Chú ý!",
	            message: "Vui lòng nhập email để đặt lại mật khẩu!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    }

	    if (!email.endsWith("@gmail.com") && email !== "") {
	        toast({
	            title: "Chú ý!",
	            message: "Email phải có đuôi @gmail.com!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    }

	    if (isValid) {
	        const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/send-verify-otp');

	        fetch(url, {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/json"
	            },
	            credentials: "include",
	            body: JSON.stringify({ email: email })
	        })
	        .then(response => response.json())
	        .then(data => {
	            if (data.success) {
	                toast({
	                    title: "Thành công!",
	                    message: "Mã OTP đã được gửi đến email.",
	                    type: "success",
	                    duration: 1500
	                });

	                document.getElementById("forgot-password-form").style.display = "none";
	                document.getElementById("verify-otp-form").style.display = "block";
	            } else {
	                toast({
	                    title: "Lỗi!",
	                    message: data.message || "Không thể gửi mã OTP!",
	                    type: "error",
	                    duration: 1500
	                });
	            }
	        })
	        .catch(error => {
	            toast({
	                title: "Lỗi hệ thống!",
	                message: "Vui lòng thử lại sau.",
	                type: "error",
	                duration: 1500
	            });
	            console.error("Lỗi gửi OTP:", error);
	        });
	    }
	});
	
	document.getElementById("verify-otp-form").addEventListener("submit", function (event) {
	    event.preventDefault();

	    const email = document.getElementById("forgot-email").value.trim(); 
	    const otp = document.getElementById("verify-otp-code").value.trim();

	    if (otp === "") {
	        toast({
	            title: "Chú ý!",
	            message: "Vui lòng nhập mã OTP!",
	            type: "error",
	            duration: 1000
	        });
	        return;
	    }

	    const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/verify-otp');

	    fetch(url, {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json"
	        },
	        credentials: "include",
	        body: JSON.stringify({ email: email, otp: otp })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	        	resetPasswordForm();
	        } else {
	            toast({
	                title: "Lỗi!",
	                message: "OTP không đúng hoặc đã hết hạn!",
	                type: "error",
	                duration: 1000
	            });
	        }
	    })
	    .catch(error => {
	        console.error("Lỗi:", error);
	        toast({
	            title: "Lỗi!",
	            message: "Đã có lỗi khi xác thực OTP!",
	            type: "error",
	            duration: 1000
	        });
	    });
	});
	
	document.getElementById("reset-password-form").addEventListener("submit", function (event) {
	    event.preventDefault();

	    const email = document.getElementById("forgot-email").value.trim();
	    const otp = document.getElementById("verify-otp-code").value.trim();
	    const password1 = document.getElementById("reset-password1").value.trim();
	    const password2 = document.getElementById("reset-password2").value.trim();
	    
	    console.log("email:", email);
	    console.log("password1:", password1);
	    console.log("password2:", password2);
	    
	    var isValid = true;
	    let specialCharPattern = /[^A-Za-z0-9]/;
	    let whitespacePattern = /\s/;
	    
	    if (password1 === "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Không được để trống mật khẩu!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    else if (whitespacePattern.test(password1)) {
	        toast({
	            title: "Chú ý!",
	            message: "Mật khẩu không được chứa khoảng trắng!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    else if (specialCharPattern.test(password1)) {
	        toast({
	            title: "Chú ý!",
	            message: "Mật khẩu không được chứa ký tự đặc biệt!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    }
	    
	    else if (password2 === "" && password1 !== "") {
	    	toast({
	      		title: "Chú ý!",
	      		message: "Vui lòng xác nhận lại mật khẩu!",
	       		type: "error",
	    		duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    else if (password2 !== password1 && password1 !== "") {
	        toast({
	            title: "Chú ý!",
	            message: "Mật khẩu không trùng nhau!",
	            type: "error",
	            duration: 1000
	        });
	        isValid = false;
	    } 
	    
	    if (isValid) {
	        console.log("email: ", email);
	        console.log("pass: ", password1);
	        console.log("otp: ", otp);
	        const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/reset-password');

		    fetch(url, {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json"
		        },
		        credentials: "include",
		        body: JSON.stringify({ email: email, otp: otp, password: password1 })
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            toast({
		                title: "Thành công!",
		                message: "Tạo tài khoản thành công!",
		                type: "success",
		                duration: 1500
		            });
		            showLoginForm();
		        } else {
		            toast({
		                title: "Lỗi!",
		                message: "OTP không đúng hoặc đã hết hạn!",
		                type: "error",
		                duration: 1000
		            });
		        }
		    })
		    .catch(error => {
		        console.error("Lỗi:", error);
		        toast({
		            title: "Lỗi!",
		            message: "Đã có lỗi khi xác thực OTP!",
		            type: "error",
		            duration: 1000
		        });
		    });
	    }
	});
	
	function toast({ title = "", message = "", type = "info", duration = 3000 }) {
		const main = document.getElementById("toast");
		if (main) {
			const toast = document.createElement("div");
			
    	    const autoRemoveId = setTimeout(function () {
    	      main.removeChild(toast);
    	    }, duration + 1000);

    	    toast.onclick = function (e) {
    	      if (e.target.closest(".toast__close")) {
    	        main.removeChild(toast);
    	        clearTimeout(autoRemoveId);
    	      }
    	    };

    	    const icons = {
    	      success: "fas fa-check-circle",
    	      info: "fas fa-info-circle",
    	      warning: "fas fa-exclamation-circle",
    	      error: "fas fa-exclamation-circle"
    	    };
    	    const icon = icons[type];
    	    const delay = (duration / 1000).toFixed(2);

    	    toast.classList.add("toast", `toast--${type}`);
    	    toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;

    	    toast.innerHTML = `
    	                    <div class="toast__icon">
    	                        <i class="${icon}"></i>
    	                    </div>
    	                    <div class="toast__body">
    	                        <h3 class="toast__title">${title}</h3>
    	                        <p class="toast__msg">${message}</p>
    	                    </div>
    	                    <div class="toast__close">
    	                        <i class="fas fa-times"></i>
    	                    </div>
    	                `;
    	    const toastIcon = toast.querySelector('.toast__icon');
			if (toastIcon) {
    			const iconElement = document.createElement('i');
    			iconElement.className = icon;
    			toastIcon.appendChild(iconElement);
			}
    	    const toastMessage = toast.querySelector('.toast__msg');
    	    toastMessage.textContent = message; 
    	    const toastTitle = toast.querySelector('.toast__title');
    	    toastTitle.textContent = title; 
    	    main.appendChild(toast);
		}
    }
	
	function signInWithGoogle() {
		var clientId = "909666408197-a3l5csqs07f4dj6sjoteueg7efedr48e.apps.googleusercontent.com";
		var redirectUri = "http://localhost:8085/FutaBus_Backend/api/user/login-google";
		var scope = "openid email profile";
		var responseType = "code";
		var accessType = "offline";
		var prompt = "consent";

		var googleLoginUrl = "https://accounts.google.com/o/oauth2/v2/auth?" +
			"client_id=" + clientId +
			"&redirect_uri=" + encodeURIComponent(redirectUri) +
			"&response_type=" + responseType +
			"&scope=" + encodeURIComponent(scope) +
			"&access_type=" + accessType +
			"&prompt=" + prompt;

		window.location.href = googleLoginUrl;
	}

	</script>

</body>
</html>