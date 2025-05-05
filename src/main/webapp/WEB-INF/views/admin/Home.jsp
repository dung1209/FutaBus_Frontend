<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Trang chủ Admin</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/home.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
	
</head>
<body>
	<div id="toast"></div>
	<div id="overlayModal" class="overlay" style="display: none;">
    	<div id="detailModal" class="modal">
        	<h3>Chi tiết người dùng</h3>
        		<div class="form-detail">
            	<label>Họ và tên:</label><input type="text" id="modalHoTen" readonly>
            	<label>Giới tính:</label><input type="text" id="modalGioiTinh" readonly>
            	<label>Năm sinh:</label><input type="text" id="modalNamSinh" readonly>
            	<label>Số điện thoại:</label><input type="text" id="modalSoDienThoai" readonly>
            	<label>Email:</label><input type="text" id="modalEmail" readonly>
            	<label>Địa chỉ:</label><input type="text" id="modalDiaChi" readonly>
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
				<label>Giới tính:</label>
				<select id="editGioiTinh">
  					<option value="false">Nam</option>
  					<option value="true">Nữ</option>
				</select>
				<label>Năm sinh:</label><input type="text" id="editNamSinh">
				<label>Số điện thoại:</label><input type="text" id="editSoDienThoai">
				<label>Email:</label><input type="text" id="editEmail" readonly> <label>Địa
					chỉ:</label><input type="text" id="editDiaChi">
				<input type="hidden" id="editUserId">
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
			<a href="<%=request.getContextPath()%>/admin?loaiNguoiDung=1"
				class="active menu-parent" id="dashboardParent"><img
				src="<%=request.getContextPath()%>/assets/admin/image/user.png"
				alt="user" class="active" /><span>Người Dùng</span><img
				src="<%=request.getContextPath()%>/assets/admin/image/down-arrow.png"
				alt="down" class="arrow active" /></a>
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
				href="<%=request.getContextPath()%>/admin/bus"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bus-bus.png"
				alt="bus" /><span>Quản Lý Xe</span></a> <a
				href="<%=request.getContextPath()%>/admin/location"><img
				src="<%=request.getContextPath()%>/assets/admin/image/buildings.png"
				alt="location" /><span>Quản Lý địa điểm</span></a> <a href="<%=request.getContextPath()%>/admin/statistic"><img
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
					<h2 id="title">Danh sách khách hàng</h2>
					<div class="orders__actions">
						<div class="search-box">
							<input type="text" id="searchInput" placeholder="Nhập từ khoá để tìm kiếm..." />
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
							<th>Họ tên</th>
							<th>Tuổi</th>
							<th>Giới tính</th>
							<th>Địa chỉ</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nguoiDung" items="${nguoiDungList}">
							<tr>
								<td>${nguoiDung.hoTen}</td>
								<td>${nguoiDung.namSinh}</td>
								<td>${nguoiDung.gioiTinh ? 'Nữ' : 'Nam'}</td>
								<td>${nguoiDung.diaChi}</td>
								<td>${nguoiDung.soDienThoai}</td>
								<td>${nguoiDung.email}</td>
								<td>
									<img src="<%=request.getContextPath()%>/assets/admin/image/see.png"
     									alt="detail"
     									onclick="showDetailModal('${nguoiDung.hoTen}', 
     									'${nguoiDung.gioiTinh ? 'Nữ' : 'Nam'}', 
     									'${nguoiDung.namSinh}', 
     									'${nguoiDung.soDienThoai}', 
     									'${nguoiDung.email}', 
     									'${nguoiDung.diaChi}')"/>
									<img src="<%=request.getContextPath()%>/assets/admin/image/update.png"
    									alt="update"
    									onclick="showEditModal(
    									'${nguoiDung.idNguoiDung}',
        								'${nguoiDung.hoTen}', 
        								'${nguoiDung.gioiTinh ? 'true' : 'false'}', 
        								'${nguoiDung.namSinh}', 
        								'${nguoiDung.soDienThoai}', 
        								'${nguoiDung.email}', 
        								'${nguoiDung.diaChi}')"/> 
									<img src="<%=request.getContextPath()%>/assets/admin/image/delete.png"
  										alt="delete"
  										onclick="showDeleteModal('${nguoiDung.idNguoiDung}')"/>
								</td>
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

		    let loaiNguoiDung = getParameterByName("loaiNguoiDung") || 1;
		    
		    let titleElement = document.getElementById("title");
		      let customerLink = document.getElementById("customer-link"); 
		      let staffLink = document.getElementById("staff-link"); 
		      

		      if (loaiNguoiDung === "2") {
		          titleElement.textContent = "Danh sách quản trị viên";
		          staffLink.style.backgroundColor = "#ecf3ff";
		          customerLink.style.backgroundColor = ""; 
		      } else {
		          titleElement.textContent = "Danh sách khách hàng";
		          customerLink.style.backgroundColor = "#ecf3ff";
		          staffLink.style.backgroundColor = "";
		      }
		    
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
	    
	    function showDetailModal(hoTen, gioiTinh, namSinh, soDienThoai, email, diaChi) {
	        document.getElementById('modalHoTen').value = hoTen;
	        document.getElementById('modalGioiTinh').value = gioiTinh;
	        document.getElementById('modalNamSinh').value = namSinh;
	        document.getElementById('modalSoDienThoai').value = soDienThoai;
	        document.getElementById('modalEmail').value = email;
	        document.getElementById('modalDiaChi').value = diaChi;

	        const overlay = document.getElementById('overlayModal');
	        overlay.style.display = 'flex';

	        overlay.onclick = function(event) {
	            if (event.target === overlay) {
	                overlay.style.display = 'none';
	            }
	        };
	    }
	    
	    function showEditModal(id, hoTen, gioiTinh, namSinh, soDienThoai, email, diaChi) {
	        document.getElementById('editHoTen').value = hoTen;
	        document.getElementById('editGioiTinh').value = gioiTinh;
	        document.getElementById('editNamSinh').value = namSinh;
	        document.getElementById('editSoDienThoai').value = soDienThoai;
	        document.getElementById('editEmail').value = email;
	        document.getElementById('editDiaChi').value = diaChi;
	        document.getElementById("editUserId").value = id;

	        const overlay = document.getElementById('overlayEditModal');
	        overlay.style.display = 'flex';

	        overlay.onclick = function (event) {
	            if (event.target === overlay) {
	                overlay.style.display = 'none';
	            }
	        };
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
	            console.log("Xoá người dùng:", window.idCanXoa);
	            console.log("Xoá người dùng2:", id);
	            
	            const url = 'http://localhost:8085/FutaBus_Backend/api/admin/nguoidung/xoa/' + id;

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
	            	      message: "Người dùng đã được xoá.",
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
	            	      message: "Không thể xoá người dùng.",
	            	      type: "error",
	            	      duration: 1000
	            	    });
	            });
	            overlay.style.display = "none"; 
	        };
	    }

	    function submitEdit() {
	    	const id = document.getElementById('editUserId').value;
	        const hoTen = document.getElementById('editHoTen').value;
	        const gioiTinh = document.getElementById('editGioiTinh').value;
	        const namSinh = document.getElementById('editNamSinh').value;
	        const soDienThoai = document.getElementById('editSoDienThoai').value;
	        const email = document.getElementById('editEmail').value;
	        const diaChi = document.getElementById('editDiaChi').value;
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
				const gender = document.getElementById("editGioiTinh").value === "true";
				
				console.log("Đã sửa:", id, hoTen, gioiTinh, namSinh, soDienThoai, email, diaChi);

				const nguoiDungData = {
						  idNguoiDung: id,
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
					  
					  window.location.reload();
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
	</script>

</body>
</html>