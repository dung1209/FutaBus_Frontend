<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Thông tin chung</title>
<%@ include file="../chatbox/chatbox.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/generalinformation.css">
<link rel="icon" href="data:,">
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
				width="26" style="margin: 0 10px" alt="download app icon"> <a
				href="javascript:void(0)" class="gap-3 cursor-pointer"
				id="userGreeting" onclick="redirectToLogin()"> Đăng nhập/Đăng ký
			</a>
		</div>

		<div class="user-modal" id="userModal">
			<div class="user-modal__content">
				<div class="user-modal__item">
					<a
						href="http://localhost:8086/FutaBus_Frontend/general-information">
						<img
						src="<%=request.getContextPath()%>/assets/user/image/infor_user.svg"
						alt="profile" /> Thông tin tài khoản
					</a>
				</div>
				<div class="user-modal__item">
					<a href="http://localhost:8086/FutaBus_Frontend/purchase-history">
						<img
						src="<%=request.getContextPath()%>/assets/user/image/history.svg"
						alt="profile" /> Lịch sử mua vé
					</a>
				</div>
				<div class="user-modal__item">
					<a href="http://localhost:8086/FutaBus_Frontend/reset-password">
						<img
						src="<%=request.getContextPath()%>/assets/user/image/change_password.svg"
						alt="profile" /> Đặt lại mật khẩu
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
			<li><a href="http://localhost:8086/FutaBus_Frontend">TRANG
					CHỦ</a></li>
			<li><a href="#">LỊCH TRÌNH</a></li>
			<li><a href="#">TRA CỨU VÉ</a></li>
			<li><a href="#">TIN TỨC</a></li>
			<li><a href="#">HOÁ ĐƠN</a></li>
			<li><a href="#">LIÊN HỆ</a></li>
			<li><a href="#">VỀ CHÚNG TÔI</a></li>
		</ul>
	</nav>


	<div class="container">
		<div class="sidebar">
			<ul class="nav">
				<li class="active"><a
					href="http://localhost:8086/FutaBus_Frontend/general-information">
						<img
						src="<%=request.getContextPath()%>/assets/user/image/infor_user.svg"
						alt="profile" /> Thông tin tài khoản
				</a></li>
				<li><a
					href="http://localhost:8086/FutaBus_Frontend/purchase-history">
						<img
						src="<%=request.getContextPath()%>/assets/user/image/history.svg"
						alt="history" /> Lịch sử mua vé
				</a></li>
				<li><a
					href="http://localhost:8086/FutaBus_Frontend/reset-password"> <img
						src="<%=request.getContextPath()%>/assets/user/image/change_password.svg"
						alt="chang-pass" /> Đặt lại mật khẩu
				</a></li>
				<li><div id="logoutBtn1" class="logout-btn">
						<img
							src="<%=request.getContextPath()%>/assets/user/image/logout.svg"
							alt="logout" /> Đăng xuất
					</div></li>
			</ul>
		</div>

		<div class="main-content">
			<h2>Thông tin tài khoản</h2>
			<p class="desc">Quản lý thông tin hồ sơ để bảo mật tài khoản</p>

			<div class="profile-card">
				<div class="avatar-section">
					<img
						src="<%=request.getContextPath()%>/assets/user/image/avatar_test.svg"
						alt="avatar" />
				</div>

				<div class="info-section">
					<div class="info-row">
						<label>Họ và tên:</label><input type="text" id="hoTen" value="--" />
					</div>
					<div class="info-row">
						<label>Giới tính:</label>
						<div class="custom-select-wrapper">
							<select id="gender-select" disabled>
								<option value="false">Nam</option>
								<option value="true">Nữ</option>
							</select> <img
								src="<%=request.getContextPath()%>/assets/user/image/down-arrow.png"
								alt="arrow" class="dropdown-icon">
						</div>
					</div>
					<div class="info-row">
						<label>Năm sinh:</label><input type="text" id="namSinh" value="--" />
					</div>
					<div class="info-row">
						<label>Số điện thoại:</label><input type="text" id="soDienThoai"
							value="--" />
					</div>
					<div class="info-row">
						<label>Email:</label><input type="text" id="email" value="--" />
					</div>
					<div class="info-row">
						<label>Địa chỉ:</label><input type="text" id="diaChi" value="--" />
					</div>
					<button class="edit-btn">Chỉnh sửa</button>
					<div class="info-row action-button">
						<button class="cancel-btn">Huỷ</button>
						<button class="update-btn">Cập nhật</button>
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
			}
			
			const url = 'http://localhost:8085/FutaBus_Backend/api/user/general-information/' + nguoiDung.idNguoiDung;

			fetch(url, {
				method: 'GET',
				headers: {
					'Content-Type': 'application/json'
				}
			})
			.then(response => response.json())
			.then(data => {
				console.log("✅ Dữ liệu người dùng đã nhận:", data);
				document.getElementById('hoTen').value = data.hoTen || "--";
				document.getElementById('namSinh').value = data.namSinh || "--";
				document.getElementById('soDienThoai').value = data.soDienThoai || "--";
				document.getElementById('email').value = data.email || "--";
				document.getElementById('diaChi').value = data.diaChi || "--";

				const genderSelect = document.getElementById('gender-select');
				if (data.gioiTinh === true) {
					genderSelect.value = "true"; 
				} else if (data.gioiTinh === false) {
					genderSelect.value = "false"; 
				} else {
					genderSelect.value = "khac";
				}
			})
			.catch(error => {
				console.error("❌ Lỗi khi lấy dữ liệu người dùng:", error.message);
			});
		} else {
			console.log("Không tìm thấy người dùng trong localStorage");
		}

		function toggleModal() {
			var modal = document.getElementById("userModal");
			modal.classList.toggle("show");
		}
		
		let originalData = {};
		
		document.querySelector('.edit-btn').addEventListener('click', function () {
			originalData.hoTen = document.getElementById('hoTen').value;
			  originalData.namSinh = document.getElementById('namSinh').value;
			  originalData.soDienThoai = document.getElementById('soDienThoai').value;
			  originalData.email = document.getElementById('email').value;
			  originalData.diaChi = document.getElementById('diaChi').value;
			  originalData.gender = document.getElementById('gender-select').value;
			  
		    const inputs = document.querySelectorAll('.info-section input');
		    inputs.forEach(input => {
		    	if (input.id !== 'email') {
		    		input.removeAttribute('readonly');
		    		input.style.pointerEvents = 'auto';
		    		input.style.border = '1px solid #ccc';
		    	}
		    });

		    const genderSelect = document.getElementById('gender-select');
		    genderSelect.removeAttribute('disabled');
		    genderSelect.style.pointerEvents = 'auto';
		    genderSelect.style.border = '1px solid #ccc';
		    
		    document.querySelector('.edit-btn').style.display = 'none';
		    document.querySelector('.info-row.action-button').style.display = 'block';
		});
		
		document.querySelector('.cancel-btn').addEventListener('click', function () {
			  document.getElementById('hoTen').value = originalData.hoTen;
			  document.getElementById('namSinh').value = originalData.namSinh;
			  document.getElementById('soDienThoai').value = originalData.soDienThoai;
			  document.getElementById('email').value = originalData.email;
			  document.getElementById('diaChi').value = originalData.diaChi;
			  document.getElementById('gender-select').value = originalData.gender;

			  const inputs = document.querySelectorAll('.info-section input');
			  inputs.forEach(input => {
			    input.setAttribute('readonly', true);
			    input.style.pointerEvents = 'none';
			    input.style.border = 'none';
			  });

			  const genderSelect = document.getElementById('gender-select');
			  genderSelect.setAttribute('disabled', true);
			  genderSelect.style.pointerEvents = 'none';
			  genderSelect.style.border = 'none';

			  document.querySelector('.edit-btn').style.display = 'inline-block';
			  document.querySelector('.info-row.action-button').style.display = 'none';
		});
		
		document.querySelector('.update-btn').addEventListener('click', function () {
			const hoTen = document.getElementById('hoTen').value.trim();
			const namSinh = document.getElementById('namSinh').value.trim();
			const soDienThoai = document.getElementById('soDienThoai').value.trim();
			const email = document.getElementById('email').value.trim();
			const diaChi = document.getElementById('diaChi').value.trim();
			const gender = document.getElementById('gender-select').value;
			const currentYear = new Date().getFullYear();
			let isValid = true;

			if (hoTen === "" || namSinh === "" || soDienThoai === "" || diaChi === "") {
				toast({
				    title: "Chú ý!",
				    message: "Vui lòng điền đầy đủ thông tin!",
				    type: "error",
				    duration: 1000
				});
				isValid = false;
			}
			else if (soDienThoai.length !== 10) {
				toast({
				    title: "Chú ý!",
				    message: "Số điện thoại gồm 10 chữ số!",
				    type: "error",
				    duration: 1000
				});
				isValid = false;
			} 
			else if (!/^0\d{9,10}$/.test(soDienThoai)) {
				toast({
					title: "Chú ý!",
					message: "Số điện thoại bắt đầu bằng 0 và có 10-11 chữ số!",
					type: "error",
					duration: 1000
				});
				isValid = false;
			}
			else if (currentYear - parseInt(namSinh) < 16) {
				toast({
					title: "Chú ý!",
				    message: "Bạn phải từ 16 tuổi trở lên.",
				    type: "error",
				    duration: 1000
				});
				isValid = false;
			}
			
			if (isValid) {
				const nguoiDungStr = localStorage.getItem("nguoiDung");
				const nguoiDung = JSON.parse(nguoiDungStr);
				const gender = document.getElementById("gender-select").value === "true";

				const nguoiDungData = {
						  idNguoiDung: nguoiDung.idNguoiDung,
						  hoTen: hoTen,
						  gioiTinh: gender,
						  namSinh: namSinh,  
						  CCCD: "",
						  diaChi: diaChi,
						  soDienThoai: soDienThoai,
						  email: "",
						  matKhau: "",
						  ngayDangKy: "",
						  trangThai: 1,
						  idPhanQuyen: 1
						};
				console.log("Dữ liệu người dùng gửi lên dũng:", nguoiDungData);
				
				const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/update-user');
				
				fetch(url, {
					  method: 'POST',
					  headers: {
						    "Content-Type": "application/json"
						  },
					  body: JSON.stringify(nguoiDungData)
					})
					.then(response => {
					  if (!response.ok) {
						  return response.text().then(text => {
						      throw new Error("Lỗi từ server: " + text); 
						    });
					  }
					  return response.json();
					})
					.then(data => {
					  console.log("Cập nhật thành công:", data);
					  toast({
					    title: "Thành công!",
					    message: "Thông tin đã được cập nhật.",
					    type: "success",
					    duration: 1000
					  });
					  
					  window.location.href = "http://localhost:8086/FutaBus_Frontend/general-information";
					})
					.catch(error => {
					  console.error("Lỗi cập nhật:", error.message);
					  toast({
					    title: "Lỗi!",
					    message: "Không thể cập nhật thông tin.",
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
		
		document.getElementById("logoutBtn").addEventListener("click", function () {
		    document.getElementById("confirmLogoutModal").classList.add("show");
		});
		
		document.getElementById("logoutBtn1").addEventListener("click", function () {
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