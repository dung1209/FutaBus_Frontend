<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>FUTA Bus Lines</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/home.css">
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

	<img
		src="<%=request.getContextPath()%>/assets/user/image/home_background.png"
		alt="FUTA Bus Lines" class="centered-image">

	<section class="search-section">
		<h2>Tìm chuyến xe</h2>

		<div class="booking-options">
			<div class="trip-options">
				<label class="option"> <span> <input type="radio"
						class="ant-radio-input" name="trip-type" checked value="false"
						id="one-way"> <span class="ant-radio-inner"></span>
				</span> <span>Một chiều</span>
				</label> <label class="option"> <span> <input type="radio"
						class="ant-radio-input" name="trip-type" value="true"
						id="round-trip"> <span class="ant-radio-inner"></span>
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
					autocomplete="off">
				<ul id="dropdown-list-departure" class="dropdown-list">
				</ul>
			</div>

			<div class="form-group">
				<label for="destination">Điểm đến</label> <input id="destination"
					name="destination" class="form-control" placeholder="Chọn điểm đến"
					autocomplete="off">
				<ul id="dropdown-list-destination" class="dropdown-list">
				</ul>
			</div>

			<div class="form-group">
				<label for="myID_go">Ngày đi</label> <input id="myID_go" type="date"
					name="departure-date" class="form-control">
			</div>

			<div class="form-group hidden" id="return-date-group">
				<label for="myID_back">Ngày về</label> <input id="myID_back"
					type="date" name="return-date" class="form-control" readonly>
			</div>

			<div class="form-group">
				<label for="tickets">Số vé</label> <input id="tickets"
					name="tickets" class="form-control" placeholder="1"
					autocomplete="off" value="1" readonly>
				<ul id="dropdown-list-tickets" class="dropdown-list">
					<li data-value="1">1</li>
					<li data-value="2">2</li>
					<li data-value="3">3</li>
					<li data-value="4">4</li>
					<li data-value="5">5</li>
				</ul>
				<span class="dropdown-icon">&#9662;</span>
			</div>

			<button type="submit" class="search-button">Tìm chuyến xe</button>
		</form>
	</section>

	<section class="promotions">
		<h3>KHUYẾN MÃI NỔI BẬT</h3>
		<div class="promotion-cards">
			<div>
				<img
					src="<%=request.getContextPath()%>/assets/user/image/khuyenmai1.png"
					alt="Khuyen Mai 1" class="km-image">
			</div>
			<div>
				<img
					src="<%=request.getContextPath()%>/assets/user/image/khuyenmai2.png"
					alt="Khuyen Mai 2" class="km-image mid">
			</div>
			<div>
				<img
					src="<%=request.getContextPath()%>/assets/user/image/khuyenmai3.png"
					alt="Khuyen Mai 3" class="km-image">
			</div>
		</div>
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

        const cities = [];

        <c:forEach var="tinhThanh" items="${tinhThanhList}">
        	cities.push({ id: "${tinhThanh.idTinhThanh}", name: "${tinhThanh.tenTinh}" });
        </c:forEach>

        const showDropdown = (input, dropdown, filter = "") => {
            dropdown.innerHTML = ""; 
            const filteredCities = cities.filter(city => city.name.toLowerCase().includes(filter.toLowerCase()));

            if (filteredCities.length > 0) {
                filteredCities.forEach(city => {
                    const li = document.createElement("li");
                    li.textContent = city.name;
                    li.addEventListener("click", () => {
                        input.value = city.name; 
                        input.setAttribute('data-id', city.id);
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

        document.getElementById("myID_go").value = formattedDate;
        document.getElementById("myID_back").value = formattedDate;
        
        const oneWayRadio = document.getElementById("one-way");
        const roundTripRadio = document.getElementById("round-trip");
        const returnDateGroup = document.getElementById("return-date-group");
        const returnDateInput = document.getElementById("myID_back");
        var returnDate = document.getElementById("myID_back");
        var departureDate = document.getElementById("myID_go");

        oneWayRadio.addEventListener("change", function() {
            returnDateGroup.classList.add("hidden");
            returnDateInput.disabled = true;
        });

        roundTripRadio.addEventListener("change", function() {
            returnDateGroup.classList.remove("hidden");
            returnDateInput.disabled = false; 
            returnDate.value = departureDate.value; 
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
        
        document.querySelector(".booking-form").addEventListener("submit", function (event) {
        	event.preventDefault();
        	
            let departure = document.getElementById("departure").value.trim();
            let destination = document.getElementById("destination").value.trim(); 
            let myID_go = document.getElementById("myID_go").value.trim();
            let myID_back = document.getElementById("myID_back").value.trim(); 
            let tickets = document.getElementById("tickets").value.trim();
            let isRoundTrip = document.getElementById("round-trip").checked;
            let isValid = true;
            let departureId = departureInput.getAttribute('data-id'); 
            let destinationId = destinationInput.getAttribute('data-id');

            if (departure === "") {
                toast({
    	        	title: "Chú ý!",
    	        	message: "Vui lòng chọn điểm đi!",
    	          	type: "error",
    	        	duration: 1000
    	      	});
        		isValid = false;
          	}
            if (destination === "") {
              	toast({
    	      		title: "Chú ý!",
    	      		message: "Vui lòng chọn điểm đến!",
    	       		type: "error",
    	    		duration: 1000
    	        });
                isValid = false;
            }
            if (myID_go === "") {
                toast({
	                title: "Chú ý!",
	                message: "Vui lòng chọn ngày đi!",
	                type: "error",
	                duration: 1000
	            });
                isValid = false;
            }
            if (isRoundTrip && myID_back === "") {
                toast({
	                title: "Chú ý!",
	                message: "Vui lòng chọn ngày về!",
	                type: "error",
	                duration: 1000
	            });
                isValid = false;
            }
            if (isValid) {
            	const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/trip-selection');
				
            	url.searchParams.append("departureId", departureId);
                url.searchParams.append("departure", departure);
                url.searchParams.append("destinationId", destinationId);
                url.searchParams.append("destination", destination);
                url.searchParams.append("departureDate", myID_go);
                if (isRoundTrip) url.searchParams.append("returnDate", myID_back);
                url.searchParams.append("tickets", parseInt(tickets));

                fetch(url, {
                    method: 'GET',  
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    console.log("Dữ liệu đã nhận thành công!", data);
                    console.log("Departure ID: " + departureId);
                    console.log("Destination ID: " + destinationId);
                    if (data.status === "success") { 
                        let redirectURL = '/FutaBus_Frontend/trip-selection?departureId=' + departureId +
                        '&departure=' + departure +
                        '&destinationId=' + destinationId +
                        '&destination=' + destination +
                        '&departureDate=' + myID_go +
                        '&tickets=' + tickets + 
                        (isRoundTrip ? '&returnDate=' + myID_back : '');

      					window.location.href = redirectURL;
                    } else {
                        console.error("❌ Lỗi phản hồi từ API:", data);
                    }
                })
                .catch(error => {
                    console.error("❌ Lỗi khi lấy dữ liệu:", error.message);
                    console.error("🔍 Chi tiết lỗi:", error);
                });
            }
        });
    });
    </script>

</body>
</html>