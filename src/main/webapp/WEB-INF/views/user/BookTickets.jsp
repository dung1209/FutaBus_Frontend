<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Đặt vé xe</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/booktickets.css">
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<p>${departure}-${destination}</p>
			<p>${weekday},${departureDate}</p>
		</div>
	</nav>

	<div class="filter-container">
		<div class="filter-section">
			<div class="filter-header">
				<h5>Chọn ghế</h5>
				<div class="filter-actions">
					<button class="reset-filter">Thông tin xe</button>
				</div>
			</div>

			<div class="seating-list">
				<div class="filter-group">
					<label>Tầng dưới</label>
					<div class="filter-options">
						<table>
							<tbody>
								<tr class="flex items-center gap-1 justify-between">
									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangDuoiList[0].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangDuoiList[0].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" onclick="selectSeat(this)">
												<span class="absolute seat-label">${viTriGheTangDuoiList[0].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>

									<td style="position: relative; width: 24px;"></td>
									<td style="position: relative;"></td>
									<td style="position: relative; width: 24px;"></td>

									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangDuoiList[1].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangDuoiList[1].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" onclick="selectSeat(this)">
												<span class="absolute">${viTriGheTangDuoiList[1].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<c:forEach var="seat" items="${viTriGheTangDuoiList}"
									varStatus="status">
									<c:if test="${status.index >= 2}">
										<c:if test="${(status.index - 2) % 3 == 0}">
											<tr>
										</c:if>

										<td class="relative"><c:choose>
												<c:when test="${seat.trangThai == 1}">
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
														alt="seat icon">
													<span class="absolute">${seat.tenViTri}</span>
												</c:when>
												<c:otherwise>
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
														alt="seat icon" onclick="selectSeat(this)">
													<span class="absolute seat-label">${seat.tenViTri}</span>
												</c:otherwise>
											</c:choose></td>

										<c:if test="${(status.index - 2) % 3 != 2}">
											<td style="width: 24px;"></td>
										</c:if>

										<c:if
											test="${(status.index - 2) % 3 == 2 || status.index == fn:length(viTriGheTangDuoiList) - 1}">
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="filter-group">
					<label>Tầng trên</label>
					<div class="filter-options">
						<table>
							<tbody>
								<tr class="flex items-center gap-1 justify-between">
									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangTrenList[0].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangTrenList[0].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" onclick="selectSeat(this)">
												<span class="absolute seat-label">${viTriGheTangTrenList[0].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>

									<td style="position: relative; width: 24px;"></td>
									<td style="position: relative;"></td>
									<td style="position: relative; width: 24px;"></td>

									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangTrenList[1].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangTrenList[1].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" onclick="selectSeat(this)">
												<span class="absolute">${viTriGheTangTrenList[1].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<c:forEach var="seat" items="${viTriGheTangTrenList}"
									varStatus="status">
									<c:if test="${status.index >= 2}">
										<c:if test="${(status.index - 2) % 3 == 0}">
											<tr>
										</c:if>

										<td class="relative"><c:choose>
												<c:when test="${seat.trangThai == 1}">
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
														alt="seat icon">
													<span class="absolute">${seat.tenViTri}</span>
												</c:when>
												<c:otherwise>
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
														alt="seat icon" onclick="selectSeat(this)">
													<span class="absolute seat-label">${seat.tenViTri}</span>
												</c:otherwise>
											</c:choose></td>

										<c:if test="${(status.index - 2) % 3 != 2}">
											<td style="width: 24px;"></td>
										</c:if>

										<c:if
											test="${(status.index - 2) % 3 == 2 || status.index == fn:length(viTriGheTangDuoiList) - 1}">
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="filter-group">
					<div class="filter-options">
						<span class="sold"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
							width="22" height="22" alt="seat_disabled">Đã bán</span> <span
							class="vacant"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
							width="22" height="22" alt="seat_active">Còn trống</span> <span
							class="selecting"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_selecting.svg"
							width="22" height="22" alt="seat_selecting">Đang chọn</span>
					</div>
				</div>
			</div>

			<div class="divide"></div>

			<div class="customer-info">
				<h2>Thông tin khách hàng</h2>
				<form class="customer-form">
					<div class="form-group">
						<label for="name">Họ và tên <span class="required">*</span></label>
						<input type="text" id="name" name="name"
							placeholder="Nhập họ và tên">
					</div>
					<div class="form-group">
						<label for="phone">Số điện thoại <span class="required">*</span></label>
						<input type="text" id="phone" name="phone"
							placeholder="Nhập số điện thoại">
					</div>
					<div class="form-group">
						<label for="email">Email <span class="required">*</span></label> <input
							type="email" id="email" name="email" placeholder="Nhập email">
					</div>
					<div class="terms">
						<input type="checkbox" id="accept-terms" name="accept-terms">
						<label for="accept-terms"> Chấp nhận điều khoản đặt vé &
							chính sách bảo mật thông tin của FUTA Bus Lines </label>
					</div>
				</form>
				<div class="notes">
					<h3>ĐIỀU KHOẢN & LƯU Ý</h3>
					<p>
						(*) Quý khách vui lòng có mặt tại bến xuất phát của xe trước ít
						nhất 30 phút giờ xe khởi hành, mang theo thông báo đã thanh toán
						vé thành công có chứa mã vé được gửi từ hệ thống FUTA BUS LINES.
						Vui lòng liên hệ Trung tâm tổng đài <strong>1900 6067</strong> để
						được hỗ trợ.
					</p>
					<p>
						(*) Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ Tổng
						đài trung chuyển <strong>1900 6918</strong> trước khi đặt vé.
						Chúng tôi không đón/trung chuyển tại những điểm xe trung chuyển
						không thể tới được.
					</p>
				</div>
			</div>

			<div class="divide"></div>

			<div class="button-action">
				<button class="btn-cancel">Huỷ</button>
				<button class="btn-select" id="submit-button">Thanh toán</button>
			</div>
		</div>

		<div class="result-section">
			<div class="infor">
				<div class="departure-information">
					<p class="item">Thông tin lượt đi</p>
					<div class="trip-information">
						<span class="title">Tuyến xe</span><span class="road">${start}
							- ${end}</span>
					</div>
					<div class="trip-information">
						<span class="title">Thời gian xuất bến</span><span class="time">${formattedStartTime}</span>
					</div>
					<div class="trip-information">
						<span class="title">Số lượng ghế</span><span class="number">0
							Ghế</span>
					</div>
					<div class="trip-information">
						<span class="title">Số ghế</span><span class="seat"></span>
					</div>
					<div class="trip-information">
						<span class="title">Tổng tiền lượt đi</span><span class="price">0đ</span>
					</div>
				</div>

				<div class="price-information">
					<p class="item">Chi tiết giá</p>
					<div class="price-infor">
						<span class="title">Giá vé lượt đi</span><span
							class="ticket-price">0đ</span>
					</div>
					<div class="price-infor">
						<span class="title">Phí thanh toán</span><span class="fee">0đ</span>
					</div>

					<div class="divide"></div>

					<div class="price-infor">
						<span class="title">Tổng tiền</span><span class="total">0đ</span>
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
	
	let selectedSeatsCount = 0;
	const maxSeats = 5;
	let selectedSeats = [];
	
	function selectSeat(imageElement) {
	    const parentElement = imageElement.parentElement;
	    const spanElement = parentElement.querySelector('.seat-label');
	    const seatName = spanElement.textContent;
	    const seatActiveSrc = "<%=request.getContextPath()%>/assets/user/image/seat_active.svg";
	    const seatSelectingSrc = "<%=request.getContextPath()%>/assets/user/image/seat_selecting.svg";

	    if (imageElement.src.includes("seat_active.svg")) {
	    	if (selectedSeatsCount >= maxSeats) {
	    		toast({
	                title: "Chú ý!",
	                message: "Đã chọn đủ số ghế.",
	                type: "error",
	                duration: 1000
	            });
	            return;
	        }
	    	selectedSeats.push(seatName);
	        imageElement.src = seatSelectingSrc;
	        spanElement.style.color = "#ef5222"; 
	        selectedSeatsCount++;
	        let seatsText = String(selectedSeatsCount).concat(" Ghế");
	        let totalPrice = selectedSeatsCount * ${price};
	        let formattedTotalPrice = totalPrice.toLocaleString('vi-VN');
	        let totalPriceText = String(formattedTotalPrice).concat("đ");
	        
	        document.querySelector('.number').innerHTML = seatsText;
	        document.querySelector('.seat').textContent = selectedSeats.join(', ');
	        document.querySelector('.price').innerHTML = totalPriceText;
	        document.querySelector('.ticket-price').innerHTML = totalPriceText;
	        document.querySelector('.total').innerHTML = totalPriceText;
	    } else if (imageElement.src.includes("seat_selecting.svg")) {
	    	const index = selectedSeats.indexOf(seatName);
	        if (index !== -1) {
	            selectedSeats.splice(index, 1);
	        }
	        imageElement.src = seatActiveSrc; 
	        spanElement.style.color = ""; 
	        selectedSeatsCount--;
	        let seatsText = String(selectedSeatsCount).concat(" Ghế");
	        let totalPrice = selectedSeatsCount * ${price};
	        let formattedTotalPrice = totalPrice.toLocaleString('vi-VN');
	        let totalPriceText = String(formattedTotalPrice).concat("đ");
	        
	        document.querySelector('.number').innerHTML = seatsText;
	        document.querySelector('.seat').textContent = selectedSeats.join(', ');
	        document.querySelector('.price').innerHTML = totalPriceText;
	        document.querySelector('.ticket-price').innerHTML = totalPriceText;
	        document.querySelector('.total').innerHTML = totalPriceText;
	    }
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
	
	document.getElementById('submit-button').addEventListener('click', function(event) {
        const nameInput = document.getElementById('name');
        const nameValue = nameInput.value.trim();
        
        const phoneInput = document.getElementById('phone');
        const phoneValue = phoneInput.value.trim();
        
        const emailInput = document.getElementById('email');
        const emailValue = emailInput.value.trim();
        
        const termsCheckbox = document.getElementById("accept-terms");
        let isFormValid = true;
        
        const regex = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừửữựỳỵỷỹ\s]+$/u;
        const phoneRegex = /^[0-9]{10}$/;
        const emailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
        
        if (nameValue === '' || phoneValue === '' || emailValue === '') {
        	isFormValid = false;
            event.preventDefault();

            toast({
                title: "Chú ý!",
                message: "Vui lòng điền đầy đủ thông tin.",
                type: "error",
                duration: 1000
            });
        } 
        
        if (!regex.test(nameValue) && nameValue !== '') {
        	isFormValid = false;
            event.preventDefault();
            toast({
                title: "Lỗi!",
                message: "Họ và tên không được chứa số hoặc ký tự đặc biệt.",
                type: "error",
                duration: 1000
            });
        }
        
        if (!phoneRegex.test(phoneValue) && phoneValue !== '') {
        	isFormValid = false;
            event.preventDefault(); 
            toast({
                title: "Chú ý!",
                message: "Số điện thoại chứa 10 chữ số và chỉ bao gồm các số.",
                type: "error",
                duration: 1000
            });
        }
        
        if (!emailRegex.test(emailValue) && emailValue !== '') {
        	isFormValid = false;
            event.preventDefault();
            toast({
                title: "Lỗi!",
                message: "Email phải có đuôi @gmail.com.",
                type: "error",
                duration: 1000
            });
        }
        
        if (isFormValid && !termsCheckbox.checked) {
            event.preventDefault();
            toast({
                title: "Chú ý!",
                message: "Bạn cần chấp nhận điều khoản để thanh toán.",
                type: "error",
                duration: 1000
            });
        }
    });

	</script>

</body>
</html>