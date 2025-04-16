<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Cảm ơn</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/thankyou.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">

</head>
<body>

	<header class="header-container">
		<img
			src="<%=request.getContextPath()%>/assets/user/image/home_banner.png"
			alt="FUTA Bus Lines" class="banner-image">
	</header>

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
				width="26" style="margin: 0 10px" alt="download app icon"> <a href="javascript:void(0)"
				class="gap-3 cursor-pointer" id="userGreeting" onclick="redirectToLogin()"> Đăng nhập/Đăng ký </a>
		</div>
		
		<div class="user-modal" id="userModal">
			<div class="user-modal__content">
				<div class="user-modal__item">
					<a href="http://localhost:8086/FutaBus_Frontend/general-information">
        				<img src="<%=request.getContextPath()%>/assets/user/image/infor_user.svg" alt="profile" /> Thông tin tài khoản
    				</a>
				</div>
				<div class="user-modal__item">
    				<a href="http://localhost:8086/FutaBus_Frontend/purchase-history">
        				<img src="<%=request.getContextPath()%>/assets/user/image/history.svg" alt="profile" /> Lịch sử mua vé
    				</a>
				</div>
				<div class="user-modal__item">
    				<a href="http://localhost:8086/FutaBus_Frontend/reset-password">
        				<img src="<%=request.getContextPath()%>/assets/user/image/change_password.svg" alt="profile" /> Đặt lại mật khẩu
    				</a>
				</div>
				<hr>
				<div class="user-modal__item logout" id="logoutBtn">
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/log-out.png"
						alt="log-out" class="log-out" /> Đăng xuất
				</div>
			</div>
		</div>
	</div>

	<nav>
		<ul>
			<li><a href="#" class="border-choice">TRANG CHỦ</a></li>
			<li><a href="#">LỊCH TRÌNH</a></li>
			<li><a href="#">TRA CỨU VÉ</a></li>
			<li><a href="#">TIN TỨC</a></li>
			<li><a href="#">HOÁ ĐƠN</a></li>
			<li><a href="#">LIÊN HỆ</a></li>
			<li><a href="#">VỀ CHÚNG TÔI</a></li>
		</ul>
	</nav>

	<section class="search-section">
		<img src="<%=request.getContextPath()%>/assets/user/image/success.png"
			alt="success" class="success-image">

		<h2>Đơn đặt hàng thành công</h2>

		<table class="ticket-table">
			<thead>
				<tr>
					<th>Thời gian</th>
					<th>Chuyến xe</th>
					<th>Số lượng ghế</th>
					<th>Thành tiền</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${departureDate}</td>
					<td>${start} - ${end}</td>
					<td>${selectedSeatsCount}</td>
					<td><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/>đ</td>
				</tr>
				<tr id="returnRow" style="display: none">
					<td>${departureDateReturn}</td>
					<td>${end} - ${start}</td>
					<td>${selectedSeatsCountReturn}</td>
					<td><fmt:formatNumber value="${totalPriceReturn}" type="number" groupingUsed="true"/>đ</td>
				</tr>
			</tbody>
		</table>

		<span>Cảm ơn bạn đã tin tưởng sử dụng dịch vụ chúng tôi</span> <span>Mọi
			thắc mắc xin vui lòng liên hệ số điện thoại sau: 090-080-070</span>

		<form class="booking-form">
			<button type="submit" class="back-button" id="backHomeBtn">QUAY LẠI TRANG CHỦ</button>
			<button type="submit" class="search-button">ĐƠN HÀNG CỦA TÔI</button>
		</form>
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
	
	function redirectToLogin() {
		const nguoiDungStr = localStorage.getItem("nguoiDung");
        if (nguoiDungStr) {
        	toggleModal();
        } else {
        	window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
        }
    }
	
	const nguoiDungStr = localStorage.getItem("nguoiDung");
    if (nguoiDungStr) {
        const nguoiDung = JSON.parse(nguoiDungStr);
        console.log("Thông tin người dùng:", nguoiDung);
        
        const greetingLink = document.getElementById("userGreeting");
        if (greetingLink) {
            greetingLink.innerText = "Chào " + nguoiDung.hoTen;

            //greetingLink.onclick = function () {
                // Ví dụ mở menu người dùng hoặc chuyển trang tài khoản
                //window.location.href = "/FutaBus_Frontend/thong-tin-ca-nhan";
            //};
        }
    } else {
        console.log("Không tìm thấy người dùng trong localStorage");
    }
	
	const returnDate = "${returnDate}";
	if (returnDate && returnDate.trim() !== "") {
	    document.querySelector('#returnRow')?.style.removeProperty('display');
	}
		document
				.getElementById("backHomeBtn")
				.addEventListener(
						"click",
						function(event) {
							event.preventDefault();
							window.location.href = "http://localhost:8086/FutaBus_Frontend/";
						});
	
	function toggleModal() {
		var modal = document.getElementById("userModal");
		modal.classList.toggle("show");
	}
		
	</script>

</body>
</html>