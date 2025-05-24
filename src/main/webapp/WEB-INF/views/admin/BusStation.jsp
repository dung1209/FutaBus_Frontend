<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Bến xe</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/busstation.css">
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

</head>
<body>
	<div id="toast"></div>
	<div id="overlayModal" class="overlay" style="display: none;">
		<div id="detailModal" class="modal">
			<h3>Chi tiết bến xe</h3>
			<div class="form-detail">
				<label>Tên bến xe:</label> <input type="text" id="modalTenBenXe"
					readonly> <label>Địa chỉ:</label> <input type="text"
					id="modalDiaChi" readonly> <label>Số điện thoại:</label> <input
					type="text" id="modalSoDienThoai" readonly> <label>Quận/Huyện:</label>
				<input type="text" id="modalQuanHuyen" readonly> <label>Tỉnh/Thành:</label>
				<input type="text" id="modalTinhThanh" readonly>
			</div>
			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayModal').style.display='none'">Đóng</button>
			</div>
		</div>
	</div>

	<div id="overlayEditModal" class="overlay" style="display: none;">
		<div id="editModal" class="modal">
			<h3>Chỉnh sửa bến xe</h3>
			<div class="form-detail form-edit">
				<label>Tên bến xe:</label> <input type="text" id="editTenBenXe">

				<label>Địa chỉ:</label> <input type="text" id="editDiaChi">

				<label>Số điện thoại:</label> <input type="text"
					id="editSoDienThoai"> <label>Quận/Huyện:</label> <select
					id="editQuanHuyen" name="editQuanHuyen">
					<c:forEach var="quanHuyen" items="${quanHuyenList}">
						<option value="${quanHuyen.idQuanHuyen}"
							${quanHuyen.idQuanHuyen == idQuanHuyen ? 'selected' : ''}>
							${quanHuyen.tenQuanHuyen}</option>
					</c:forEach>
				</select> <input type="hidden" id="editQuanHuyenId"> <input
					type="hidden" id="editBenXeId">
			</div>

			<div class="modal-footer">
				<button onclick="submitEditBenXe()">Lưu</button>
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
					<p class="title-question">Bạn có muốn xoá bến xe không?</p>
				</div>
				<div class="modal-footer">
					<button id="confirmYes" class="btn btn-yes">Có</button>
					<button id="confirmNo" class="btn btn-no">Không</button>
				</div>
			</div>
		</div>
	</div>

	<div id="overlayAddModal" class="overlay" style="display: none;">
		<div id="addModal" class="modal">
			<h3>Thêm bến xe</h3>
			<div class="form-detail form-add">
				<label>Tên bến xe:</label> <input type="text" id="addTenBenXe">

				<label>Địa chỉ:</label> <input type="text" id="addDiaChi"> <label>Số
					điện thoại:</label> <input type="text" id="addSoDienThoai"> <label>Quận/Huyện:</label>
				<select id="addQuanHuyen" name="addQuanHuyen">
					<c:forEach var="quanHuyen" items="${quanHuyenList}">
						<option value="${quanHuyen.idQuanHuyen}">
							${quanHuyen.tenQuanHuyen}</option>
					</c:forEach>
				</select>
			</div>

			<div class="modal-footer">
				<button onclick="submitAddBenXe()">Lưu</button>
				<button class="cancel-btn"
					onclick="document.getElementById('overlayAddModal').style.display='none'">Hủy</button>
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
				href="<%=request.getContextPath()%>/admin/bus-station"
				class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-station.png"
				alt="station" class="active" /><span>Quản Lý Bến Xe</span></a> <a
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

			<div class="orders">
				<div class="orders__header">
					<h2 id="title">Danh sách bến xe</h2>
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
						<button type="submit" class="btn-add-trip"
							onclick="showAddBenXeModal()">+ Thêm bến xe</button>
					</div>
				</div>

				<table>
					<thead>
						<tr>
							<th>Bến xe</th>
							<th>Địa chỉ</th>
							<th>Số điện thoại</th>
							<th>Quận/Huyện</th>
							<th>Tỉnh thành</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="benxe" items="${benXeList}">
							<tr>
								<td>${benxe.tenBenXe}</td>
								<td>${benxe.diaChi}</td>
								<td>${benxe.soDienThoai}</td>
								<td>${benxe.quanHuyen.tenQuanHuyen}</td>
								<td>${benxe.quanHuyen.tinhThanh.tenTinh}</td>
								<td><img
									src="<%=request.getContextPath()%>/assets/admin/image/see.png"
									alt="detail"
									onclick="showDetailModal('${benxe.tenBenXe}', 
     									'${benxe.diaChi}', 
     									'${benxe.soDienThoai}', 
     									'${benxe.quanHuyen.tenQuanHuyen}', 
     									'${benxe.quanHuyen.tinhThanh.tenTinh}')" />
									<img
									src="<%=request.getContextPath()%>/assets/admin/image/update.png"
									alt="update"
									onclick="showEditModal(
										'${benxe.idBenXe}',
    									'${benxe.tenBenXe}',
    									'${benxe.diaChi}',
        								'${benxe.soDienThoai}', 
        								'${benxe.quanHuyen.idQuanHuyen}', 
        								'${benxe.quanHuyen.tenQuanHuyen}')" />
									<img
									src="<%=request.getContextPath()%>/assets/admin/image/delete.png"
									alt="delete" onclick="showDeleteModal('${benxe.idBenXe}')" /></td>
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
	
	function showDetailModal(tenBenXe, diaChi, soDienThoai, quanHuyen, tinhThanh) {
	    document.getElementById('modalTenBenXe').value = tenBenXe;
	    document.getElementById('modalDiaChi').value = diaChi;
	    document.getElementById('modalSoDienThoai').value = soDienThoai;
	    document.getElementById('modalQuanHuyen').value = quanHuyen;
	    document.getElementById('modalTinhThanh').value = tinhThanh;

	    const overlay = document.getElementById('overlayModal');
	    overlay.style.display = 'flex';

	    overlay.onclick = function (event) {
	        if (event.target === overlay) {
	            overlay.style.display = 'none';
	        }
	    };
	}
	
	function showEditModal(idBenXe, tenBenXe, diaChi, soDienThoai, idQuanHuyen, quanHuyen) {
		document.getElementById('editBenXeId').value = idBenXe;
	    document.getElementById('editTenBenXe').value = tenBenXe;
	    document.getElementById('editDiaChi').value = diaChi;
	    document.getElementById('editSoDienThoai').value = soDienThoai;
	    document.getElementById('editQuanHuyen').value = idQuanHuyen;
	    document.getElementById('editQuanHuyenId').value = idQuanHuyen;

	    const overlay = document.getElementById('overlayEditModal');
	    overlay.style.display = 'flex';

	    overlay.onclick = function (event) {
	        if (event.target === overlay) {
	            overlay.style.display = 'none';
	        }
	    };
	}
	
	document.getElementById('editQuanHuyen').addEventListener('change', function () {
	    const selectedId = this.value;
	    document.getElementById('editQuanHuyenId').value = selectedId;
	});
	
	function addSecondsIfNeeded(thoiDiem) {
	    if (!thoiDiem.includes(":")) {
	        return thoiDiem + ":00"; 
	    }
	    const parts = thoiDiem.split(" ");
	    const timeParts = parts[1].split(":");
	    if (timeParts.length === 2) {
	        return thoiDiem + ":00";  
	    }
	    return thoiDiem; 
	}
	
	function submitEditBenXe() {
		const idBenXe = document.getElementById('editBenXeId').value;
		const tenBenXe = document.getElementById('editTenBenXe').value;
	    const diaChi = document.getElementById('editDiaChi').value;
	    const soDienThoai = document.getElementById('editSoDienThoai').value;
	    const idQuanHuyen = document.getElementById('editQuanHuyen').value;
	    
		let isValid = true;

		if (!tenBenXe || !diaChi || !soDienThoai || !idQuanHuyen) {
			toast({
				title: "Chú ý!",
				message: "Vui lòng điền đầy đủ thông tin!",
				type: "error",
				duration: 2000
			});
			isValid = false;
		}

		if (isValid) {
			const benXeData = {
				idBenXe: idBenXe,
				tenBenXe: tenBenXe,
				diaChi: diaChi,
				soDienThoai: soDienThoai,
				quanHuyen: { idQuanHuyen: parseInt(idQuanHuyen) }
			};

			console.log("Dữ liệu bến xe:", benXeData);

			const url = new URL('http://localhost:8085/FutaBus_Backend/api/admin/update-benxe');

			fetch(url, {
				method: 'POST',
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify(benXeData)
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
					message: "Bến xe đã được cập nhật.",
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
					message: "Không thể cập nhật bến xe.",
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
            const url = 'http://localhost:8085/FutaBus_Backend/api/admin/benxe/xoa/' + id;

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
            	      message: "Bến xe đã được xoá.",
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
            	      message: "Không thể xoá bến xe.",
            	      type: "error",
            	      duration: 1000
            	    });
            });
            overlay.style.display = "none"; 
        };
    }
	
	document.getElementById("searchInput").addEventListener("input", function () {
        const keyword = this.value.toLowerCase();
        const rows = document.querySelectorAll("table tbody tr");

        rows.forEach(row => {
          const rowText = row.textContent.toLowerCase();
          if (rowText.includes(keyword)) {
            row.style.display = ""; 
          } else {
            row.style.display = "none"; 
          }
        });
      });
	
	function showAddBenXeModal() {
	    document.getElementById('addTenBenXe').value = '';
	    document.getElementById('addDiaChi').value = '';
	    document.getElementById('addSoDienThoai').value = '';
	    document.getElementById('addQuanHuyen').selectedIndex = 0;

	    const overlay = document.getElementById('overlayAddModal');
	    overlay.style.display = 'flex';

	    overlay.onclick = function (event) {
	        if (event.target === overlay) {
	            overlay.style.display = 'none';
	        }
	    };
	}
	
	function submitAddBenXe() {
		const tenBenXe = document.getElementById("addTenBenXe").value.trim();
		const diaChi = document.getElementById("addDiaChi").value.trim();
		const soDienThoai = document.getElementById("addSoDienThoai").value.trim();
		const quanHuyenId = document.getElementById("addQuanHuyen").value;

		if (tenBenXe === "" || diaChi === "" || soDienThoai === "" || quanHuyenId === "") {
		    toast({
		        title: "Chú ý!",
		        message: "Vui lòng điền đầy đủ thông tin!",
		        type: "error",
		        duration: 2000
		    });
		    return;
		}

		const sdtRegex = /^(0|\+84)[0-9]{9}$/;
		if (!sdtRegex.test(soDienThoai)) {
		    toast({
		        title: "Lỗi!",
		        message: "Số điện thoại không hợp lệ!",
		        type: "error",
		        duration: 2000
		    });
		    return;
		}

		const data = {
		    tenBenXe: tenBenXe,
		    diaChi: diaChi,
		    soDienThoai: soDienThoai,
		    quanHuyen: {
		        idQuanHuyen: parseInt(quanHuyenId)
		    }
		};

		console.log("data:", data);

		const url = 'http://localhost:8085/FutaBus_Backend/api/admin/benxe/them';

		fetch(url, {
		    method: "POST",
		    headers: {
		        "Content-Type": "application/json"
		    },
		    body: JSON.stringify(data)
		})
		.then(response => {
		    if (!response.ok) {
		        return response.text().then(text => { throw new Error(text) });
		    }
		    return response.json();
		})
		.then(result => {
		    if (result.success) {
		        toast({
		            title: "Thành công!",
		            message: "Thêm bến xe thành công.",
		            type: "success",
		            duration: 1000
		        });
		        setTimeout(() => {
		            window.location.reload();
		        }, 1000);
		    } else {
		        toast({
		            title: "Thất bại!",
		            message: "Không thể thêm bến xe!",
		            type: "error",
		            duration: 1000
		        });
		    }
		})
		.catch(error => {
		    console.error("Lỗi khi gửi yêu cầu:", error);
		    toast({
		        title: "Lỗi!",
		        message: "Đã xảy ra lỗi khi thêm bến xe!",
		        type: "error",
		        duration: 1000
		    });
		});
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