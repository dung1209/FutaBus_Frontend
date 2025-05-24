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
				<label>Biển số xe:</label><input type="text" id="modalBienSo"
					readonly> <label>Tên xe:</label><input type="text"
					id="modalTenXe" readonly> <label>Loại xe:</label><input
					type="text" id="modalTenLoaiXe" readonly> <label>Số
					ghế:</label><input type="text" id="modalSoGhe" readonly>
			</div>
			<div class="modal-footer">
				<button
					onclick="document.getElementById('overlayModal').style.display='none'">Đóng</button>
			</div>
		</div>
	</div>

	<div id="overlayEditModal" class="overlay" style="display: none;">
		<div id="editModal" class="modal">
			<h3>Chỉnh sửa xe</h3>
			<div class="form-detail form-edit">
				<label>Tên xe:</label> <input type="text" id="editTenXe"> <label>Biển
					số xe:</label> <input type="text" id="editBienSoXe"> <label>Loại
					xe:</label> <select id="editLoaiXe" name="editLoaiXe">
					<c:forEach var="loaiXe" items="${loaiXeList}">
						<option value="${loaiXe.idLoaiXe}"
							${loaiXe.idLoaiXe == idLoaiXe ? 'selected' : ''}>${loaiXe.tenLoai}</option>
					</c:forEach>
				</select> <input type="hidden" id="editXeId">
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
					<p class="title-question">Bạn có muốn xoá xe không?</p>
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
			<h3>Thêm xe</h3>
			<div class="form-detail form-add">
				<label>Tên xe:</label> <input type="text" id="addTenXe"> <label>Biển
					số xe:</label> <input type="text" id="addBienSoXe"> <label>Loại
					xe:</label> <select id="addLoaiXe" name="addLoaiXe">
					<c:forEach var="loaiXe" items="${loaiXeList}">
						<option value="${loaiXe.idLoaiXe}">${loaiXe.tenLoai}</option>
					</c:forEach>
				</select>
			</div>

			<div class="modal-footer">
				<button onclick="submitAdd()">Lưu</button>
				<button class="cancel-btn" onclick="closeAddModal()">Hủy</button>
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
				href="<%=request.getContextPath()%>/admin/bus" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-bus.png"
				alt="bus" class="active" /><span>Quản Lý Xe</span></a> <a
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
					<h2 id="title">Danh sách xe</h2>
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
						<button type="submit" class="btn-add-car" onclick="showAddModal()">+ Thêm xe</button>
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
									alt="update"
									onclick="showEditModal(
    									'${xe.idXe}',
    									'${xe.tenXe}',
        								'${xe.bienSo}', 
        								'${xe.loaiXe.idLoaiXe}')" />
									<img
									src="<%=request.getContextPath()%>/assets/admin/image/delete.png"
									alt="delete" onclick="showDeleteModal('${xe.idXe}')" /></td>
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

		function showDetailModal(bienSo, tenXe, tenLoaiXe, soGhe) {
			document.getElementById('modalBienSo').value = bienSo;
			document.getElementById('modalTenXe').value = tenXe;
			document.getElementById('modalTenLoaiXe').value = tenLoaiXe;
			document.getElementById('modalSoGhe').value = soGhe;

			const overlay = document.getElementById('overlayModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}

		function showEditModal(idXe, tenXe, bienSo, idLoaiXe) {
			document.getElementById('editXeId').value = idXe;
			document.getElementById('editTenXe').value = tenXe;
			document.getElementById('editBienSoXe').value = bienSo;
			document.getElementById('editLoaiXe').value = idLoaiXe;

			const overlay = document.getElementById('overlayEditModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}
		
		function submitEdit() {
			const idXe = document.getElementById('editXeId').value;
			const tenXe = document.getElementById('editTenXe').value;
		    const bienSo = document.getElementById('editBienSoXe').value;
		    const idLoaiXe = document.getElementById('editLoaiXe').value;
		    
			let isValid = true;

			if (
				tenXe === "" ||
				bienSo === "" ||
				idLoaiXe === ""
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
				const xeData = {
					idXe: parseInt(idXe),
					tenXe: tenXe,
					bienSo: bienSo,
					idLoaiXe: parseInt(idLoaiXe)
				};
				console.log("Dữ liệu chuyến xe:", xeData);

				const url = new URL('http://localhost:8085/FutaBus_Backend/api/admin/update-xe');

				fetch(url, {
					method: 'POST',
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify(xeData)
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
						message: "Chuyến xe đã được cập nhật.",
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
						message: "Không thể cập nhật chuyến xe.",
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
	            const url = 'http://localhost:8085/FutaBus_Backend/api/admin/xe/xoa/' + id;

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
	            	      message: "Xe đã được xoá.",
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
	            	      message: "Không thể xoá xe.",
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
		
		function showAddModal() {
			document.getElementById('addTenXe').value = '';
			document.getElementById('addBienSoXe').value = '';
			document.getElementById('addLoaiXe').selectedIndex = 0;

			const overlay = document.getElementById('overlayAddModal');
			overlay.style.display = 'flex';

			overlay.onclick = function(event) {
				if (event.target === overlay) {
					overlay.style.display = 'none';
				}
			};
		}
		
		function submitAdd() {
			const tenXe = document.getElementById('addTenXe').value;
			const bienSo = document.getElementById('addBienSoXe').value;
			const idLoaiXe = document.getElementById('addLoaiXe').value;
			let isValid = true;
			
			if (
				tenXe === "" ||
				bienSo === "" ||
				idLoaiXe === ""
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
				const data = {
					tenXe: tenXe,
					bienSo: bienSo,
					loaiXe: {
					    idLoaiXe: idLoaiXe
					},
				};
				console.log('data:', data);
				
				const url = 'http://localhost:8085/FutaBus_Backend/api/admin/xe/them';
				
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
					console.log("Thêm xe thành công:", message);
					toast({
						title: "Thành công!",
						message: "Xe đã được thêm vào.",
						type: "success",
						duration: 1000
					});

					setTimeout(() => {
						window.location.reload();
					}, 1000);
				})
				.catch(error => {
					console.error("Lỗi thêm xe:", error.message);
					toast({
						title: "Lỗi!",
						message: "Không thể thêm xe.",
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