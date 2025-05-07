<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Quản lý vé</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/ticket.css">
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
			<h3>Chi tiết vé</h3>
			<div class="form-detail">
				<div class="column">
					<div class="form-group">
						<label>Họ tên:</label><input type="text" id="modalHoTen" readonly>
					</div>
					<div class="form-group">
						<label>Bến đi:</label><input type="text" id="modalBenDi" readonly>
					</div>
					<div class="form-group">
						<label>Tuyến:</label><input type="text" id="modalTenTuyen"
							readonly>
					</div>
					<div class="form-group">
						<label>Số lượng vé:</label><input type="text" id="modalSoLuongVe"
							readonly>
					</div>
				</div>

				<div class="column">
					<div class="form-group">
						<label>Số điện thoại:</label><input type="text"
							id="modalSoDienThoai" readonly>
					</div>
					<div class="form-group">
						<label>Bến đến:</label><input type="text" id="modalBenDen"
							readonly>
					</div>
					<div class="form-group">
						<label>Loại xe:</label><input type="text" id="modalLoaiXe"
							readonly>
					</div>
					<div class="form-group">
						<label>Giá vé:</label><input type="text" id="modalGiaVe" readonly>
					</div>
				</div>

				<div class="column">
					<div class="form-group">
						<label>Email:</label><input type="text" id="modalEmail" readonly>
					</div>
					<div class="form-group">
						<label>Thời điểm đi:</label><input type="text"
							id="modalThoiDiemDi" readonly>
					</div>
					<div class="form-group">
						<label>Biển số xe:</label><input type="text" id="modalBienSoXe"
							readonly>
					</div>
					<div class="form-group">
						<label>Tổng tiền:</label><input type="text" id="modalTongTien"
							readonly>
					</div>
				</div>

				<div class="column">
					<div class="form-group">
						<label>Thời gian đặt vé:</label><input type="text"
							id="modalThoiGianDatVe" readonly>
					</div>
					<div class="form-group">
						<label>Thời điểm đến:</label><input type="text"
							id="modalThoiDiemDen" readonly>
					</div>
					<div class="form-group">
						<label>Danh sách ghế:</label><input type="text"
							id="modalDanhSachGhe" readonly>
					</div>
					<div class="form-group">
						<label>Trạng thái:</label><input type="text" id="modalTrangThai"
							readonly>
					</div>
				</div>

				<input type="hidden" id="modalIdPhieuDatVe" value="36"> <input
					type="hidden" id="modalDanhSachIDGhe" value="1037">
			</div>

			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayModal').style.display='none'">Đóng</button>
			</div>
		</div>
	</div>

	<div id="overlayEditModal" class="overlay" style="display: none;">
		<div id="editModal" class="modal">
			<h3>Chỉnh sửa Vé</h3>
			<div class="form-detail">
				<div class="column">
					<div class="form-group">
						<label>Họ tên:</label><input type="text" id="editHoTen">
					</div>
					<div class="form-group">
						<label>Bến đi:</label><input type="text" id="editBenDi">
					</div>
					<div class="form-group">
						<label>Tuyến:</label><input type="text" id="editTenTuyen">
					</div>
					<div class="form-group">
						<label>Số lượng vé:</label><input type="number" id="editSoLuongVe">
					</div>
				</div>

				<div class="column">
					<div class="form-group">
						<label>Số điện thoại:</label><input type="text"
							id="editSoDienThoai">
					</div>
					<div class="form-group">
						<label>Bến đến:</label><input type="text" id="editBenDen">
					</div>
					<div class="form-group">
						<label>Loại xe:</label><input type="text" id="editLoaiXe">
					</div>
					<div class="form-group">
						<label>Giá vé:</label><input type="text" id="editGiaVe">
					</div>
				</div>

				<div class="column">
					<div class="form-group">
						<label>Email:</label><input type="text" id="editEmail">
					</div>
					<div class="form-group">
						<label>Thời điểm đi:</label><input type="text" id="editThoiDiemDi">
					</div>
					<div class="form-group">
						<label>Biển số xe:</label><input type="text" id="editBienSoXe">
					</div>
					<div class="form-group">
						<label>Tổng tiền:</label><input type="text" id="editTongTien">
					</div>
				</div>

				<div class="column">
					<div class="form-group">
						<label>Thời gian đặt vé:</label><input type="text"
							id="editThoiGianDatVe">
					</div>
					<div class="form-group">
						<label>Thời điểm đến:</label><input type="text"
							id="editThoiDiemDen">
					</div>
					<div class="form-group">
						<label>Danh sách ghế:</label><input type="text"
							id="editDanhSachGhe">
					</div>
					<div class="form-group">
						<label>Trạng thái:</label> <select id="editTrangThai">
							<option value="0">Đã hủy</option>
							<option value="1">Đã đặt</option>
							<option value="2">Chờ thanh toán</option>
							<option value="3">Đã thanh toán</option>
							<option value="4">Hoàn tất</option>
						</select>
					</div>
				</div>

				<input type="hidden" id="editIdPhieuDatVe"> <input
					type="hidden" id="editDanhSachIDGhe">
			</div>

			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayEditModal').style.display='none'">Đóng</button>
				<button onclick="saveEdit()">Lưu</button>
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
			<a href="<%=request.getContextPath()%>/admin/ticket" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/order.png"
				alt="ticket" class="active" /><span>Quản Lý Vé</span></a> <a
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
				alt="location" /><span>Quản Lý địa điểm</span></a> <a
				href="<%=request.getContextPath()%>/admin/statistic"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bill.png"
				alt="bill" /><span>Thống Kê</span></a> <a
				href="<%=request.getContextPath()%>/admin/account"><img
				src="<%=request.getContextPath()%>/assets/admin/image/profile.png"
				alt="chart" /><span>Thông tin tài khoản</span></a>
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
						alt="User" /> <span>Xin chào <strong id="userName"></strong></span>
					<img
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
				<div class="orders__header">
					<h2 id="title">Danh sách vé</h2>
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
							<th>Tên khách hàng</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th>Số lượng vé</th>
							<th>Tổng tiền</th>
							<th>Trạng thái</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="booking" items="${bookingInfoList}">
							<tr>
								<td>${booking.hoTen}</td>
								<td>${booking.soDienThoai}</td>
								<td>${booking.email}</td>
								<td>${booking.soLuongVe}</td>
								<td><fmt:formatNumber value="${booking.tongTien}"
										pattern="#,###" groupingUsed="true" /> đ</td>
								<td><c:choose>
										<c:when test="${booking.trangThai == 0}">Đã hủy</c:when>
										<c:when test="${booking.trangThai == 1}">Đã đặt</c:when>
										<c:when test="${booking.trangThai == 2}">Chờ thanh toán</c:when>
										<c:when test="${booking.trangThai == 3}">Đã thanh toán</c:when>
										<c:when test="${booking.trangThai == 4}">Hoàn tất</c:when>
										<c:otherwise>Không xác định</c:otherwise>
									</c:choose></td>
								<td><img
									src="<%=request.getContextPath()%>/assets/admin/image/see.png"
									alt="detail"
									onclick="showDetailModal('${booking.idPhieuDatVe}', 
     									'${booking.hoTen}', 
                               			'${booking.soDienThoai}', 
                               			'${booking.email}', 
                               			'${booking.thoiDiemDi}', 
                               			'${booking.thoiDiemDen}', 
                               			'${booking.trangThai}', 
                               			'${booking.tenTuyen}', 
                               			'${booking.benDi}', 
                               			'${booking.benDen}', 
                               			'${booking.bienSoXe}', 
                               			'${booking.loaiXe}', 
                               			'${booking.giaVe}', 
                               			'${booking.soLuongVe}', 
                               			'${booking.tongTien}', 
                               			'${booking.thoiGianDatVe}', 
                               			'${booking.danhSachGhe}', 
                               			'${booking.danhSachIDGhe}')" />
									<img
									src="<%=request.getContextPath()%>/assets/admin/image/update.png"
									alt="update"
									onclick="showEditModal('${booking.idPhieuDatVe}', 
    									'${booking.hoTen}', 
                               			'${booking.soDienThoai}', 
                               			'${booking.email}', 
                               			'${booking.thoiDiemDi}', 
                               			'${booking.thoiDiemDen}', 
                               			'${booking.trangThai}', 
                               			'${booking.tenTuyen}', 
                               			'${booking.benDi}', 
                               			'${booking.benDen}', 
                               			'${booking.bienSoXe}', 
                               			'${booking.loaiXe}', 
                               			'${booking.giaVe}', 
                               			'${booking.soLuongVe}', 
                               			'${booking.tongTien}', 
                               			'${booking.thoiGianDatVe}', 
                               			'${booking.danhSachGhe}', 
                               			'${booking.danhSachIDGhe}')" />
									<img
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
    } else {
        console.log("Không tìm thấy người dùng trong localStorage");
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
													localStorage.setItem(
															'sidebarCollapsed',
															'false');
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
		
		function formatDateTime(input) {
		    if (!input || typeof input !== "string") return "";

		    const parts = input.trim().split(" ");
		    if (parts.length !== 2) return "";

		    const datePart = parts[0]; 
		    const timePart = parts[1]; 

		    const [year, month, day] = datePart.split("-");
		    const [hour, minute] = timePart.split(":");

		    if (!year || !month || !day || !hour || !minute) return "";
		    
		    let dateTimeString = hour + ":" + minute + " " + day + "/" + month + "/" + year;
		    console.log(dateTimeString);

		    return dateTimeString;
		}

		function showDetailModal(idPhieuDatVe, hoTen, soDienThoai, email,
				thoiDiemDi, thoiDiemDen, trangThai, tenTuyen, benDi, benDen,
				bienSoXe, loaiXe, giaVe, soLuongVe, tongTien, thoiGianDatVe,
				danhSachGhe, danhSachIDGhe) {
			
			const trangThaiMap = {
					  0: "Đã hủy",
					  1: "Đã đặt",
					  2: "Chờ thanh toán",
					  3: "Đã thanh toán",
					  4: "Hoàn tất"
			};

			document.getElementById('modalTrangThai').value = trangThaiMap[trangThai] || "Không xác định";
			document.getElementById('modalIdPhieuDatVe').value = idPhieuDatVe;
			document.getElementById('modalHoTen').value = hoTen;
			document.getElementById('modalSoDienThoai').value = soDienThoai;
			document.getElementById('modalEmail').value = email;
			document.getElementById('modalThoiDiemDi').value = formatDateTime(thoiDiemDi);
			document.getElementById('modalThoiDiemDen').value = formatDateTime(thoiDiemDen);
			document.getElementById('modalTenTuyen').value = tenTuyen;
			document.getElementById('modalBenDi').value = benDi;
			document.getElementById('modalBenDen').value = benDen;
			document.getElementById('modalBienSoXe').value = bienSoXe;
			document.getElementById('modalLoaiXe').value = loaiXe;
			document.getElementById('modalGiaVe').value = Number(giaVe).toLocaleString('vi-VN') + ' đ';
			document.getElementById('modalSoLuongVe').value = soLuongVe;
			document.getElementById('modalTongTien').value = Number(tongTien).toLocaleString('vi-VN') + ' đ';
			document.getElementById('modalThoiGianDatVe').value = formatDateTime(thoiGianDatVe);
			document.getElementById('modalDanhSachGhe').value = danhSachGhe;
			document.getElementById('modalDanhSachIDGhe').value = danhSachIDGhe;

			const overlay = document.getElementById('overlayModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}
		
		function showEditModal(idPhieuDatVe, hoTen, soDienThoai, email, thoiDiemDi, thoiDiemDen, trangThai,
                tenTuyen, benDi, benDen, bienSoXe, loaiXe, giaVe, soLuongVe, tongTien,
                thoiGianDatVe, danhSachGhe, danhSachIDGhe) {

			document.getElementById('editIdPhieuDatVe').value = idPhieuDatVe;
			document.getElementById('editHoTen').value = hoTen;
			document.getElementById('editSoDienThoai').value = soDienThoai;
			document.getElementById('editEmail').value = email;
			document.getElementById('editThoiDiemDi').value = formatDateTime(thoiDiemDi);
			document.getElementById('editThoiDiemDen').value = formatDateTime(thoiDiemDen);
			document.getElementById('editTrangThai').value = trangThai;
			document.getElementById('editTenTuyen').value = tenTuyen;
			document.getElementById('editBenDi').value = benDi;
			document.getElementById('editBenDen').value = benDen;
			document.getElementById('editBienSoXe').value = bienSoXe;
			document.getElementById('editLoaiXe').value = loaiXe;
			document.getElementById('editGiaVe').value = Number(giaVe).toLocaleString('vi-VN') + ' đ';
			document.getElementById('editSoLuongVe').value = soLuongVe;
			document.getElementById('editTongTien').value = Number(tongTien).toLocaleString('vi-VN') + ' đ';
			document.getElementById('editThoiGianDatVe').value = formatDateTime(thoiGianDatVe);
			document.getElementById('editDanhSachGhe').value = danhSachGhe;
			document.getElementById('editDanhSachIDGhe').value = danhSachIDGhe;

			const overlay = document.getElementById('overlayEditModal');
			 overlay.style.display = 'flex';

			overlay.onclick = function(event) {
 				if (event.target === overlay) {
     				overlay.style.display = 'none';
 				}
			};
		}
		
		function saveEdit() {
			const id = document.getElementById('editIdPhieuDatVe').value;
			const trangThai = document.getElementById('editTrangThai').value;
			
			console.log("id:", id);
			console.log("trangThai:", trangThai);

			const url = 'http://localhost:8085/FutaBus_Backend/api/admin/update-ve/' + id;

			fetch(url, {
				method: 'PUT',
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify({ trangThai: parseInt(trangThai) })
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
					message: "Vé xe đã được cập nhật.",
					type: "success",
					duration: 1000
				});
				setTimeout(() => {
					window.location.reload();
				}, 1000);
			})
			.catch(error => {
				console.error("Lỗi cập nhật:", error.message);
				toast({
					title: "Lỗi!",
					message: "Không thể cập nhật vé xe.",
					type: "error",
					duration: 1000
				});
			});
		}

	</script>

</body>
</html>