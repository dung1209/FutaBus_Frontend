<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Thông tin tài khoản</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/account.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />

</head>
<body>
	<div id="toast"></div>
	<aside class="sidebar" id="sidebar">
		<div class="sidebar__logo" id="sidebarLogo">
			<img src="<%=request.getContextPath()%>/assets/admin/image/logo.png"
				alt="Logo" />
		</div>

		<nav class="sidebar__nav">
			<a href="http://localhost:8085/FutaBusBooking/admin"
				class="menu-parent" id="dashboardParent"><img
				src="<%=request.getContextPath()%>/assets/admin/image/user.png"
				alt="user" /><span>Người Dùng</span><img
				src="<%=request.getContextPath()%>/assets/admin/image/down-arrow.png"
				alt="down" class="arrow" /></a>
			<div class="submenu" id="dashboardSubmenu">
				<a id="customer-link"
					href="<%=request.getContextPath()%>/admin?loaiNguoiDung=1">Khách
					hàng</a> <a id="staff-link"
					href="<%=request.getContextPath()%>/admin?loaiNguoiDung=2">Quản
					trị viên</a>
			</div>
			<a href="<%=request.getContextPath()%>/admin/ticket"><img
				src="<%=request.getContextPath()%>/assets/admin/image/order.png"
				alt="ticket" /><span>Quản Lý Vé</span></a> <a 
				href="<%=request.getContextPath()%>/admin/bus-route"><img
				src="<%=request.getContextPath()%>/assets/admin/image/route.png"
				alt="route" /><span>Quản Lý Tuyến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus-trip"><img
				src="<%=request.getContextPath()%>/assets/admin/image/map.png"
				alt="map" /><span>Quản Lý Chuyến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus-station"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-station.png"
				alt="station" /><span>Quản Lý Bến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-bus.png"
				alt="bus" /><span>Quản Lý Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/location"><img
				src="<%=request.getContextPath()%>/assets/admin/image/buildings.png"
				alt="location" /><span>Quản Lý địa điểm</span></a> <a href="<%=request.getContextPath()%>/admin/statistic"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bill.png"
				alt="bill" /><span>Thống Kê</span></a> <a href="<%=request.getContextPath()%>/admin/account" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/profile.png"
				alt="profile" class="active" /><span>Thông tin tài khoản</span></a>
		</nav>
	</aside>

	<div class="main">
		<header class="header">
			<div class="header__left">
				<button class="header__toggle" id="toggleBtn">
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/menu.png"
						alt="menu" />
				</button>
			</div>

			<div class="header__right">
				<div class="header__user" onclick="toggleModal()">
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/users.png"
						alt="User" /> <span>Xin chào <strong id="userName"></strong></span> <img
						src="<%=request.getContextPath()%>/assets/admin/image/down-arrow.png"
						alt="down" />
				</div>

				<div class="user-modal" id="userModal">
					<div class="user-modal__content">
						<p>
							<strong id="userNameAdmin"></strong>
						</p>
						<p id="userEmailAdmin"></p>
						<div class="user-modal__item">
							<img
								src="<%=request.getContextPath()%>/assets/admin/image/profile.png"
								alt="profile" /> Chỉnh sửa hồ sơ
						</div>
						<hr>
						<div class="user-modal__item logout">
							<img
								src="<%=request.getContextPath()%>/assets/admin/image/log-out.png"
								alt="log-out" class="log-out" /> Đăng xuất
						</div>
					</div>
				</div>
			</div>
		</header>

		<main class="content">
			<div class="cards">
				<div class="card">
					<div class="card__text">
						<div class="card__title">Khách hàng</div>
						<div class="card__value">${totalCustomer}</div>
					</div>
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/customer.png"
						alt="customer" />
				</div>
				<div class="card">
					<div class="card__text">
						<div class="card__title">Tổng số xe</div>
						<div class="card__value">${totalXe}</div>
					</div>
					<img src="<%=request.getContextPath()%>/assets/admin/image/bus.png"
						alt="bus" />
				</div>
				<div class="card">
					<div class="card__text">
						<div class="card__title">Số chuyến xe</div>
						<div class="card__value">${totalChuyenXe}</div>
					</div>
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/bus-route.png"
						alt="bus-route" />
				</div>
				<div class="card">
					<div class="card__text">
						<div class="card__title">Tổng doanh thu tháng</div>
						<div class="card__value">
							<fmt:formatNumber value="${tongDoanhThuThangHienTai}"
								type="number" groupingUsed="true" />
							đ
						</div>
					</div>
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/money.png"
						alt="money" />
				</div>
			</div>

			<div class="orders">
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
		</main>
	</div>

	<script>
	
	const nguoiDungStr = localStorage.getItem("nguoiDung");
    if (nguoiDungStr) {
        const nguoiDung = JSON.parse(nguoiDungStr);
        console.log("Thông tin người dùng:", nguoiDung);

        const userNameSpan = document.getElementById("userName");
        if (userNameSpan) {
            userNameSpan.innerText = nguoiDung.hoTen;
        }
        
        const userNameSpanAdmin = document.getElementById("userNameAdmin");
        if (userNameSpanAdmin) {
        	userNameSpanAdmin.innerText = nguoiDung.hoTen;
        }
        
        const userEmailSpanAdmin = document.getElementById("userEmailAdmin");
        if (userEmailSpanAdmin) {
            userEmailSpanAdmin.innerText = nguoiDung.email;
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
				  
				  const updatedNguoiDung = {
						  idNguoiDung: nguoiDung.idNguoiDung,
						  hoTen: hoTen,
						  email: email
				  };
				  localStorage.setItem("nguoiDung", JSON.stringify(updatedNguoiDung));
				  
				  setTimeout(() => {
					    window.location.reload();
					}, 1000);
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
    
	document.addEventListener('DOMContentLoaded', function() {
		const toggleBtn = document.getElementById('toggleBtn');
		const sidebar = document.getElementById('sidebar');
		const logoDiv = document.getElementById('sidebarLogo');
	    const logoImg = logoDiv.querySelector('img');
	    const dashboardParent = document.getElementById('dashboardParent');
	    const dashboardSubmenu = document.getElementById('dashboardSubmenu');

	    
	    let titleElement = document.getElementById("title");
	      let customerLink = document.getElementById("customer-link"); 
	      let staffLink = document.getElementById("staff-link"); 
	      
	    
	    if (localStorage.getItem('sidebarCollapsed') === 'true') {
	        sidebar.classList.add('collapsed');
	        logoImg.setAttribute('src', '<%=request.getContextPath()%>/assets/admin/image/image-logo.png');
	    }

	    toggleBtn.addEventListener('click', function() {
	        sidebar.classList.toggle('collapsed');
	        
	        if (sidebar.classList.contains('collapsed')) {
	          logoImg.setAttribute('src', '<%=request.getContextPath()%>/assets/admin/image/image-logo.png');
	          localStorage.setItem('sidebarCollapsed', 'true');
	        } else {
	          	logoImg.setAttribute('src', '<%=request.getContextPath()%>/assets/admin/image/logo.png');
				localStorage.setItem(
					'sidebarCollapsed',
					'false');
			}
			if (dashboardSubmenu.classList.contains('open')) {
				dashboardSubmenu.classList.remove('open');
				dashboardParent.classList.remove('open');
			}
		});
		dashboardParent.addEventListener('click', function(e) {
			e.preventDefault();
			if (!sidebar.classList.contains('collapsed')) {
				dashboardSubmenu.classList.toggle('open');
				dashboardParent.classList.toggle('open');
			}
		});
	});

	function toggleModal() {
		var modal = document.getElementById("userModal");
		modal.classList.toggle("show");
	}

	function getParameterByName(name) {
		let urlParams = new URLSearchParams(window.location.search);
		return urlParams.get(name);
	}

	document.addEventListener("click", function(event) {
		var modal = document.getElementById("userModal");
		var userHeader = document.querySelector(".header__user");

		if (!userHeader.contains(event.target) && !modal.contains(event.target)) {
			modal.classList.remove("show");
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

	</script>

</body>
</html>