<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Lịch sử mua vé</title>
<%@ include file="../chatbox/chatbox.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/purchasehistory.css">
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
	
	<div id="overlayDeleteModal" class="overlay">
		<div id="confirmModal" class="modal delete-modal">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Xác nhận</h2>
					<span class="close" id="modalCloseCancel">&times;</span>
				</div>
				<div class="modal-body">
					<p class="title-question">Bạn có muốn huỷ vé không?</p>
				</div>
				<div class="modal-footer">
					<button id="confirmYesCancel" class="btn btn-yes">Có</button>
					<button id="confirmNoCancel" class="btn btn-no">Không</button>
				</div>
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
			<li><a href="http://localhost:8086/FutaBus_Frontend">TRANG CHỦ</a></li>
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
				<li><a
					href="http://localhost:8086/FutaBus_Frontend/general-information">
						<img
						src="<%=request.getContextPath()%>/assets/user/image/infor_user.svg"
						alt="profile" /> Thông tin tài khoản
				</a></li>
				<li class="active"><a
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
			<div class="header-row">
				<div>
					<h2>Lịch sử mua vé</h2>
					<p class="desc">Theo dõi và quản lý quá trình lịch sử mua vé
						của bạn</p>
				</div>
				<button class="btn-book">Đặt vé</button>
			</div>

			<div class="filter-section">
				<div class="filter-group">
					<label for="date">Thời gian</label> <input type="date" id="date">
				</div>

				<div class="filter-group">
					<label for="route">Tuyến đường</label>
					<div class="input-clearable">
						<input type="text" id="route"> <span
							class="clear-btn">×</span>
					</div>
				</div>

				<div class="filter-group">
					<label for="status">Trạng thái</label> <select class="status-filter" id="status">
						<option value="all">Tất cả</option>
						<option value="0">Đã hủy</option>
						<option value="1">Đã đặt</option>
						<option value="2">Chờ thanh toán</option>
						<option value="3">Đã thanh toán</option>
						<option value="4">Hoàn tất</option>
					</select>
				</div>

				<button class="btn-search">Tìm</button>
			</div>

			<table class="ticket-table" id="data-table">
				<thead>
					<tr>
						<th>Tuyến đường</th>
						<th>Ngày đi</th>
						<th>Số vé</th>
						<th>Số tiền</th>
						<th>Trạng thái</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
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
		
		const nutDatVe = document.querySelector(".btn-book");

		nutDatVe.addEventListener("click", () => {
	    	window.location.href = "http://localhost:8086/FutaBus_Frontend";
		});
	
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
			
			const url = 'http://localhost:8085/FutaBus_Backend/api/user/purchase-history/' + nguoiDung.idNguoiDung;
			
			fetch(url, {
		        method: 'GET',
		        headers: {
		            'Content-Type': 'application/json'
		        }
		    })
		    .then(response => response.json())
		    .then(data => {
		        console.log("✅ Dữ liệu lịch sử mua vé:", data);

		        if (data.success && Array.isArray(data.data)) {
		            const dsVe = data.data;
		            const tbody = document.querySelector(".ticket-table tbody");

		            tbody.innerHTML = "";

		            if (dsVe.length === 0) {
		                tbody.innerHTML = `
		                    <tr class="no-data">
		                        <td colspan="6">
		                            <div class="no-data-icon">📭</div>
		                            <div class="no-data-text">No Data</div>
		                        </td>
		                    </tr>`;
		                return;
		            }

		            dsVe.forEach(ve => {
		                const row = document.createElement("tr");
		                row.setAttribute("data-status", ve.trangThai);
		                const TRANG_THAI_VE = {
		                	    0: "Đã hủy",
		                	    1: "Đã đặt",
		                	    2: "Chờ thanh toán",
		                	    3: "Đã thanh toán",
		                	    4: "Hoàn tất"
		                	};

		                const tdTuyen = document.createElement("td");
		                tdTuyen.textContent = ve.tenTuyen;

		                const tdNgayDi = document.createElement("td");
		                tdNgayDi.textContent = new Date(ve.thoiDiemDi).toLocaleString("vi-VN");

		                const tdSoVe = document.createElement("td");
		                tdSoVe.textContent = ve.soLuongVe;

		                const tdSoTien = document.createElement("td");
		                tdSoTien.textContent = ve.tongTien.toLocaleString("vi-VN") + " đ";

		                const tdTrangThai = document.createElement("td");
		                tdTrangThai.textContent = TRANG_THAI_VE[ve.trangThai] || "Không rõ";

		                const tdHuy = document.createElement("td");
		                const buttonHuy = document.createElement("button");
		                buttonHuy.textContent = "Hủy";
		                buttonHuy.id = "btnHuyVe";
		                /*buttonHuy.onclick = function () {
		                    showDeleteModal(ve.idPhieuDatVe, ve.danhSachIDGhe);
		                };*/
		                buttonHuy.classList.add("btn-huy-ve");
		                buttonHuy.dataset.id = ve.idPhieuDatVe;
		                buttonHuy.dataset.ghe = JSON.stringify(ve.danhSachIDGhe);
		                
		                if (ve.trangThai !== 1) {
		                    buttonHuy.disabled = true;
		                    buttonHuy.classList.add("btn-disabled");
		                    buttonHuy.title = "Không thể hủy vé này";
		                }
		                
		                tdHuy.appendChild(buttonHuy);

		                row.appendChild(tdTuyen);
		                row.appendChild(tdNgayDi);
		                row.appendChild(tdSoVe);
		                row.appendChild(tdSoTien);
		                row.appendChild(tdTrangThai);
		                row.appendChild(tdHuy);

		                tbody.prepend(row);
		            });
		            
		            document.querySelectorAll(".btn-huy-ve").forEach(btn => {
		    		    btn.addEventListener("click", function () {
		    		        const id = this.dataset.id;
		    		        const danhSachGhe = JSON.parse(this.dataset.ghe);
		    		        showDeleteModal(id, danhSachGhe);
		    		    });
		    		});
		            
		            function showDeleteModal(id, danhSachIDGhe) {
		    	        window.idCanXoa = id;
		    	        
		    	        console.log("đã vào đâyy");
		    	        console.log("id: ", id);
		    	        console.log("danhSachIDGhe: ", danhSachIDGhe);
 
		    	        const modal = document.getElementById("confirmModal");
		    	        const overlay = document.getElementById("overlayDeleteModal");
		    	        
		    	        modal.classList.add("show");
		    	        overlay.style.display = "block";

		    	        modal.onclick = function (event) {
		    	            modal.classList.remove("show");
		    	            overlay.style.display = "none";
		    	        };

		    	        document.getElementById("confirmNoCancel").onclick = function () {
		    	        	modal.classList.remove("show");
		    	            overlay.style.display = "none";
		    	        };

		    	        document.getElementById("modalCloseCancel").onclick = function () {
		    	        	modal.classList.remove("show");
		    	            overlay.style.display = "none";
		    	        };
		    	        
		    	        document.getElementById("confirmYesCancel").onclick = function () {
		    	        	
		    	        	const idGheList = danhSachIDGhe.split(',').map(id => parseInt(id.trim()));
		    	        	
		    	        	console.log("id", id);
		    	        	console.log("danhSachIDGhe", danhSachIDGhe);
		    	        	console.log("idGheList", idGheList);
		    	        	
		    	        	const url = 'http://localhost:8085/FutaBus_Backend/api/admin/cancel-ve/' + id;

		    				fetch(url, {
		    					method: 'PUT',
		    					headers: {
		    						"Content-Type": "application/json"
		    					},
		    					body: JSON.stringify({
		    						trangThai: 0,
		    						idGheList: idGheList
		    					})
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
		    						message: "Vé xe huỷ thành công.",
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
		    	        };
		    	    }
		        } else {
		            console.error("❌ Không có dữ liệu hoặc lỗi:", data.message);
		        }
		    })
		    .catch(error => {
		        console.error("❌ Lỗi khi lấy dữ liệu lịch sử:", error.message);
		    });
		} else {
			console.log("Không tìm thấy người dùng trong localStorage");
		}

		function toggleModal() {
			var modal = document.getElementById("userModal");
			modal.classList.toggle("show");
		}

		function filterTable() {
			  const statusValue = document.getElementById("status").value;
			  const routeKeyword = document.getElementById("route").value.toLowerCase();
			  const selectedDate = document.getElementById("date").value;
			  const rows = document.querySelectorAll("#data-table tbody tr");

			  rows.forEach(row => {
			    const rowStatus = row.getAttribute("data-status");
			    const tenTuyen = row.cells[0].textContent.toLowerCase();
			    const rowDateText = row.cells[1].textContent; 

			    let matchDate = true;

			    if (selectedDate) {
			      const rowDate = parseVNDate(rowDateText);
			      const selectedDateObj = new Date(selectedDate);

			      if (!isNaN(rowDate.getTime())) {
			    	  matchDate =
			    		  rowDate.getDate() === selectedDateObj.getDate() &&
			    		  rowDate.getMonth() === selectedDateObj.getMonth() &&
			    		  rowDate.getFullYear() === selectedDateObj.getFullYear();
			      } else {
			        matchDate = false;
			      }
			    }

			    const matchStatus = (statusValue === "all") || (rowStatus === statusValue);
			    const matchRoute = tenTuyen.includes(routeKeyword);

			    row.style.display = (matchStatus && matchRoute && matchDate) ? "" : "none";
			  });
			}

		
		document.getElementById("status").addEventListener("change", filterTable);

		document.getElementById("route").addEventListener("input", filterTable);

		document.querySelector(".clear-btn").addEventListener("click", function () {
		  const input = document.getElementById("route");
		  input.value = "";
		  filterTable();
		});
		
		document.querySelector(".btn-search").addEventListener("click", function () {
			  filterTable();
		});
		
		function parseVNDate(dateStr) {
			  const parts = dateStr.trim().split(" ");
			  if (parts.length !== 2) return new Date(NaN);

			  const [timePart, datePart] = parts;
			  const [day, month, year] = datePart.split("/").map(Number);
			  const [hour, minute, second] = timePart.split(":").map(Number);

			  return new Date(year, month - 1, day, hour, minute, second);
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