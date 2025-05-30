<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Đặt vé</title>
<%@ include file="../chatbox/chatbox.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/tripselection.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
	<div id="confirmLogoutModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="modal-title">Xác nhận</h2>
				<span class="close" id="modalClose">&times;</span>
			</div>
			<div class="modal-body">
				<p class="title-question">Bạn có muốn xác nhận đăng xuất không?</p>
			</div>
			<div class="modal-footer">
				<button id="confirmYes" class="btn btn-yes">Có</button>
				<button id="confirmNo" class="btn btn-no">Không</button>
			</div>
		</div>
	</div>
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
			<li><a href="http://localhost:8086/FutaBus_Frontend" class="border-choice">TRANG CHỦ</a></li>
			<li><a href="#">LỊCH TRÌNH</a></li>
			<li><a href="#">TRA CỨU VÉ</a></li>
			<li><a href="#">TIN TỨC</a></li>
			<li><a href="#">HOÁ ĐƠN</a></li>
			<li><a href="#">LIÊN HỆ</a></li>
			<li><a href="#">VỀ CHÚNG TÔI</a></li>
		</ul>
	</nav>

	<img
		src="<%=request.getContextPath()%>/assets/user/image/home_background.png"
		alt="FUTA Bus Lines" class="centered-image">

	<section class="search-section">
		<h2>Tìm chuyến xe</h2>

		<div class="booking-options">
			<div class="trip-options">
				<label class="option"> <span> <input type="radio"
						class="ant-radio-input" name="trip-type" checked value="false"
						id="one-way" disabled> <span class="ant-radio-inner"></span>
				</span> <span>Một chiều</span>
				</label> <label class="option"> <span> <input type="radio"
						class="ant-radio-input" name="trip-type" value="true"
						id="round-trip" disabled> <span class="ant-radio-inner"></span>
				</span> <span>Khứ hồi</span>
				</label>
			</div>
			<span class="guide-link"> <a target="_blank" rel="noreferrer"
				href="/huong-dan-dat-ve-tren-web">Hướng dẫn mua vé</a>
			</span>
		</div>

		<form class="booking-form">
			<div class="form-group">
				<label for="departure">Điểm đi</label> <input id="departure"
					name="departure" class="form-control" placeholder="Chọn điểm đi"
					autocomplete="off" value="${departure}" disabled>
				<ul id="dropdown-list-departure" class="dropdown-list">
				</ul>
			</div>

			<div class="form-group">
				<label for="destination">Điểm đến</label> <input id="destination"
					name="destination" class="form-control" placeholder="Chọn điểm đến"
					autocomplete="off" value="${destination}" disabled>
				<ul id="dropdown-list-destination" class="dropdown-list">
				</ul>
			</div>

			<div class="form-group">
				<label for="my_go">Ngày đi</label> <input id="my_go" type="text"
					name="departure-date" class="form-control" value="${departureDate}" disabled>
			</div>

			<div class="form-group hidden" id="return-date-group">
				<label for="my_back">Ngày về</label> <input id="my_back" type="text"
					name="return-date" class="form-control" value="${returnDate}"
					readonly disabled>
			</div>

			<div class="form-group">
				<label for="tickets">Số vé</label> <input id="tickets"
					name="tickets" class="form-control" placeholder="1"
					autocomplete="off" value="${tickets}" readonly disabled>
				<ul id="dropdown-list-tickets" class="dropdown-list">
					<li data-value="1">1</li>
					<li data-value="2">2</li>
					<li data-value="3">3</li>
					<li data-value="4">4</li>
					<li data-value="5">5</li>
				</ul>
				<span class="dropdown-icon">&#9662;</span>
			</div>

			<button type="submit" class="search-button" disabled>Tìm chuyến xe</button>
		</form>
	</section>

	<div class="filter-container">
		<div class="filter-section">
			<div class="booking-card" style="display: none;">
				<div class="booking-title">CHUYẾN ĐI CỦA BẠN</div>

				<div class="booking-info">
					<div class="booking-date-section">
						<div class="booking-index">1</div>
						<div class="booking-date-content">
							<div class="booking-date">Thứ 5, 10/04/2025</div>
							<div class="booking-route">Da Lat - Mien Dong moi</div>
						</div>
					</div>

					<div class="booking-time-section">
						<div class="booking-time-point">
							<div class="booking-time">14:35</div>
							<div class="booking-location">Bến Xe Đà Lạt</div>
						</div>

						<div class="booking-duration">
							<span class="booking-dot-line"></span> <span
								class="booking-duration-text">8 giờ</span> <span
								class="booking-dot-line"></span>
						</div>

						<div class="booking-time-point">
							<div class="booking-time">22:35</div>
							<div class="booking-location">BX Miền Đông Mới</div>
						</div>
					</div>
				</div>
			</div>

			<div class="filter-content">
				<div class="filter-header">
					<h5>BỘ LỌC TÌM KIẾM</h5>
					<div class="filter-actions">
						<button class="reset-filter">Bỏ lọc</button>
						<img
							src="<%=request.getContextPath()%>/assets/user/image/delete.svg"
							width="22" height="22" alt="delete">
					</div>
				</div>

				<div class="filter-group">
					<label>Giờ đi</label>
					<div class="filter-options">
						<label><input type="checkbox"> Sáng sớm 00:00 -
							06:00 (0)</label> <label><input type="checkbox"> Buổi
							sáng 06:00 - 12:00 (0)</label> <label><input type="checkbox">
							Buổi chiều 12:00 - 18:00 (0)</label> <label><input
							type="checkbox"> Buổi tối 18:00 - 24:00 (31)</label>
					</div>
				</div>
				<div class="divide"></div>
				<div class="filter-group">
					<label>Loại xe</label>
					<div class="filter-options">
						<button class="btn-filter">Ghế</button>
						<button class="btn-filter">Giường</button>
						<button class="btn-filter">Limousine</button>
					</div>
				</div>
				<div class="divide"></div>
				<div class="filter-group">
					<label>Hàng ghế</label>
					<div class="filter-options">
						<button class="btn-filter">Hàng đầu</button>
						<button class="btn-filter">Hàng giữa</button>
						<button class="btn-filter">Hàng cuối</button>
					</div>
				</div>
				<div class="divide"></div>
				<div class="filter-group">
					<label>Tầng</label>
					<div class="filter-options">
						<button class="btn-filter">Tầng trên</button>
						<button class="btn-filter">Tầng dưới</button>
					</div>
				</div>
			</div>
		</div>

		<div class="result-section">
			<div class="search-location-section">
				<h3 id="trip-direction-header">${departure} - ${destination} (${numberOfTrips})</h3>
				<div class="result-filters">
					<button class="btn-result-filter">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/save_money.svg"
							alt="save_money">Giá rẻ bất ngờ
					</button>
					<button class="btn-result-filter">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/clock.svg"
							alt="clock">Giờ khởi hành
					</button>
					<button class="btn-result-filter">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/seat.svg"
							alt="seat">Ghế trống
					</button>
				</div>
			</div>

			<div class="tab-container" id="tab-container">
				<div class="tab active" data-target="trip-list">CHUYẾN ĐI - ${formattedDepartureDateWithDay}</div>
				<div class="tab" data-target="trip-list2">CHUYẾN VỀ - ${formattedReturnDateWithDay}</div>
			</div>
			
			<div class="trip-list active" id="trip-list">
				<c:forEach var="chuyen" items="${chuyenXeResultList}">
					<div class="trip-item">
						<div class="trip-details">
							<div class="trip-info">
								<div class="time-info">
									<p class="duration">${chuyen.thoiDiemDiFormatted}</p>
									<img
										src="<%=request.getContextPath()%>/assets/user/image/pickup.svg"
										width="22" height="22" alt="pickup"> <span
										class="flex-1 border-b-2 border-dotted"></span>
									<p>
										<fmt:formatNumber var="formattedTime"
											value="${chuyen.thoiGianDiChuyenTB}" type="number"
											maxFractionDigits="1" minFractionDigits="0" />
										<span class="time">${formattedTime} giờ</span> <span
											class="timezone">(Asian/Ho Chi Minh)</span>
									</p>
									<span class="flex-1 border-b-2 border-dotted"></span> <img
										src="<%=request.getContextPath()%>/assets/user/image/station.svg"
										width="22" height="22" alt="station">
									<p class="duration">${chuyen.thoiDiemDenFormatted}</p>
								</div>

								<div class="location-info">
									<p>${chuyen.tenBenXeDi}</p>
									<p>${chuyen.tenBenXeDen}</p>
								</div>
							</div>

							<div class="trip-summary">
								<span class="kind">${chuyen.tenLoai}</span> <span class="blank">${chuyen.soGheTrong}
									chỗ trống</span>
								<fmt:formatNumber var="formattedGiaHienHanh"
									value="${chuyen.giaHienHanh}" type="number" pattern="#,###" />
								<span class="price">${formattedGiaHienHanh} VND</span>
							</div>
						</div>

						<div class="divide"></div>

						<div class="trip-action">
							<span>Chọn ghế</span> <span>Lịch trình</span> <span>Trung
								chuyển</span> <span>Chính sách</span>
							<button class="btn-select trip-go" 
								data-formatted-departure-date-with-day="${formattedDepartureDateWithDay}"
								data-formatted-time="${formattedTime}"
								data-departureId="${departureId}"
								data-start="${chuyen.tenBenXeDi}"
								data-departure="${departure}"
								data-destinationId="${destinationId}"
								data-end="${chuyen.tenBenXeDen}"
								data-destination="${destination}"
								data-departureDate="${departureDate}"
								data-returnDate="${returnDate}"
								data-id-trip="${chuyen.tripId}"
								data-start-time="${chuyen.thoiDiemDi}"
								data-end-time="${chuyen.thoiDiemDen}"
								data-loai="${chuyen.tenLoai}"
								data-price="${chuyen.giaHienHanh}"
								data-so-ghe="${chuyen.soGheTrong}"
								data-id-xe="${chuyen.idXe}">Chọn chuyến</button>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="trip-list2" id="trip-list2">
				<c:forEach var="chuyenxe" items="${chuyenXeReturnList}">
					<div class="trip-item">
						<div class="trip-details">
							<div class="trip-info">
								<div class="time-info">
									<p class="duration">${chuyenxe.thoiDiemDiReturnFormatted}</p>
									<img
										src="<%=request.getContextPath()%>/assets/user/image/pickup.svg"
										width="22" height="22" alt="pickup"> <span
										class="flex-1 border-b-2 border-dotted"></span>
									<p>
										<fmt:formatNumber var="formattedTime"
											value="${chuyenxe.thoiGianDiChuyenTB}" type="number"
											maxFractionDigits="1" minFractionDigits="0" />
										<span class="time">${formattedTime} giờ</span> <span
											class="timezone">(Asian/Ho Chi Minh)</span>
									</p>
									<span class="flex-1 border-b-2 border-dotted"></span> <img
										src="<%=request.getContextPath()%>/assets/user/image/station.svg"
										width="22" height="22" alt="station">
									<p class="duration">${chuyenxe.thoiDiemDenReturnFormatted}</p>
								</div>

								<div class="location-info">
									<p>${chuyenxe.tenBenXeDi}</p>
									<p>${chuyenxe.tenBenXeDen}</p>
								</div>
							</div>

							<div class="trip-summary">
								<span class="kind">${chuyenxe.tenLoai}</span> <span class="blank">${chuyenxe.soGheTrong}
									chỗ trống</span>
								<fmt:formatNumber var="formattedGiaHienHanh"
									value="${chuyenxe.giaHienHanh}" type="number" pattern="#,###" />
								<span class="price">${formattedGiaHienHanh} VND</span>
							</div>
						</div>

						<div class="divide"></div>

						<div class="trip-action">
							<span>Chọn ghế</span> <span>Lịch trình</span> <span>Trung
								chuyển</span> <span>Chính sách</span>
							<button class="btn-select trip-return" 
								data-formatted-return-date-with-day="${formattedReturnDateWithDay}"
								data-formatted-time="${formattedTime}"
								data-departureId="${destinationId}"
								data-start="${chuyenxe.tenBenXeDi}"
								data-departure="${destination}"
								data-destinationId="${departureId}"
								data-end="${chuyenxe.tenBenXeDen}"
								data-destination="${departure}"
								data-departureDate="${departureDate}"
								data-returnDate="${returnDate}"
								data-id-trip="${chuyenxe.tripId}"
								data-start-time="${chuyenxe.thoiDiemDi}"
								data-end-time="${chuyenxe.thoiDiemDen}"
								data-loai="${chuyenxe.tenLoai}"
								data-price="${chuyenxe.giaHienHanh}"
								data-so-ghe="${chuyenxe.soGheTrong}"
								data-id-xe="${chuyenxe.idXe}">Chọn chuyến</button>
						</div>
					</div>
				</c:forEach>
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
	flatpickr("#myID_go", {
		dateFormat: "d/m/Y",
		minDate: "today",
		onChange: function(selectedDates, dateStr, instance) {
	        let returnDatePicker = document.getElementById("myID_back")._flatpickr;
	        returnDatePicker.set("minDate", dateStr); 
	    }
	});
	flatpickr("#myID_back", {
		dateFormat: "d/m/Y",
		minDate: "today"
	});
    </script>

	<script>
    
    document.addEventListener("DOMContentLoaded", function () {
        const departureInput = document.getElementById("departure");
        const destinationInput = document.getElementById("destination");
        const dropdownDeparture = document.getElementById("dropdown-list-departure");
        const dropdownDestination = document.getElementById("dropdown-list-destination");
        const tabContainer = document.getElementById("tab-container");
        const buttons = document.querySelectorAll(".btn-select");
        let selectedDepartureTrip = null;
        let selectedReturnTrip = null;
        const isRoundTrip = true;

        buttons.forEach(btn => {
            btn.addEventListener("click", function () {
            	const returnDate = this.dataset.returndate;
            	const bookingCard = document.querySelector('.booking-card');

            	if (!returnDate || returnDate.trim() === ""){
            		const departureId = this.dataset.departureid;
                    const departure = this.dataset.departure;
                    const destinationId = this.dataset.destinationid;
                    const destination = this.dataset.destination;
                    const start = this.dataset.start;
                    const end = this.dataset.end;
                    const departureDate = this.dataset.departuredate;
                    const returnDate = this.dataset.returndate;
                    const idTrip = this.dataset.idTrip;
                    const startTime = this.dataset.startTime;
                    const endTime = this.dataset.endTime;
                    const loai = this.dataset.loai;
                    const price = this.dataset.price;
                    const soGhe = this.dataset.soGhe;
                    const idXe = this.dataset.idXe;

                    const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/book-tickets');
                    
                    url.searchParams.append("departureId", this.dataset.departureid);
                    url.searchParams.append("departure", this.dataset.departure);
                    url.searchParams.append("destinationId", this.dataset.destinationid);
                    url.searchParams.append("destination", this.dataset.destination);
                    url.searchParams.append("start", this.dataset.start);
                    url.searchParams.append("end", this.dataset.end);
                    url.searchParams.append("departureDate", this.dataset.departuredate);
                    url.searchParams.append("returnDate", this.dataset.returndate);
                    url.searchParams.append("idTrip", this.dataset.idTrip);
                    url.searchParams.append("startTime", this.dataset.startTime);
                    url.searchParams.append("endTime", this.dataset.endTime);
                    url.searchParams.append("loai", this.dataset.loai);
                    url.searchParams.append("price", this.dataset.price);
                    url.searchParams.append("soGhe", this.dataset.soGhe);
                    url.searchParams.append("idXe", this.dataset.idXe);

                    fetch(url, {
                        method: 'GET',  
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log("Dữ liệu đã nhận thành công!", data);
                        const isRoundTrip = false;
                        if (data.status === "success") { 
                        	let redirectURL = '/FutaBus_Frontend/book-tickets?' +
                            'departureId=' + departureId +
                            '&departure=' + departure +
                            '&destinationId=' + destinationId +
                            '&destination=' + destination +
                            '&start=' + start +
                            '&end=' + end +
                            '&departureDate=' + departureDate +
                            (isRoundTrip ? 
                            		'&returnDate=' + returnDate +
                            		'&idTripReturn=' + idTripReturn + 
                                    '&startTimeReturn=' + startTimeReturn + 
                                    '&endTimeReturn=' + endTimeReturn + 
                                    '&priceReturn=' + priceReturn + 
                                    '&soGheReturn=' + soGheReturn + 
                                    '&idXeReturn=' + idXeReturn : '') +
                            '&idTrip=' + idTrip +
                            '&startTime=' + startTime +
                            '&endTime=' + endTime +
                            '&loai=' + loai +
                            '&price=' + price +
                            '&soGhe=' + soGhe +
                            '&idXe=' + idXe;

          					window.location.href = redirectURL;
                        } else {
                            console.error("❌ Lỗi phản hồi từ API:", data);
                        }
                    })
                    .catch(error => {
                        console.error("❌ Lỗi khi lấy dữ liệu:", error.message);
                        console.error("🔍 Chi tiết lỗi:", error);
                    });
            	} else {
            		bookingCard.style.display = 'block';
            		const tripType = this.closest(".trip-list") ? "go" : "return";

                    if (tripType === "go") {
                    	selectedDepartureTrip = {
                    		    departureId: this.dataset.departureid,
                    		    departure: this.dataset.departure,
                    		    destinationId: this.dataset.destinationid,
                    		    destination: this.dataset.destination,
                    		    start: this.dataset.start,
                    		    end: this.dataset.end,
                    		    departureDate: this.dataset.departuredate,
                    		    returnDate: this.dataset.returndate,
                    		    idTrip: this.dataset.idTrip,
                    		    startTime: this.dataset.startTime,
                    		    endTime: this.dataset.endTime,
                    		    loai: this.dataset.loai,
                    		    price: this.dataset.price,
                    		    soGhe: this.dataset.soGhe,
                    		    idXe: this.dataset.idXe
                    		};
                        let startTime = this.dataset.startTime.split(' ')[1].slice(0, 5); 
                        let endTime = this.dataset.endTime.split(' ')[1].slice(0, 5);  
                        
                        bookingCard.querySelector('.booking-date').textContent = this.dataset.formattedDepartureDateWithDay;
                        bookingCard.querySelector('.booking-duration-text').textContent = this.dataset.formattedTime + ' giờ';
                        bookingCard.querySelector('.booking-title').textContent = 'CHUYẾN ĐI CỦA BẠN';
                        bookingCard.querySelector('.booking-route').textContent = this.dataset.departure;
                        bookingCard.querySelectorAll('.booking-time')[0].textContent = startTime;
                        bookingCard.querySelectorAll('.booking-time')[1].textContent = endTime;
                        bookingCard.querySelectorAll('.booking-location')[0].textContent = this.dataset.start;
                        bookingCard.querySelectorAll('.booking-location')[1].textContent = this.dataset.end;
                    } else {
                    	selectedReturnTrip = {
                    		    departureId: this.dataset.departureid,
                    		    departure: this.dataset.departure,
                    		    destinationId: this.dataset.destinationid,
                    		    destination: this.dataset.destination,
                    		    start: this.dataset.start,
                    		    end: this.dataset.end,
                    		    departureDate: this.dataset.departuredate,
                    		    returnDate: this.dataset.returndate,
                    		    idTrip: this.dataset.idTrip,
                    		    startTime: this.dataset.startTime,
                    		    endTime: this.dataset.endTime,
                    		    loai: this.dataset.loai,
                    		    price: this.dataset.price,
                    		    soGhe: this.dataset.soGhe,
                    		    idXe: this.dataset.idXe
                    		};
                        let startTime = this.dataset.startTime.split(' ')[1].slice(0, 5); 
                        let endTime = this.dataset.endTime.split(' ')[1].slice(0, 5); 
                        
                        bookingCard.querySelector('.booking-date').textContent = this.dataset.formattedReturnDateWithDay;
                        bookingCard.querySelector('.booking-duration-text').textContent = this.dataset.formattedTime + ' giờ';
                        bookingCard.querySelector('.booking-title').textContent = 'CHUYẾN VỀ CỦA BẠN';
                        bookingCard.querySelector('.booking-route').textContent = this.dataset.departure;
                        bookingCard.querySelectorAll('.booking-time')[0].textContent = startTime;
                        bookingCard.querySelectorAll('.booking-time')[1].textContent = endTime;
                        bookingCard.querySelectorAll('.booking-location')[0].textContent = this.dataset.start;
                        bookingCard.querySelectorAll('.booking-location')[1].textContent = this.dataset.end;
                    }

                    if (selectedDepartureTrip && selectedReturnTrip) {
                    	let loai = this.dataset.loai;
                    	
                    	const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/book-tickets'); 
                    	url.searchParams.set('departureId', selectedDepartureTrip.departureId);
                    	url.searchParams.set('departure', selectedDepartureTrip.departure);
                    	url.searchParams.set('destinationId', selectedDepartureTrip.destinationId);
                    	url.searchParams.set('destination', selectedDepartureTrip.destination);
                    	url.searchParams.append("start", this.dataset.start);
                        url.searchParams.append("end", this.dataset.end);
                    	url.searchParams.set('departureDate', selectedDepartureTrip.departureDate);
                    	url.searchParams.set('returnDate', selectedReturnTrip.returnDate);
                    	url.searchParams.set('idTrip', selectedDepartureTrip.idTrip);
                    	url.searchParams.set('startTime', selectedDepartureTrip.startTime);
                    	url.searchParams.set('endTime', selectedDepartureTrip.endTime);
                    	url.searchParams.set('loai', loai);
                    	url.searchParams.set('idTripReturn', selectedReturnTrip.idTrip);
                    	url.searchParams.set('startTimeReturn', selectedReturnTrip.startTime);
                    	url.searchParams.set('endTimeReturn', selectedReturnTrip.endTime);
                    	url.searchParams.set('price', selectedDepartureTrip.price);
                    	url.searchParams.set('priceReturn', selectedReturnTrip.price);
                    	url.searchParams.set('soGhe', selectedDepartureTrip.soGhe);
                    	url.searchParams.set('soGheReturn', selectedReturnTrip.soGhe);
                    	url.searchParams.set('idXe', selectedDepartureTrip.idXe);
                    	url.searchParams.set('idXeReturn', selectedReturnTrip.idXe);

                        const tripData = {
                            departureTrip: selectedDepartureTrip,
                            returnTrip: selectedReturnTrip
                        };

                        fetch(url, {
                            method: 'GET',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.status === "success") {
                                console.log("Đã lưu thành công cả 2 chuyến:", data);
                                const loai = this.dataset.loai;

                                const redirectURL = '/FutaBus_Frontend/book-tickets?' +
                                'departureId=' + selectedDepartureTrip.departureId +
                                '&departure=' + selectedDepartureTrip.departure +
                                '&destinationId=' + selectedDepartureTrip.destinationId +
                                '&destination=' + selectedDepartureTrip.destination +
                                '&start=' + selectedDepartureTrip.start +
                                '&end=' + selectedDepartureTrip.end +
                                '&departureDate=' + selectedDepartureTrip.departureDate +
                                '&returnDate=' + selectedReturnTrip.returnDate +
                                '&idTrip=' + selectedDepartureTrip.idTrip +
                                '&startTime=' + selectedDepartureTrip.startTime +
                                '&endTime=' + selectedDepartureTrip.endTime +
                                '&loai=' + loai +
                                '&idTripReturn=' + selectedReturnTrip.idTrip +
                                '&startTimeReturn=' + selectedReturnTrip.startTime +
                                '&endTimeReturn=' + selectedReturnTrip.endTime +
                                '&price=' + selectedDepartureTrip.price +
                                '&priceReturn=' + selectedReturnTrip.price +
                                '&soGhe=' + selectedDepartureTrip.soGhe +
                                '&soGheReturn=' + selectedReturnTrip.soGhe +
                                '&idXe=' + selectedDepartureTrip.idXe +
                                '&idXeReturn=' + selectedReturnTrip.idXe;

                                window.location.href = redirectURL;
                            } else {
                                console.error("❌ API trả về lỗi:", data.message || data);
                            }
                        })
                        .catch(error => {
                            console.error("❌ Lỗi khi gọi API:", error);
                        });
                    }
            	}
            });
        });

        const cities = [];

        <c:forEach var="tinhThanh" items="${tinhThanhList}">
            cities.push("${tinhThanh.tenTinh}");
        </c:forEach>

        const showDropdown = (input, dropdown, filter = "") => {
            dropdown.innerHTML = ""; 
            const filteredCities = cities.filter(city => city.toLowerCase().includes(filter.toLowerCase()));

            if (filteredCities.length > 0) {
                filteredCities.forEach(city => {
                    const li = document.createElement("li");
                    li.textContent = city;
                    li.addEventListener("click", () => {
                        input.value = city; 
                        dropdown.style.display = "none"; 
                    });
                    dropdown.appendChild(li);
                });
                dropdown.style.display = "block";
            } else {
                dropdown.style.display = "none";
            }
        };

        departureInput.addEventListener("focus", () => {
            showDropdown(departureInput, dropdownDeparture);
        });

        destinationInput.addEventListener("focus", () => {
            showDropdown(destinationInput, dropdownDestination);
        });

        departureInput.addEventListener("input", () => {
            const query = departureInput.value;
            showDropdown(departureInput, dropdownDeparture, query);
        });

        destinationInput.addEventListener("input", () => {
            const query = destinationInput.value;
            showDropdown(destinationInput, dropdownDestination, query);
        });

        document.addEventListener("click", (event) => {
            if (!departureInput.contains(event.target) && !dropdownDeparture.contains(event.target)) {
                dropdownDeparture.style.display = "none";
            }
            if (!destinationInput.contains(event.target) && !dropdownDestination.contains(event.target)) {
                dropdownDestination.style.display = "none";
            }
        });
        
        const input = document.getElementById("tickets");
        const dropdown = document.getElementById("dropdown-list-tickets");

        input.addEventListener("click", function () {
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        });

        dropdown.addEventListener("click", function (e) {
            if (e.target.tagName === "LI") {
                input.value = e.target.getAttribute("data-value");
                dropdown.style.display = "none";
            }
        });

        document.addEventListener("click", function (e) {
            if (!dropdown.contains(e.target) && e.target !== input) {
                dropdown.style.display = "none";
            }
        });
        
        let today = new Date().toISOString().split('T')[0];
        let parts = today.split('-'); 

        let year = parts[0]; 
        let month = parts[1]; 
        let day = parts[2];  
        
        let formattedDate = day + '/' + month + '/' + year;
        
        const oneWayRadio = document.getElementById("one-way");
        const roundTripRadio = document.getElementById("round-trip");
        const returnDateGroup = document.getElementById("return-date-group");
        var departureDate = document.getElementById("myID_go");
        const returnDateInput = document.getElementById("my_back");
        const returnDateValue = returnDateInput.value.trim();
        
        if (returnDateValue) {
            roundTripRadio.checked = true;
            returnDateGroup.classList.remove("hidden");
            returnDateInput.disabled = false;
            tabContainer.style.display = "flex";
        } else {
            oneWayRadio.checked = true;
            returnDateGroup.classList.add("hidden");
            returnDateInput.disabled = true;
            tabContainer.style.display = "none";
        }

        oneWayRadio.addEventListener("change", function() {
            returnDateGroup.classList.add("hidden");
            returnDateInput.disabled = true;
        });

        roundTripRadio.addEventListener("change", function() {
            returnDateGroup.classList.remove("hidden");
            returnDateInput.disabled = false; 
        });
        
        const tabs = document.querySelectorAll('.tab');
        const tripHeader = document.getElementById("trip-direction-header");
  		const lists = {
    		"trip-list": document.getElementById('trip-list'),
    		"trip-list2": document.getElementById('trip-list2')
  		};

  		tabs.forEach(tab => {
  		    tab.addEventListener("click", function () {
  		        tabs.forEach(t => t.classList.remove("active"));
  		        this.classList.add("active");

  		        const target = this.dataset.target;
  		        document.querySelectorAll(".trip-list, .trip-list2").forEach(list => {
  		            list.classList.remove("active");
  		        });
  		        document.getElementById(target).classList.add("active");

  		        const departure = "${departure}";
  		        const destination = "${destination}";
  		        const numberOfTrips = (target === "trip-list") 
  		            ? "${numberOfTrips}" 
  		            : "${numberOfTripReturns}";

  		        if (target === "trip-list") {
  		            tripHeader.innerText = `${departure} - ${destination} (${numberOfTrips})`;
  		        } else {
  		            tripHeader.innerText = `${destination} - ${departure} (${numberOfTripReturns})`;
  		        }
  		    });
  		});
  		
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
    });
    
    function redirectToLogin() {
		const nguoiDungStr = localStorage.getItem("nguoiDung");
        if (nguoiDungStr) {
        	toggleModal();
        } else {
        	window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
        }
    }
    
    function toggleModal() {
		var modal = document.getElementById("userModal");
		modal.classList.toggle("show");
	}
    
    document.getElementById("logoutBtn").addEventListener("click", function () {
	    document.getElementById("confirmLogoutModal").classList.add("show");
	});

	document.getElementById("confirmNo").addEventListener("click", function () {
	    document.getElementById("confirmLogoutModal").classList.remove("show");
	});

	document.getElementById("modalClose").addEventListener("click", function () {
	    document.getElementById("confirmLogoutModal").classList.remove("show");
	});

	document.getElementById("confirmYes").addEventListener("click", function () {
	    localStorage.removeItem("nguoiDung");
	    window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
	});
	
	const modal = document.getElementById("confirmLogoutModal");
	window.addEventListener("click", function (event) {
	    if (event.target === modal) {
	        modal.classList.remove("show");
	    }
	});

    </script>

</body>
</html>