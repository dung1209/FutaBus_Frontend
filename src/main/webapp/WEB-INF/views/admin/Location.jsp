<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Địa điểm</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/location.css">
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
			<h3>Chi tiết Quận/Huyện</h3>
			<div class="form-detail">
				<label>Tên quận huyện:</label><input type="text"
					id="modalTenQuanHuyen" readonly> <label>Tên tỉnh
					thành:</label><input type="text" id="modalTenTinhThanh" readonly>
			</div>
			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayModal').style.display='none'">Đóng</button>
			</div>
		</div>
	</div>

	<div id="overlayModal1" class="overlay" style="display: none;">
		<div id="detailModal" class="modal">
			<h3>Chi tiết Tỉnh Thành</h3>
			<div class="form-detail">
				<label>Tên tỉnh thành:</label> <input type="text" id="modalTenTinh"
					readonly>
			</div>
			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayModal1').style.display='none'">Đóng</button>
			</div>
		</div>
	</div>

	<div id="overlayEditModal" class="overlay" style="display: none;">
		<div id="editModal" class="modal">
			<h3>Chỉnh sửa Quận/Huyện</h3>
			<div class="form-detail form-edit">
				<label>Tên Quận/Huyện:</label> <input type="text"
					id="editTenQuanHuyen"> <label>Tên Tỉnh/Thành:</label> <select
					id="editTenTinh" name="editTenTinh">
					<c:forEach var="tinhThanhAll" items="${tinhThanhAllList}">
						<option value="${tinhThanhAll.idTinhThanh}"
							${tinhThanhAll.idTinhThanh == idTinhThanh ? 'selected' : ''}>${tinhThanhAll.tenTinh}</option>
					</c:forEach>
				</select> <input type="hidden" id="editQuanHuyenId"> <input
					type="hidden" id="editTinhThanhId">
			</div>

			<div class="modal-footer">
				<button onclick="submitEdit()">Lưu</button>
				<button class="cancel-btn"
					onclick="document.getElementById('overlayEditModal').style.display='none'">Hủy</button>
			</div>
		</div>
	</div>

	<div id="overlayEditModal2" class="overlay" style="display: none;">
		<div id="editModal" class="modal">
			<h3>Chỉnh sửa Tỉnh/Thành</h3>
			<div class="form-detail form-edit">
				<label>Tên Tỉnh thành:</label> <input type="text" id="editTenTinh2"
					name="editTenTinh2" value="${tinhThanh.tenTinh}" /> <input
					type="hidden" id="editTinhThanhId">
			</div>

			<div class="modal-footer">
				<button onclick="submitEditTinh()">Lưu</button>
				<button class="cancel-btn"
					onclick="document.getElementById('overlayEditModal2').style.display='none'">
					Hủy</button>
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
					<p class="title-question">Bạn có muốn xoá quận/huyện không?</p>
				</div>
				<div class="modal-footer">
					<button id="confirmYes" class="btn btn-yes">Có</button>
					<button id="confirmNo" class="btn btn-no">Không</button>
				</div>
			</div>
		</div>
	</div>

	<div id="overlayDeleteModal2" class="overlay" style="display: none;">
		<div id="confirmModal" class="modal delete-modal">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Xác nhận</h2>
					<span class="close" id="modalClose">&times;</span>
				</div>
				<div class="modal-body">
					<p class="title-question">Bạn có muốn xoá tỉnh thành không?</p>
				</div>
				<div class="modal-footer">
					<button id="confirmYes2" class="btn btn-yes">Có</button>
					<button id="confirmNo" class="btn btn-no">Không</button>
				</div>
			</div>
		</div>
	</div>

	<div id="overlayAddHuyenModal" class="overlay" style="display: none;">
		<div id="addModal" class="modal">
			<h3>Thêm Quận/Huyện</h3>
			<div class="form-detail form-add">
				<label>Tên Quận/Huyện:</label> <input type="text"
					id="addTenQuanHuyen"> <label>Thuộc Tỉnh/Thành:</label> <select
					id="addTinhThanhId">
					<c:forEach var="tinhThanh" items="${tinhThanhAllList}">
						<option value="${tinhThanh.idTinhThanh}">${tinhThanh.tenTinh}</option>
					</c:forEach>
				</select>
			</div>

			<div class="modal-footer">
				<button onclick="submitAddQuanHuyen()">Lưu</button>
				<button class="cancel-btn" onclick="document.getElementById('overlayAddHuyenModal').style.display='none'">Hủy</button>
			</div>
		</div>
	</div>

	<div id="overlayAddTinhModal" class="overlay" style="display: none;">
		<div id="addModal" class="modal">
			<h3>Thêm Tỉnh/Thành</h3>
			<div class="form-detail form-add">
				<label>Tên Tỉnh/Thành:</label> <input type="text"
					id="addTenTinhThanh">
			</div>

			<div class="modal-footer">
				<button onclick="submitAddTinhThanh()">Lưu</button>
				<button class="cancel-btn" onclick="document.getElementById('overlayAddTinhModal').style.display='none'">Hủy</button>
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
				href="<%=request.getContextPath()%>/admin/bus-station"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-station.png"
				alt="station" /><span>Quản Lý Bến Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/bus"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-bus.png"
				alt="bus" /><span>Quản Lý Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/location" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/buildings.png"
				alt="location" class="active" /><span>Quản Lý địa điểm</span></a> <a
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
						<div class="user-modal__item logout" id="logoutBtn">
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

			<div class="orders-container">
				<div class="orders">
					<div class="orders__header">
						<h2 id="title">Danh sách quận/huyện</h2>
						<div class="orders__actions">
							<div class="search-box">
								<input type="text" id="searchInput"
									placeholder="Nhập từ khoá để tìm kiếm..." />
								<div class="search-box__icon">
									<img
										src="<%=request.getContextPath()%>/assets/admin/image/magnifying-glass.png"
										alt="search" />
								</div>
							</div>
							<button type="submit" class="btn-add-huyen"
								onclick="showAddHuyenModal()">+ Thêm</button>
						</div>
					</div>

					<table id="table-quanhuyen">
						<thead>
							<tr>
								<th>Tên quận</th>
								<th>Tỉnh thành</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="quanhuyen" items="${quanHuyenList}">
								<tr>
									<td>${quanhuyen.tenQuanHuyen}</td>
									<td>${quanhuyen.tinhThanh.tenTinh}</td>
									<td><img
										src="<%=request.getContextPath()%>/assets/admin/image/see.png"
										alt="detail"
										onclick="showDetailModal('${quanhuyen.tenQuanHuyen}', 
     									'${quanhuyen.tinhThanh.tenTinh}')" />
										<img
										src="<%=request.getContextPath()%>/assets/admin/image/update.png"
										alt="update"
										onclick="showEditModal(
    									'${quanhuyen.idQuanHuyen}',
    									'${quanhuyen.tenQuanHuyen}',
        								'${quanhuyen.tinhThanh.idTinhThanh}', 
        								'${quanhuyen.tinhThanh.tenTinh}')" />
										<img
										src="<%=request.getContextPath()%>/assets/admin/image/delete.png"
										alt="delete"
										onclick="showDeleteModal('${quanhuyen.idQuanHuyen}')" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="custom-hr"></div>

					<div class="pagination-container">
						<p class="pagination-info">Hiển thị trang ${currentQuanPage}
							trong ${totalQuanPages} trang</p>
						<div class="pagination">
							<c:choose>
								<c:when test="${currentQuanPage <= 1}">
									<span class="prev disabled">Trước</span>
								</c:when>
								<c:otherwise>
									<a
										href="?pageQuan=${currentQuanPage - 1}&pageTinh=${currentTinhPage}"
										class="prev">Trước</a>
								</c:otherwise>
							</c:choose>

							<c:forEach var="i" begin="1" end="${totalQuanPages}">
								<a href="?pageQuan=${i}&pageTinh=${currentTinhPage}"
									class="page ${i == currentQuanPage ? 'active' : ''}">${i}</a>
							</c:forEach>

							<c:choose>
								<c:when test="${currentQuanPage >= totalQuanPages}">
									<span class="next disabled">Sau</span>
								</c:when>
								<c:otherwise>
									<a
										href="?pageQuan=${currentQuanPage + 1}&pageTinh=${currentTinhPage}"
										class="next">Sau</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="orders">
					<div class="orders__header">
						<h2 id="title">Danh sách quận/huyện</h2>
						<div class="orders__actions">
							<div class="search-box">
								<input type="text" id="searchInput2"
									placeholder="Nhập từ khoá để tìm kiếm..." />
								<div class="search-box__icon">
									<img
										src="<%=request.getContextPath()%>/assets/admin/image/magnifying-glass.png"
										alt="search" />
								</div>
							</div>
							<button type="submit" class="btn-add-tinh"
								onclick="showAddTinhModal()">+ Thêm</button>
						</div>
					</div>

					<table id="table-tinh">
						<thead>
							<tr>
								<th>Tên tỉnh</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tinhthanh" items="${tinhThanhList}">
								<tr>
									<td>${tinhthanh.tenTinh}</td>
									<td><img
										src="<%=request.getContextPath()%>/assets/admin/image/see.png"
										alt="detail"
										onclick="showDetailModal1('${tinhthanh.tenTinh}')" /> <img
										src="<%=request.getContextPath()%>/assets/admin/image/update.png"
										alt="update"
										onclick="showEditModal2(
    									'${tinhthanh.idTinhThanh}',
        								'${tinhthanh.tenTinh}')" />
										<img
										src="<%=request.getContextPath()%>/assets/admin/image/delete.png"
										alt="delete"
										onclick="showDeleteModal2('${tinhthanh.idTinhThanh}')" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="custom-hr"></div>

					<div class="pagination-container">
						<p class="pagination-info">Hiển thị trang ${currentTinhPage}
							trong ${totalTinhPages} trang</p>
						<div class="pagination">
							<c:choose>
								<c:when test="${currentTinhPage <= 1}">
									<span class="prev disabled">Trước</span>
								</c:when>
								<c:otherwise>
									<a
										href="?pageQuan=${currentQuanPage}&pageTinh=${currentTinhPage - 1}"
										class="prev">Trước</a>
								</c:otherwise>
							</c:choose>

							<c:forEach var="i" begin="1" end="${totalTinhPages}">
								<a href="?pageQuan=${currentQuanPage}&pageTinh=${i}"
									class="page ${i == currentTinhPage ? 'active' : ''}">${i}</a>
							</c:forEach>

							<c:choose>
								<c:when test="${currentTinhPage >= totalTinhPages}">
									<span class="next disabled">Sau</span>
								</c:when>
								<c:otherwise>
									<a
										href="?pageQuan=${currentQuanPage}&pageTinh=${currentTinhPage + 1}"
										class="next">Sau</a>
								</c:otherwise>
							</c:choose>
						</div>
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

		function showDetailModal(tenQuanHuyen, tenTinhThanh) {
			document.getElementById('modalTenQuanHuyen').value = tenQuanHuyen;
			document.getElementById('modalTenTinhThanh').value = tenTinhThanh;

			const overlay = document.getElementById('overlayModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}

		function showDetailModal1(tenTinh) {
			document.getElementById('modalTenTinh').value = tenTinh;

			const overlay = document.getElementById('overlayModal1');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}

		function showEditModal(idQuanHuyen, tenQuanHuyen, idTinhThanh, tenTinh) {
			document.getElementById('editQuanHuyenId').value = idQuanHuyen;
		    document.getElementById('editTenQuanHuyen').value = tenQuanHuyen;
		    document.getElementById('editTinhThanhId').value = idTinhThanh;
		    document.getElementById('editTenTinh').value = idTinhThanh;

			const overlay = document.getElementById('overlayEditModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}
		
		document.getElementById('editTenTinh').addEventListener('change', function() {
	        const tinhThanhId = document.getElementById('editTenTinh').value;
	        document.getElementById('editTinhThanhId').value = tinhThanhId;
	    });
		
		function submitEdit() {
			const idQuanHuyen = document.getElementById('editQuanHuyenId').value;
			const tenQuanHuyen = document.getElementById('editTenQuanHuyen').value;
		    const idTinhThanh = document.getElementById('editTinhThanhId').value;
		    const editTenTinh = document.getElementById('editTenTinh').value;
		    
			let isValid = true;

			if (
				tenQuanHuyen === "" ||
				editTenTinh === ""
			) {
				toast({
					title: "Chú ý!",
					message: "Vui lòng điền đầy đủ thông tin!",
					type: "error",
					duration: 1000
				});
				isValid = false;
			}

			if (isValid) {
				const quanHuyenData = {
					idQuanHuyen: parseInt(idQuanHuyen),
					tenQuanHuyen: tenQuanHuyen,
					idTinhThanh: parseInt(idTinhThanh)
				};
				console.log("Dữ liệu quận huyện:", quanHuyenData);

				const url = new URL('http://localhost:8085/FutaBus_Backend/api/admin/update-quanhuyen');

				fetch(url, {
					method: 'POST',
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify(quanHuyenData)
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
						message: "Quận/Huyện đã được cập nhật.",
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
						message: "Không thể cập nhật quận huyện.",
						type: "error",
						duration: 1000
					});
				});
			}
		}
		
		function showDeleteModal(id) {
	        window.idCanXoa = id;

	        const overlay = document.getElementById("overlayDeleteModal");
	        overlay.style.display = "flex"; 

	        overlay.onclick = function (event) {
	            if (event.target === overlay) {
	                overlay.style.display = "none";
	            }
	        };

	        document.getElementById("confirmNo").onclick = function () {
	            overlay.style.display = "none";
	        };

	        document.getElementById("modalClose").onclick = function () {
	            overlay.style.display = "none";
	        };
	        
	        document.getElementById("confirmYes").onclick = function () {
	            const url = 'http://localhost:8085/FutaBus_Backend/api/admin/quanhuyen/xoa/' + id;

	            fetch(url, {
	            	method: 'PUT',
	            	headers: {
	            		"Content-Type": "application/json"
	            	}
	           	})
	            	  .then(response => {
	            	    if (!response.ok) {
	            	      return response.text().then(text => {
	            	        throw new Error("Lỗi từ server: " + text); 
	            	      });
	            	    }
	            	    return response.text(); 
	            	  })
	            	  .then(message => {
	            	    console.log("Xoá thành công:", message);
	            	    toast({
	            	      title: "Thành công!",
	            	      message: "Quận/Huyện đã được xoá.",
	            	      type: "success",
	            	      duration: 1000
	            	    });

	            	    setTimeout(() => {
	            	    	  window.location.reload();
	            	    }, 1000); 
	            	  })
	            	  .catch(error => {
	            	    console.error("Lỗi xoá:", error.message);
	            	    toast({
	            	      title: "Lỗi!",
	            	      message: "Không thể xoá quận/huyện.",
	            	      type: "error",
	            	      duration: 1000
	            	    });
	            });
	            overlay.style.display = "none"; 
	        };
	    }
		
		document.getElementById("searchInput").addEventListener("input", function () {
		    const keyword = this.value.toLowerCase();

		    const table = document.getElementById("table-quanhuyen");
		    const rows = table.querySelectorAll("tbody tr"); 

		    rows.forEach(row => {
		        const rowText = row.textContent.toLowerCase();
		        if (rowText.includes(keyword)) {
		            row.style.display = ""; 
		        } else {
		            row.style.display = "none"; 
		        }
		    });
		});
		
		document.getElementById("searchInput2").addEventListener("input", function () {
		    const keyword = this.value.toLowerCase();

		    const table = document.getElementById("table-tinh");
		    const rows = table.querySelectorAll("tbody tr"); 

		    rows.forEach(row => {
		        const rowText = row.textContent.toLowerCase();
		        if (rowText.includes(keyword)) {
		            row.style.display = ""; 
		        } else {
		            row.style.display = "none"; 
		        }
		    });
		});
		
		function showEditModal2(idTinhThanh, tenTinh) {
		    document.getElementById('editTinhThanhId').value = idTinhThanh;
		    document.getElementById('editTenTinh2').value = tenTinh;

		    const overlay = document.getElementById('overlayEditModal2');
		    overlay.style.display = 'flex';

		    overlay.onclick = function(event) {
		        if (event.target === overlay) {
		            overlay.style.display = 'none';
		        }
		    };
		}
		
		function submitEditTinh() {
			const idTinhThanh = document.getElementById('editTinhThanhId').value;
			const editTenTinh = document.getElementById('editTenTinh2').value;

			let isValid = true;

			if (editTenTinh === "") {
				toast({
					title: "Chú ý!",
					message: "Vui lòng chọn tỉnh/thành!",
					type: "error",
					duration: 1000
				});
				isValid = false;
			}

			if (isValid) {
				const tinhData = {
					idTinhThanh: parseInt(idTinhThanh),
					tenTinh: editTenTinh
				};

				console.log("Dữ liệu tỉnh/thành:", tinhData);

				const url = new URL('http://localhost:8085/FutaBus_Backend/api/admin/update-tinhthanh');

				fetch(url, {
					method: 'POST',
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify(tinhData)
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
					console.log("Cập nhật tỉnh thành thành công:", data);
					toast({
						title: "Thành công!",
						message: "Tỉnh thành đã được cập nhật.",
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
						message: "Không thể cập nhật tỉnh thành.",
						type: "error",
						duration: 1000
					});
				});
			}
		}
		
		function showDeleteModal2(id) {
	        window.idCanXoa = id;

	        const overlay = document.getElementById("overlayDeleteModal2");
	        overlay.style.display = "flex"; 

	        overlay.onclick = function (event) {
	            if (event.target === overlay) {
	                overlay.style.display = "none";
	            }
	        };

	        document.getElementById("confirmNo").onclick = function () {
	            overlay.style.display = "none";
	        };

	        document.getElementById("modalClose").onclick = function () {
	            overlay.style.display = "none";
	        };
	        
	        document.getElementById("confirmYes2").onclick = function () {
	            const url = 'http://localhost:8085/FutaBus_Backend/api/admin/tinhthanh/xoa/' + id;

	            fetch(url, {
	            	method: 'PUT',
	            	headers: {
	            		"Content-Type": "application/json"
	            	}
	           	})
	            	  .then(response => {
	            	    if (!response.ok) {
	            	      return response.text().then(text => {
	            	        throw new Error("Lỗi từ server: " + text); 
	            	      });
	            	    }
	            	    return response.text(); 
	            	  })
	            	  .then(message => {
	            	    console.log("Xoá thành công:", message);
	            	    toast({
	            	      title: "Thành công!",
	            	      message: "Tỉnh thành đã được xoá.",
	            	      type: "success",
	            	      duration: 1000
	            	    });

	            	    setTimeout(() => {
	            	    	  window.location.reload();
	            	    }, 1000); 
	            	  })
	            	  .catch(error => {
	            	    console.error("Lỗi xoá:", error.message);
	            	    toast({
	            	      title: "Lỗi!",
	            	      message: "Không thể xoá tỉnh thành.",
	            	      type: "error",
	            	      duration: 1000
	            	    });
	            });
	            overlay.style.display = "none"; 
	        };
	    }
		
		function showAddHuyenModal() {
			document.getElementById('addTenQuanHuyen').value = '';
			document.getElementById('addTinhThanhId').selectedIndex = 0;

			const overlay = document.getElementById('overlayAddHuyenModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}
		
		function showAddTinhModal() {
			document.getElementById('addTenTinhThanh').value = '';

			const overlay = document.getElementById('overlayAddTinhModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}
		
		function submitAddQuanHuyen() {
			const tenQuanHuyen = document.getElementById('addTenQuanHuyen').value.trim();
			const idTinhThanh = document.getElementById('addTinhThanhId').value;
			let isValid = true;
			
			console.log('tenQuanHuyen:', tenQuanHuyen);
			console.log('idTinhThanh:', idTinhThanh);

			if (tenQuanHuyen === "" || idTinhThanh === "") {
				toast({
					title: "Chú ý!",
					message: "Vui lòng điền đầy đủ thông tin!",
					type: "error",
					duration: 1500
				});
				isValid = false;
			}

			if (isValid) {
				const data = {
					tenQuanHuyen: tenQuanHuyen,
					tinhThanh: {
						idTinhThanh: idTinhThanh
					}
				};

				console.log('data:', data);

				const url = 'http://localhost:8085/FutaBus_Backend/api/admin/quanhuyen/them';

				fetch(url, {
					method: 'POST',
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify(data)
				})
				.then(response => {
					if (!response.ok) {
						return response.text().then(text => {
							throw new Error("Lỗi từ server: " + text);
						});
					}
					return response.text();
				})
				.then(message => {
					console.log("Thêm Quận/Huyện thành công:", message);
					toast({
						title: "Thành công!",
						message: "Quận/Huyện đã được thêm.",
						type: "success",
						duration: 1000
					});

					setTimeout(() => {
						window.location.reload();
					}, 1000);
				})
				.catch(error => {
					console.error("Lỗi thêm Quận/Huyện:", error.message);
					toast({
						title: "Lỗi!",
						message: "Không thể thêm Quận/Huyện.",
						type: "error",
						duration: 1500
					});
				});
			}
		}
		
		function submitAddTinhThanh() {
			const tenTinhThanh = document.getElementById('addTenTinhThanh').value.trim();
			let isValid = true;
			
			console.log('tenTinhThanh:', tenTinhThanh);

			if (tenTinhThanh === "") {
				toast({
					title: "Chú ý!",
					message: "Vui lòng nhập tên Tỉnh/Thành!",
					type: "error",
					duration: 1000
				});
				isValid = false;
			}

			if (isValid) {
				const data = {
					tenTinh: tenTinhThanh
				};

				console.log('data:', data);

				const url = 'http://localhost:8085/FutaBus_Backend/api/admin/tinhthanh/them';

				fetch(url, {
					method: 'POST',
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify(data)
				})
				.then(response => {
					if (!response.ok) {
						return response.text().then(text => {
							throw new Error("Lỗi từ server: " + text);
						});
					}
					return response.json();
				})
				.then(responseData => {
					if (responseData.success) {
						toast({
							title: "Thành công!",
							message: "Tỉnh/Thành đã được thêm.",
							type: "success",
							duration: 1000
						});
						setTimeout(() => {
							window.location.reload();
						}, 1000);
					} else {
						throw new Error(responseData.message || "Lỗi không xác định");
					}
				})
				.catch(error => {
					console.error("Lỗi thêm Tỉnh/Thành:", error.message);
					toast({
						title: "Lỗi!",
						message: "Không thể thêm Tỉnh/Thành.",
						type: "error",
						duration: 1500
					});
				});
			}
		}
		
		document.querySelector(".user-modal__item").addEventListener("click", function () {
		    window.location.href = "http://localhost:8086/FutaBus_Frontend/admin/account";
		});
		
		document.getElementById("logoutBtn").addEventListener("click", function () {
	        window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
	      });

	</script>

</body>
</html>