<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Xe</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/bus.css">
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
        	<h3>Chi tiết xe</h3>
        	<div class="form-detail">
            	<label>Biển số xe:</label><input type="text" id="modalBienSo" readonly> 
            	<label>Tên xe:</label><input type="text" id="modalTenXe" readonly> 
            	<label>Loại xe:</label><input type="text" id="modalTenLoaiXe" readonly> 
            	<label>Số ghế:</label><input type="text" id="modalSoGhe" readonly>
        	</div>
        	<div class="modal-footer">
            	<button onclick="document.getElementById('overlayModal').style.display='none'">Đóng</button>
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
				alt="ticket" /><span>Quản Lý Vé</span></a> <a 
				href="<%=request.getContextPath()%>/admin/bus-route"><img
				src="<%=request.getContextPath()%>/assets/admin/image/route.png"
				alt="route" /><span>Quản Lý Tuyến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus-trip"><img
				src="<%=request.getContextPath()%>/assets/admin/image/map.png"
				alt="map" /><span>Quản Lý Chuyến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-bus.png"
				alt="bus" class="active" /><span>Quản Lý Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/location"><img
				src="<%=request.getContextPath()%>/assets/admin/image/buildings.png"
				alt="location" /><span>Quản Lý địa điểm</span></a> <a href="#"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bill.png"
				alt="bill" /><span>Quản Lý Hoá Đơn</span></a> <a href="#"><img
				src="<%=request.getContextPath()%>/assets/admin/image/chart.png"
				alt="chart" /><span>Thống Kê</span></a> <a 
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
				<div class="orders__header">
					<h2 id="title">Danh sách xe</h2>
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
							<th>Biển số</th>
							<th>Tên xe</th>
							<th>Loại xe</th>
							<th>Số ghế</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="xe" items="${xeList}">
							<tr>
								<td>${xe.bienSo}</td>
								<td>${xe.tenXe}</td>
								<c:set var="tenLoaiXe" value="" />
								<c:set var="soGheXe" value="" />

								<c:forEach var="loaixe" items="${loaiXeList}">
									<c:if test="${xe.loaiXe.idLoaiXe == loaixe.idLoaiXe}">
										<c:set var="tenLoaiXe" value="${loaixe.tenLoai}" />
										<c:set var="soGheXe" value="${loaixe.soGhe}" />
									</c:if>
								</c:forEach>

								<td>${tenLoaiXe}</td>
								<td>${soGheXe}</td>
								<td><img
									src="<%=request.getContextPath()%>/assets/admin/image/see.png"
									alt="detail"
									onclick="showDetailModal('${xe.bienSo}', 
     									'${xe.tenXe}', 
     									'${tenLoaiXe}', 
     									'${soGheXe}')" />
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
	
	function showDetailModal(bienSo, tenXe, tenLoaiXe, soGhe) {
	    document.getElementById('modalBienSo').value = bienSo;
	    document.getElementById('modalTenXe').value = tenXe;
	    document.getElementById('modalTenLoaiXe').value = tenLoaiXe;
	    document.getElementById('modalSoGhe').value = soGhe;

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