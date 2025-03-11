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

</head>
<body>
	<header>
	<div class="hero-container">
		<div class="items-start">
			<div>
				<img
					src="<%=request.getContextPath()%>/assets/user/image/vietnam.svg"
					width="26" alt="language icon"> <span class="mx-2 text-white">vi</span>
				<img
					src="<%=request.getContextPath()%>/assets/user/image/icon_form_droplist.svg"
					alt="icon_form_droplist">
			</div>
			<div>
				<img
					src="<%=request.getContextPath()%>/assets/user/image/download_app.svg"
					width="26" alt="download app icon"> <span
					class="mx-2 text-white">Tải ứng dụng</span> <img
					src="<%=request.getContextPath()%>/assets/user/image/icon_form_droplist.svg"
					alt="icon_form_droplist">
			</div>
		</div>

		<img
			src="<%=request.getContextPath()%>/assets/user/image/home_logo.svg"
			alt="FUTA Bus Lines" class="hero-image">

		<div class="justify-end">
			<img src="<%=request.getContextPath()%>/assets/user/image/person.svg"
				width="26" style="margin: 0 10px" alt="download app icon"> <a
				class="gap-3"> Đăng nhập/Đăng ký </a>
		</div>
	</div>
	</header>
	
	<div class="container">
        <div class="left">
        	<img src="<%=request.getContextPath()%>/assets/user/image/logoText.svg" alt="Logo">
            <img src="<%=request.getContextPath()%>/assets/user/image/TVC.svg" alt="Xe trung chuyển">
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
                <img src="<%=request.getContextPath()%>/assets/user/image/phone.svg" alt="Phone Icon" class="phone-icon">
                <input type="text" placeholder="Nhập số điện thoại">
            </div>
            <div class="input-group">
                <img src="<%=request.getContextPath()%>/assets/user/image/password.svg" alt="password" class="password-icon">
                <input type="password" placeholder="Nhập mật khẩu" id="password">
                <img src="<%=request.getContextPath()%>/assets/user/image/hide.png" alt="eye" class="eye-icon" onclick="togglePassword()">
            </div>
            <button type="submit" class="btn" id="login-button">Đăng nhập</button>
            <a href="#" class="forgot-password">Quên mật khẩu</a>
        </form>

        <form id="register-form" style="display: none;">
            <div class="input-group">
                <img src="<%=request.getContextPath()%>/assets/user/image/phone.svg" alt="Phone Icon" class="phone-icon">
                <input type="text" placeholder="Nhập số điện thoại">
            </div>
            <div class="input-group">
                <img src="<%=request.getContextPath()%>/assets/user/image/password.svg" alt="password" class="password-icon">
                <input type="password" placeholder="Nhập mật khẩu">
                <img src="<%=request.getContextPath()%>/assets/user/image/hide.png" alt="eye" class="eye-icon" onclick="togglePassword()">
            </div>
            <button type="submit" class="btn" id="register-button">Đăng ký</button>
            <a href="#" class="forgot-password">Quên mật khẩu</a>
        </form>
            </div>
        </div>
    </div>
    
    <section class="promotions">
		<h3>Kết nối FUTA Group</h3>
		<span>Đa dạng hệ sinh thái FUTA Group qua App FUTA: mua vé xe Phương Trang, Xe Hợp Đồng, Xe Buýt, Giao hàng...</span>
		<img
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
	function togglePassword() {
	    var passwordField = document.getElementById("password");
	    var eyeIcon = document.querySelector(".eye-icon");

	    if (passwordField.type === "password") {
	        passwordField.type = "text"; 
	        eyeIcon.src = "<%=request.getContextPath()%>/assets/user/image/eye.png"; 
	    } else {
	        passwordField.type = "password"; 
	        eyeIcon.src = "<%=request.getContextPath()%>/assets/user/image/hide.png"; 
	    }
	}
	
	function showLoginForm() {
	    document.getElementById('form-title').innerText = 'Đăng nhập tài khoản';
	    document.getElementById('login-form').style.display = 'block'; 
	    document.getElementById('register-form').style.display = 'none'; 
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
	    document.getElementById('login-form').style.display = 'none'; 
	    document.getElementById('register-button').style.display = 'inline-block';
	    document.getElementById('login-button').style.display = 'none'; 
	    
	    const loginButton = document.querySelector('.tabs button:first-child');
	    const registerButton = document.querySelector('.tabs button:last-child');
	    
	    registerButton.classList.add('active');
	    loginButton.classList.remove('active');
	}
	</script>

</body>
</html>