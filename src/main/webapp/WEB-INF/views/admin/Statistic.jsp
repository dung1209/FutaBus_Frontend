<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Thống kê</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/admin/css/statistic.css">
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
				alt="location" /><span>Quản Lý địa điểm</span></a> <a
				href="<%=request.getContextPath()%>/admin/statistic" class="active"><img
				src="<%=request.getContextPath()%>/assets/admin/image/bill.png"
				alt="bill" class="active" /><span>Thống Kê</span></a> <a
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
				<div class="container">
					<h2>Biểu đồ doanh thu</h2>
					<div class="filter-bar">
						<label for="startDate">Từ ngày:</label> 
							<input id="startDate" type="date" name="startDate" class="form-control">
						<label for="endDate">Đến ngày:</label> 
							<input id="endDate" type="date" name="endDate" class="form-control">
						<button id="searchButton">Tìm kiếm</button>
					</div>
					<div class="chart-wrapper">
						<canvas id="revenueChart"></canvas>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
    	flatpickr("#startDate", {
    		dateFormat: "d/m/Y",
    		maxDate: "today",
    		onChange: function(selectedDates, dateStr, instance) {
    	        let returnDatePicker = document.getElementById("endDate")._flatpickr;
    	        returnDatePicker.set("minDate", dateStr); 
    	    }
    	});
    	flatpickr("#endDate", {
    		dateFormat: "d/m/Y",
    		maxDate: "today"
    	});
    </script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
		
		/*const labels = ${ngayList};
		const data = ${tongTienList};
		const ctx = document.getElementById('revenueChart').getContext('2d');

		new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: labels,
		    datasets: [{
		      label: 'Doanh thu (VNĐ)',
		      data: data,
		      borderColor: '#007bff',
		      backgroundColor: 'rgba(0,123,255,0.1)',
		      fill: true,
		      tension: 0.3,
		      pointBackgroundColor: '#007bff',
		      pointRadius: 5
		    }]
		  },
		  options: {
		    responsive: true,
		    plugins: {
		      tooltip: {
		        callbacks: {
		          label: function(context) {
		            return context.dataset.label + ': ' + context.formattedValue.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' VNĐ';
		          }
		        }
		      }
		    },
		    scales: {
		      y: {
		        beginAtZero: true,
		        ticks: {
		          callback: function(value) {
		            return value.toLocaleString('vi-VN') + ' VNĐ';
		          }
		        }
		      }
		    }
		  }
		});*/
		
		let revenueChart;
		const ctx = document.getElementById('revenueChart').getContext('2d');
		const initialLabels = ${ngayList};
		const initialData = ${tongTienList};

		revenueChart = new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: initialLabels,
		    datasets: [{
		      label: 'Doanh thu (VNĐ)',
		      data: initialData,
		      borderColor: '#007bff',
		      backgroundColor: 'rgba(0,123,255,0.1)',
		      fill: true,
		      tension: 0.3,
		      pointBackgroundColor: '#007bff',
		      pointRadius: 5
		    }]
		  },
		  options: {
		    responsive: true,
		    plugins: {
		      tooltip: {
		        callbacks: {
		          label: function(context) {
		            return context.dataset.label + ': ' + context.formattedValue.replace(/\B(?=(\d{3})+(?!\d))/g, ",") + ' VNĐ';
		          }
		        }
		      }
		    },
		    scales: {
		      y: {
		        beginAtZero: true,
		        ticks: {
		          callback: function(value) {
		            return value.toLocaleString('vi-VN') + ' VNĐ';
		          }
		        }
		      }
		    }
		  }
		});
		
		document.getElementById("searchButton").addEventListener("click", function () {
		    const startDate = document.getElementById("startDate").value;
		    const endDate = document.getElementById("endDate").value;
		    let isValid = true;

		    console.log("Từ ngày:", startDate);
		    console.log("Đến ngày:", endDate);
		    
		    if (!startDate || !endDate) {
		    	toast({
          	      title: "Chú ý!",
          	      message: "Vui lòng điền đầy đủ thông tin để tìm kiếm.",
          	      type: "error",
          	      duration: 1000
          	    });
		    	isValid = false;
		    }
		    
		    if (isValid) {
		    	const url = new URL("http://localhost:8085/FutaBus_Backend/api/admin/thongke");
		    	url.searchParams.append("startDate", startDate);
		    	url.searchParams.append("endDate", endDate);

		        fetch(url, {
		        	method: "GET",
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
		            return response.json();
		        })
		        .then(data => {
		            console.log("Dữ liệu doanh thu nhận được:", data);
		            
		            const newLabels = data.ngayList;
		            const newData = data.tongTienList;

		            revenueChart.data.labels = newLabels;
		            revenueChart.data.datasets[0].data = newData;

		            revenueChart.update();
		        })
		        .catch(error => {
		            console.error("Lỗi khi lấy dữ liệu doanh thu:", error.message);
		            toast({
		          	      title: "Lỗi!",
		          	      message: "Không thể lấy dữ liệu doanh thu.",
		          	      type: "error",
		          	      duration: 1000
		          	});
		        });
		    }
		});
	
		document.querySelector(".user-modal__item").addEventListener("click", function () {
		    window.location.href = "http://localhost:8086/FutaBus_Frontend/admin/account";
		});
		
		document.getElementById("logoutBtn").addEventListener("click", function () {
	        window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
	      });

	</script>

</body>
</html>