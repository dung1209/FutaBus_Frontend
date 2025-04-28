<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Chuyến xe</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/bustrip.css">
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
	<div id="overlayModal" class="overlay" style="display: none;">
		<div id="detailModal" class="modal">
			<h3>Chi tiết chuyến xe</h3>
			<div class="form-detail">
				<label>Tên tuyến:</label><input type="text" id="modalTenTuyen"
					readonly> <label>Thời điểm đi:</label><input type="text"
					id="modalThoiDiemDi" readonly> <label>Thời điểm
					đến:</label><input type="text" id="modalThoiDiemDen" readonly> <label>Biển
					số xe:</label><input type="text" id="modalBienSo" readonly> <label>Giá
					vé:</label><input type="text" id="modalGiaVe" readonly> <label>Tài
					xế:</label><input type="text" id="modalTaiXe" readonly>
			</div>
			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayModal').style.display='none'">Đóng</button>
			</div>
		</div>
	</div>

	<div id="overlayEditModal" class="overlay" style="display: none;">
		<div id="editModal" class="modal">
			<h3>Chỉnh sửa người dùng</h3>
			<div class="form-detail form-edit">
				<label>Họ và tên:</label><input type="text" id="editHoTen">
				<label>Giới tính:</label> <select id="editGioiTinh">
					<option value="false">Nam</option>
					<option value="true">Nữ</option>
				</select> <label>Năm sinh:</label><input type="text" id="editNamSinh">
				<label>Số điện thoại:</label><input type="text" id="editSoDienThoai">
				<label>Email:</label><input type="text" id="editEmail" readonly>
				<label>Địa chỉ:</label><input type="text" id="editDiaChi"> <input
					type="hidden" id="editUserId">
			</div>
			<div class="modal-footer">
				<button onclick="submitEdit()">Lưu</button>
				<button class="cancel-btn"
					onclick="document.getElementById('overlayEditModal').style.display='none'">Hủy</button>
			</div>
		</div>
	</div>

	<div id="overlayDeleteModal" class="overlay" style="display: none;">
		<div id="confirmModal" class="modal delete-modal">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Xác nhận</h2>
					<span class="close" id="modalClose">&times;</span>
				</div>
				<div class="modal-body">
					<p class="title-question">Bạn có muốn xoá người dùng không?</p>
				</div>
				<div class="modal-footer">
					<button id="confirmYes" class="btn btn-yes">Có</button>
					<button id="confirmNo" class="btn btn-no">Không</button>
				</div>
			</div>
		</div>
	</div>

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
				alt="ticket" /><span>Quản Lý Vé</span></a> <a href="<%=request.getContextPath()%>/admin/bus-route"><img
				src="<%=request.getContextPath()%>/assets/admin/image/route.png"
				alt="route" /><span>Quản Lý Tuyến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus-trip" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/map.png"
				alt="map" class="active" /><span>Quản Lý Chuyến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-bus.png"
				alt="bus" /><span>Quản Lý Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/location"><img
				src="<%=request.getContextPath()%>/assets/admin/image/buildings.png"
				alt="location" /><span>Quản Lý địa điểm</span></a> <a href="#"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bill.png"
				alt="bill" /><span>Quản Lý Hoá Đơn</span></a> <a href="#"><img
				src="<%=request.getContextPath()%>/assets/admin/image/chart.png"
				alt="chart" /><span>Thống Kê</span></a>
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
						alt="User" /> <span>Xin chào <strong>Emirhan
							Boruch</strong></span> <img
						src="<%=request.getContextPath()%>/assets/admin/image/down-arrow.png"
						alt="down" />
				</div>

				<div class="user-modal" id="userModal">
					<div class="user-modal__content">
						<p>
							<strong>Emirhan Boruch</strong>
						</p>
						<p>emirhanboruch51@gmail.com</p>
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
						<div class="card__value">3,782</div>
					</div>
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/customer.png"
						alt="customer" />
				</div>
				<div class="card">
					<div class="card__text">
						<div class="card__title">Tổng số xe</div>
						<div class="card__value">59</div>
					</div>
					<img src="<%=request.getContextPath()%>/assets/admin/image/bus.png"
						alt="bus" />
				</div>
				<div class="card">
					<div class="card__text">
						<div class="card__title">Số chuyến xe</div>
						<div class="card__value">187</div>
					</div>
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/bus-route.png"
						alt="bus-route" />
				</div>
				<div class="card">
					<div class="card__text">
						<div class="card__title">Tổng doanh thu tháng</div>
						<div class="card__value">102.000.259</div>
					</div>
					<img
						src="<%=request.getContextPath()%>/assets/admin/image/money.png"
						alt="money" />
				</div>
			</div>

			<div class="orders">
				<div class="orders__header">
					<h2 id="title">Danh sách chuyến xe</h2>
					<div class="orders__actions">
						<div class="search-box">
							<input type="text" placeholder="Nhập từ khoá để tìm kiếm..." />
							<div class="search-box__icon">
								<img
									src="<%=request.getContextPath()%>/assets/admin/image/magnifying-glass.png"
									alt="search" />
							</div>
						</div>
					</div>
				</div>

				<table>
					<thead>
						<tr>
							<th>Tuyến xe</th>
							<th>Thời điểm đi</th>
							<th>Thời điểm đến</th>
							<th>Xe</th>
							<th>Giá vé</th>
							<th>Tài xế</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="chuyenxe" items="${chuyenXeList}">
							<tr>
								<td>${chuyenxe.tuyenXe.tenTuyen}</td>
								<td>${chuyenxe.thoiDiemDi}</td>
								<td>${chuyenxe.thoiDiemDen}</td>
								<td>${chuyenxe.xe.bienSo}</td>
								<td><fmt:formatNumber value="${chuyenxe.giaVe}"
										pattern="#,###" groupingUsed="true" /> đ</td>
								<td>${chuyenxe.taiXe.hoTen}</td>
								<td>
									<img
									src="<%=request.getContextPath()%>/assets/admin/image/see.png"
									alt="detail"
									onclick="showDetailModal('${chuyenxe.tuyenXe.tenTuyen}', 
     									'${chuyenxe.thoiDiemDi}', 
     									'${chuyenxe.thoiDiemDen}', 
     									'${chuyenxe.xe.bienSo}', 
     									'${chuyenxe.giaVe}', 
     									'${chuyenxe.taiXe.hoTen}')" />
									<img
									src="<%=request.getContextPath()%>/assets/admin/image/update.png"
									alt="update" /> <img
									src="<%=request.getContextPath()%>/assets/admin/image/delete.png"
									alt="delete" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="custom-hr"></div>

				<div class="pagination-container">
					<p class="pagination-info">Hiển thị trang ${currentPage} trong
						${totalPages} trang</p>
					<div class="pagination">
						<c:choose>
							<c:when test="${currentPage <= 1}">
								<span class="prev disabled">Trước</span>
							</c:when>
							<c:otherwise>
								<a href="?page=${currentPage - 1}" class="prev">Trước</a>
							</c:otherwise>
						</c:choose>

						<c:forEach var="i" begin="1" end="${totalPages}">
							<a href="?page=${i}"
								class="page ${i == currentPage ? 'active' : ''}">${i}</a>
						</c:forEach>

						<c:choose>
							<c:when test="${currentPage >= totalPages}">
								<span class="next disabled">Sau</span>
							</c:when>
							<c:otherwise>
								<a href="?page=${currentPage + 1}" class="next">Sau</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</main>
	</div>

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
	          localStorage.setItem('sidebarCollapsed', 'false');
											}

											if (dashboardSubmenu.classList
													.contains('open')) {
												dashboardSubmenu.classList
														.remove('open');
												dashboardParent.classList
														.remove('open');
											}
										});

						dashboardParent.addEventListener('click', function(
								e) {
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

		if (!userHeader.contains(event.target)
				&& !modal.contains(event.target)) {
			modal.classList.remove("show");
		}
	});
	
	function formatCurrency(number) {
	    return Number(number).toLocaleString('vi-VN') + ' đ';
	}
	
	function showDetailModal(tenTuyen, thoiDiemDi, thoiDiemDen, bienSo, giaVe, taiXe) {
	    document.getElementById('modalTenTuyen').value = tenTuyen;
	    document.getElementById('modalThoiDiemDi').value = thoiDiemDi;
	    document.getElementById('modalThoiDiemDen').value = thoiDiemDen;
	    document.getElementById('modalBienSo').value = bienSo;
	    document.getElementById('modalGiaVe').value = formatCurrency(giaVe);
	    document.getElementById('modalTaiXe').value = taiXe;

	    const overlay = document.getElementById('overlayModal');
	    overlay.style.display = 'flex';

	    overlay.onclick = function (event) {
	        if (event.target === overlay) {
	            overlay.style.display = 'none';
	        }
	    };
	}

	</script>

</body>
</html>