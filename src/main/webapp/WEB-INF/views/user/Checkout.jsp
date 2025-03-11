<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Thanh toán</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/checkout.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

</head>
<body>
	<div id="toast"></div>

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
				width="26" style="margin: 0 10px" alt="download app icon"> <a
				class="gap-3"> Đăng nhập/Đăng ký </a>
		</div>
	</div>

	<nav>
		<div class="flex h-10 cursor-pointer items-center px-6">Quay lại</div>
		<div class="content">
			<p>TP.Hồ Chí Minh - Đà Lạt</p>
			<p>Thứ 3, 14/01</p>
		</div>
	</nav>

	<div class="filter-container">
		<div class="payment-options">
			<div class="infor">
				<div class="payment-information">
					<p class="item">Chọn phương thức thanh toán</p>
					
					<label> <span class="ant-radio"> 
					<input
							type="radio" class="ant-radio-input" name="payment" value="18" checked>
							<span class="ant-radio-inner"></span>
					</span>
						<div>
							<img
								src="<%=request.getContextPath()%>/assets/user/image/agribank.png"
								alt="agribank"> <span>Agribank</span>
						</div>
					</label>
					
					<label> <span class="ant-radio"> <input
							type="radio" class="ant-radio-input" name="payment" value="19">
							<span class="ant-radio-inner"></span>
					</span>
						<div>
							<img
								src="<%=request.getContextPath()%>/assets/user/image/money.png"
								alt="money"> <span>Thanh toán tiền mặt</span>
						</div>
					</label>
				</div>
			</div>
		</div>

		<div class="filter-section">
			<div class="filter-header">
				<h5>Tổng thanh toán</h5>
				<div class="total-price">464.000đ</div>
				<div class="timing">Thời gian dữ chỗ còn lại 17:06</div>
			</div>
			
			<div id="agribankPayment">
			<img
				src="<%=request.getContextPath()%>/assets/user/image/checkout.png"
				alt="checkout">

			<div class="payment-instructions">
				<h2 class="text-green">Hướng dẫn thanh toán bằng Agribank</h2>
				
				<div class="instruction">
					<div class="step">
						<div class="one">1</div>
						<span>Mở ứng dụng FUTAPay trên điện thoại</span>
					</div>
					<div class="step">
						<div class="two">2</div>
						<span>Dùng biểu tượng <img class=""
							src="<%=request.getContextPath()%>/assets/user/image/icon_scan.svg"
							alt="icon_scan"> để quét mã QR
						</span>
					</div>
					<div class="step">
						<div class="three">3</div>
						<span>Quét mã ở trang này và thanh toán</span>
					</div>
				</div>
			</div>
			</div>
			
			<button type="submit" class="pay-button" id="cashPayment">Thanh toán</button>
		</div>

		<div class="result-section">
			<div class="infor">
				<div class="departure-information">
					<p class="item">Thông tin khách hàng</p>
					<div class="trip-information">
						<span class="title">Họ và tên</span><span class="road">Dũng Nguyễn</span>
					</div>
					<div class="trip-information">
						<span class="title">Số điện thoại</span><span class="phone">0327729280</span>
					</div>
					<div class="trip-information">
						<span class="title">Email</span><span class="number">dung@gmail.com</span>
					</div>
				</div>
				
				<div class="round-trip-information">
					<p class="item">Thông tin lượt đi</p>
					<div class="trip-information">
						<span class="title">Tuyến xe</span><span class="road">Mien Tay - Da Lat</span>
					</div>
					<div class="trip-information">
						<span class="title">Thời gian xuất bến</span><span class="time">09:30 12/02/2025</span>
					</div>
					<div class="trip-information">
						<span class="title">Số lượng ghế</span><span class="number">1 Ghế</span>
					</div>
					<div class="trip-information">
						<span class="title">Số ghế</span><span class="number">B16</span>
					</div>
					<div class="trip-information">
						<span class="title">Điểm lên xe</span><span class="number">BX Miền Tây</span>
					</div>
					<div class="trip-information">
						<span class="title">Thời gian tới nơi đón</span><span class="number">trước 09:15 12/02/2025</span>
					</div>
					<div class="trip-information">
						<span class="title">Điểm trả khách</span><span class="number">DA LAT</span>
					</div>
					<div class="trip-information">
						<span class="title">Tổng tiền lượt đi</span><span class="time">290.000đ</span>
					</div>
				</div>

				<div class="price-information">
					<p class="item">Chi tiết giá</p>
					<div class="price-infor">
						<span class="title">Giá vé lượt đi</span><span
							class="ticket-price">240.000đ</span>
					</div>
					<div class="price-infor">
						<span class="title">Phí thanh toán</span><span class="fee">0đ</span>
					</div>

					<div class="divide"></div>

					<div class="price-infor">
						<span class="title">Tổng tiền</span><span class="total">240.000đ</span>
					</div>
				</div>
			</div>
		</div>
	</div>

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

	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
		flatpickr("#myID", {
			dateFormat : "d/m/Y",
		});
	</script>

	<script>
	
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
    	    console.log("icon:",icon);
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
	
	document.addEventListener("DOMContentLoaded", function() {
	    let paymentRadios = document.getElementsByName("payment");
	    let cashPaymentButton = document.getElementById("cashPayment");
	    let agribankPayment = document.getElementById("agribankPayment");

	    function updateButtonVisibility() {
	        let selectedPayment = document.querySelector('input[name="payment"]:checked').value;
	        if (selectedPayment === "19") { 
	        	cashPaymentButton.style.display = "block";
	        	agribankPayment.style.display = "none";
	        } else {
	        	cashPaymentButton.style.display = "none";
	        	agribankPayment.style.display = "block";
	        }
	    }

	    paymentRadios.forEach(radio => {
	        radio.addEventListener("change", updateButtonVisibility);
	    });

	    updateButtonVisibility();
	});

	</script>

</body>
</html>