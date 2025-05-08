<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Đặt vé xe</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/booktickets.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				width="26" style="margin: 0 10px" alt="download app icon"> <a href="javascript:void(0)"
				class="gap-3 cursor-pointer" id="userGreeting" onclick="redirectToLogin()"> Đăng nhập/Đăng ký </a>
		</div>
		
		<div class="user-modal" id="userModal">
			<div class="user-modal__content">
				<div class="user-modal__item">
					<a href="http://localhost:8086/FutaBus_Frontend/general-information">
        				<img src="<%=request.getContextPath()%>/assets/user/image/infor_user.svg" alt="profile" /> Thông tin tài khoản
    				</a>
				</div>
				<div class="user-modal__item">
    				<a href="http://localhost:8086/FutaBus_Frontend/purchase-history">
        				<img src="<%=request.getContextPath()%>/assets/user/image/history.svg" alt="profile" /> Lịch sử mua vé
    				</a>
				</div>
				<div class="user-modal__item">
    				<a href="http://localhost:8086/FutaBus_Frontend/reset-password">
        				<img src="<%=request.getContextPath()%>/assets/user/image/change_password.svg" alt="profile" /> Đặt lại mật khẩu
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
		<div class="flex h-10 cursor-pointer items-center px-6">Quay lại</div>
		<div class="content">
			<p>${departure} - ${destination}</p>
			<p id="departInfo">${weekday}, ${departureDate}</p>
		</div>
	</nav>

	<div class="filter-container">
		<div class="filter-section">
			<div class="filter-header">
				<h5>Chọn ghế</h5>
				<div class="filter-actions">
					<button class="reset-filter">Thông tin xe</button>
				</div>
			</div>
			
			<div class="center-text" style="display: none;">Chuyến đi</div>

			<div class="seating-list">
				<div class="filter-group">
					<label>Tầng dưới</label>
					<div class="filter-options">
						<table>
							<tbody>
								<tr class="flex items-center gap-1 justify-between">
									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangDuoiList[0].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangDuoiList[0].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangDuoiList[0].idViTriGhe}" onclick="selectSeat(this)">
												<span class="absolute seat-label">${viTriGheTangDuoiList[0].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>

									<td style="position: relative; width: 24px;"></td>
									<td style="position: relative;"></td>
									<td style="position: relative; width: 24px;"></td>

									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangDuoiList[1].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangDuoiList[1].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangDuoiList[1].idViTriGhe}" onclick="selectSeat(this)">
												<span class="absolute seat-label">${viTriGheTangDuoiList[1].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<c:forEach var="seat" items="${viTriGheTangDuoiList}"
									varStatus="status">
									<c:if test="${status.index >= 2}">
										<c:if test="${(status.index - 2) % 3 == 0}">
											<tr>
										</c:if>

										<td class="relative"><c:choose>
												<c:when test="${seat.trangThai == 1}">
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
														alt="seat icon">
													<span class="absolute">${seat.tenViTri}</span>
												</c:when>
												<c:otherwise>
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
														alt="seat icon" data-id="${seat.idViTriGhe}" onclick="selectSeat(this)">
													<span class="absolute seat-label">${seat.tenViTri}</span>
												</c:otherwise>
											</c:choose></td>

										<c:if test="${(status.index - 2) % 3 != 2}">
											<td style="width: 24px;"></td>
										</c:if>

										<c:if
											test="${(status.index - 2) % 3 == 2 || status.index == fn:length(viTriGheTangDuoiList) - 1}">
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="filter-group">
					<label>Tầng trên</label>
					<div class="filter-options">
						<table>
							<tbody>
								<tr class="flex items-center gap-1 justify-between">
									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangTrenList[0].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangTrenList[0].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangTrenList[0].idViTriGhe}" onclick="selectSeat(this)">
												<span class="absolute seat-label">${viTriGheTangTrenList[0].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>

									<td style="position: relative; width: 24px;"></td>
									<td style="position: relative;"></td>
									<td style="position: relative; width: 24px;"></td>

									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangTrenList[1].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangTrenList[1].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangTrenList[1].idViTriGhe}" onclick="selectSeat(this)">
												<span class="absolute seat-label">${viTriGheTangTrenList[1].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<c:forEach var="seat" items="${viTriGheTangTrenList}"
									varStatus="status">
									<c:if test="${status.index >= 2}">
										<c:if test="${(status.index - 2) % 3 == 0}">
											<tr>
										</c:if>

										<td class="relative"><c:choose>
												<c:when test="${seat.trangThai == 1}">
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
														alt="seat icon">
													<span class="absolute">${seat.tenViTri}</span>
												</c:when>
												<c:otherwise>
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
														alt="seat icon" data-id="${seat.idViTriGhe}" onclick="selectSeat(this)">
													<span class="absolute seat-label">${seat.tenViTri}</span>
												</c:otherwise>
											</c:choose></td>

										<c:if test="${(status.index - 2) % 3 != 2}">
											<td style="width: 24px;"></td>
										</c:if>

										<c:if
											test="${(status.index - 2) % 3 == 2 || status.index == fn:length(viTriGheTangDuoiList) - 1}">
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="filter-group">
					<div class="filter-options">
						<span class="sold"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
							width="22" height="22" alt="seat_disabled">Đã bán</span> <span
							class="vacant"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
							width="22" height="22" alt="seat_active">Còn trống</span> <span
							class="selecting"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_selecting.svg"
							width="22" height="22" alt="seat_selecting">Đang chọn</span>
					</div>
				</div>
			</div>
			
			<div class="divide"  style="display: none;"></div>
			
			<div class="center-text-return" style="display: none;">Chuyến về</div>

			<div class="seating-list" style="display: none;">
				<div class="filter-group">
					<label>Tầng dưới</label>
					<div class="filter-options">
						<table>
							<tbody>
								<tr class="flex items-center gap-1 justify-between">
									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangDuoiReturnList[0].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangDuoiReturnList[0].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangDuoiReturnList[0].idViTriGhe}" onclick="selectSeatReturn(this)">
												<span class="absolute seat-label">${viTriGheTangDuoiReturnList[0].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>

									<td style="position: relative; width: 24px;"></td>
									<td style="position: relative;"></td>
									<td style="position: relative; width: 24px;"></td>

									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangDuoiReturnList[1].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangDuoiReturnList[1].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangDuoiReturnList[1].idViTriGhe}" onclick="selectSeatReturn(this)">
												<span class="absolute seat-label">${viTriGheTangDuoiReturnList[1].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<c:forEach var="seat" items="${viTriGheTangDuoiReturnList}"
									varStatus="status">
									<c:if test="${status.index >= 2}">
										<c:if test="${(status.index - 2) % 3 == 0}">
											<tr>
										</c:if>

										<td class="relative"><c:choose>
												<c:when test="${seat.trangThai == 1}">
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
														alt="seat icon">
													<span class="absolute">${seat.tenViTri}</span>
												</c:when>
												<c:otherwise>
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
														alt="seat icon" data-id="${seat.idViTriGhe}" onclick="selectSeatReturn(this)">
													<span class="absolute seat-label">${seat.tenViTri}</span>
												</c:otherwise>
											</c:choose></td>

										<c:if test="${(status.index - 2) % 3 != 2}">
											<td style="width: 24px;"></td>
										</c:if>

										<c:if
											test="${(status.index - 2) % 3 == 2 || status.index == fn:length(viTriGheTangDuoiReturnList) - 1}">
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="filter-group">
					<label>Tầng trên</label>
					<div class="filter-options">
						<table>
							<tbody>
								<tr class="flex items-center gap-1 justify-between">
									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangTrenReturnList[0].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangTrenReturnList[0].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangTrenReturnList[0].idViTriGhe}" onclick="selectSeatReturn(this)">
												<span class="absolute seat-label">${viTriGheTangTrenReturnList[0].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>

									<td style="position: relative; width: 24px;"></td>
									<td style="position: relative;"></td>
									<td style="position: relative; width: 24px;"></td>

									<td class="relative"><c:choose>
											<c:when test="${viTriGheTangTrenReturnList[1].trangThai == 1}">
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
													alt="seat icon">
												<span class="absolute">${viTriGheTangTrenReturnList[1].tenViTri}</span>
											</c:when>
											<c:otherwise>
												<img width="32"
													src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
													alt="seat icon" data-id="${viTriGheTangTrenReturnList[1].idViTriGhe}" onclick="selectSeatReturn(this)">
												<span class="absolute seat-label">${viTriGheTangTrenReturnList[1].tenViTri}</span>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<c:forEach var="seat" items="${viTriGheTangTrenReturnList}"
									varStatus="status">
									<c:if test="${status.index >= 2}">
										<c:if test="${(status.index - 2) % 3 == 0}">
											<tr>
										</c:if>

										<td class="relative"><c:choose>
												<c:when test="${seat.trangThai == 1}">
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
														alt="seat icon">
													<span class="absolute">${seat.tenViTri}</span>
												</c:when>
												<c:otherwise>
													<img width="32"
														src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
														alt="seat icon" data-id="${seat.idViTriGhe}" onclick="selectSeatReturn(this)">
													<span class="absolute seat-label">${seat.tenViTri}</span>
												</c:otherwise>
											</c:choose></td>

										<c:if test="${(status.index - 2) % 3 != 2}">
											<td style="width: 24px;"></td>
										</c:if>

										<c:if
											test="${(status.index - 2) % 3 == 2 || status.index == fn:length(viTriGheTangDuoiReturnList) - 1}">
											</tr>
										</c:if>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="filter-group">
					<div class="filter-options">
						<span class="sold"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_disabled.svg"
							width="22" height="22" alt="seat_disabled">Đã bán</span> <span
							class="vacant"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_active.svg"
							width="22" height="22" alt="seat_active">Còn trống</span> <span
							class="selecting"><img
							src="<%=request.getContextPath()%>/assets/user/image/seat_selecting.svg"
							width="22" height="22" alt="seat_selecting">Đang chọn</span>
					</div>
				</div>
			</div>

			<div class="divide"></div>

			<div class="customer-info">
				<h2>Thông tin khách hàng</h2>
				<form class="customer-form">
					<div class="form-group">
						<label for="name">Họ và tên <span class="required">*</span></label>
						<input type="text" id="name" name="name"
							placeholder="Nhập họ và tên">
					</div>
					<div class="form-group">
						<label for="phone">Số điện thoại <span class="required">*</span></label>
						<input type="text" id="phone" name="phone"
							placeholder="Nhập số điện thoại">
					</div>
					<div class="form-group">
						<label for="email">Email <span class="required">*</span></label> <input
							type="email" id="email" name="email" placeholder="Nhập email">
					</div>
					<div class="terms">
						<input type="checkbox" id="accept-terms" name="accept-terms">
						<label for="accept-terms"> Chấp nhận điều khoản đặt vé &
							chính sách bảo mật thông tin của FUTA Bus Lines </label>
					</div>
				</form>
				<div class="notes">
					<h3>ĐIỀU KHOẢN & LƯU Ý</h3>
					<p>
						(*) Quý khách vui lòng có mặt tại bến xuất phát của xe trước ít
						nhất 30 phút giờ xe khởi hành, mang theo thông báo đã thanh toán
						vé thành công có chứa mã vé được gửi từ hệ thống FUTA BUS LINES.
						Vui lòng liên hệ Trung tâm tổng đài <strong>1900 6067</strong> để
						được hỗ trợ.
					</p>
					<p>
						(*) Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ Tổng
						đài trung chuyển <strong>1900 6918</strong> trước khi đặt vé.
						Chúng tôi không đón/trung chuyển tại những điểm xe trung chuyển
						không thể tới được.
					</p>
				</div>
			</div>

			<div class="divide"></div>

			<div class="button-action">
				<button class="btn-cancel">Huỷ</button>
				<button class="btn-select" id="submit-button">Thanh toán</button>
			</div>
		</div>

		<div class="result-section">
			<div class="infor">
				<div class="departure-information">
					<p class="item">Thông tin lượt đi</p>
					<div class="trip-information">
						<span class="title">Tuyến xe</span><span class="road">${start}
							- ${end}</span>
					</div>
					<div class="trip-information">
						<span class="title">Thời gian xuất bến</span><span class="time">${formattedStartTime}</span>
					</div>
					<div class="trip-information">
						<span class="title">Số lượng ghế</span><span class="number">0
							Ghế</span>
					</div>
					<div class="trip-information">
						<span class="title">Số ghế</span><span class="seat"></span>
					</div>
					<div class="trip-information">
						<span class="title">Tổng tiền lượt đi</span><span class="price">0đ</span>
					</div>
				</div>
				
				<div class="destination-information"  style="display: none;">
					<p class="item">Thông tin lượt về</p>
					<div class="trip-information">
						<span class="title">Tuyến xe</span><span class="road">${end} - ${start}</span>
					</div>
					<div class="trip-information">
						<span class="title">Thời gian xuất bến</span><span class="time">${formattedStartTimeReturn}</span>
					</div>
					<div class="trip-information">
						<span class="title">Số lượng ghế</span><span class="number-return">0
							Ghế</span>
					</div>
					<div class="trip-information">
						<span class="title">Số ghế</span><span class="seat-return"></span>
					</div>
					<div class="trip-information">
						<span class="title">Tổng tiền lượt đi</span><span class="price-return">0đ</span>
					</div>
				</div>

				<div class="price-information">
					<p class="item">Chi tiết giá</p>
					<div class="price-infor">
						<span class="title">Giá vé lượt đi</span><span
							class="ticket-price">0đ</span>
					</div>
					<div class="price-infor"  style="display: none;">
						<span class="title">Giá vé lượt về</span><span
							class="ticket-price-return">0đ</span>
					</div>
					<div class="price-infor">
						<span class="title">Phí thanh toán</span><span class="fee">0đ</span>
					</div>

					<div class="divide"></div>

					<div class="price-infor">
						<span class="title">Tổng tiền</span><span class="total">0đ</span>
					</div>
				</div>

			</div>
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

	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
		flatpickr("#myID", {
			dateFormat : "d/m/Y",
		});
	</script>

	<script>
	document.getElementById("logoutBtn").addEventListener("click", function () {
		const modal = document.getElementById("confirmLogoutModal");
	    
	    modal.classList.add("show");

	    modal.onclick = function (event) {
	        modal.classList.remove("show");
	    };

	    document.getElementById("confirmNo").onclick = function () {
	    	modal.classList.remove("show");
	    };

	    document.getElementById("modalClose").onclick = function () {
	    	modal.classList.remove("show");
	    };
	    
	    document.getElementById("confirmYes").addEventListener("click", function () {
		    localStorage.removeItem("nguoiDung");
		    window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
		});
    });
	
	let selectedSeatsCount = 0;
	const maxSeats = 5;
	let selectedSeats = [];
	let totalPrice = 0;
	let selectedSeatIds = [];
	let idTrip = "${idTrip}";
	
	let selectedSeatsCountReturn = 0;
	const maxSeatsReturn = 5;
	let selectedSeatsReturn = [];
	let selectedSeatIdsReturn = [];
	let totalPriceReturn = 0;
	
	function selectSeat(imageElement) {
	    const parentElement = imageElement.parentElement;
	    const spanElement = parentElement.querySelector('.seat-label');
	    const seatName = spanElement.textContent;
	    const seatId = imageElement.getAttribute('data-id');
	    const seatActiveSrc = "<%=request.getContextPath()%>/assets/user/image/seat_active.svg";
	    const seatSelectingSrc = "<%=request.getContextPath()%>/assets/user/image/seat_selecting.svg";

	    if (imageElement.src.includes("seat_active.svg")) {
	    	if (selectedSeatsCount >= maxSeats) {
	    		toast({
	                title: "Chú ý!",
	                message: "Đã chọn đủ số ghế cho lượt đi.",
	                type: "error",
	                duration: 1000
	            });
	            return;
	        }
	    	selectedSeats.push(seatName);
	    	selectedSeatIds.push(seatId);
	        imageElement.src = seatSelectingSrc;
	        spanElement.style.color = "#ef5222"; 
	        selectedSeatsCount++;
	        let seatsText = String(selectedSeatsCount).concat(" Ghế");
	        let totalPrice = selectedSeatsCount * ${price};
	        let formattedTotalPrice = totalPrice.toLocaleString('vi-VN');
	        let totalPriceText = String(formattedTotalPrice).concat("đ");
	        
	        document.querySelector('.number').innerHTML = seatsText;
	        document.querySelector('.seat').textContent = selectedSeats.join(', ');
	        document.querySelector('.price').innerHTML = totalPriceText;
	        document.querySelector('.ticket-price').innerHTML = totalPriceText;
	        document.querySelector('.total').innerHTML = totalPriceText;
	    } else if (imageElement.src.includes("seat_selecting.svg")) {
	    	const index = selectedSeats.indexOf(seatName);
	        if (index !== -1) {
	            selectedSeats.splice(index, 1);
	            selectedSeatIds.splice(index, 1);
	        }
	        imageElement.src = seatActiveSrc; 
	        spanElement.style.color = ""; 
	        selectedSeatsCount--;
	        let seatsText = String(selectedSeatsCount).concat(" Ghế");
	        let totalPrice = selectedSeatsCount * ${price};
	        let formattedTotalPrice = totalPrice.toLocaleString('vi-VN');
	        let totalPriceText = String(formattedTotalPrice).concat("đ");
	        
	        document.querySelector('.number').innerHTML = seatsText;
	        document.querySelector('.seat').textContent = selectedSeats.join(', ');
	        document.querySelector('.price').innerHTML = totalPriceText;
	        document.querySelector('.ticket-price').innerHTML = totalPriceText;
	        document.querySelector('.total').innerHTML = totalPriceText;
	    }
	}
	
	function selectSeatReturn(imageElement) {
	    const parentElement = imageElement.parentElement;
	    const spanElement = parentElement.querySelector('.seat-label');
	    const seatName = spanElement.textContent;
	    const seatId = imageElement.getAttribute('data-id');
	    const seatActiveSrc = "<%=request.getContextPath()%>/assets/user/image/seat_active.svg";
	    const seatSelectingSrc = "<%=request.getContextPath()%>/assets/user/image/seat_selecting.svg";

	    if (imageElement.src.includes("seat_active.svg")) {
	        if (selectedSeatsCountReturn >= maxSeatsReturn) {
	            toast({
	                title: "Chú ý!",
	                message: "Đã chọn đủ số ghế lượt về.",
	                type: "error",
	                duration: 1000
	            });
	            return;
	        }
	        selectedSeatsReturn.push(seatName);
	        selectedSeatIdsReturn.push(seatId);
	        imageElement.src = seatSelectingSrc;
	        spanElement.style.color = "#ef5222"; 
	        selectedSeatsCountReturn++;
	        
	        let seatsText = String(selectedSeatsCountReturn).concat(" Ghế");
	        let totalPriceReturn = selectedSeatsCountReturn * ${price};
	        let formattedTotalPrice = totalPriceReturn.toLocaleString('vi-VN');
	        let totalPriceText = String(formattedTotalPrice).concat("đ");

	        document.querySelector('.number-return').innerHTML = seatsText;
	        document.querySelector('.seat-return').textContent = selectedSeatsReturn.join(', ');
	        document.querySelector('.price-return').innerHTML = totalPriceText;
	        document.querySelector('.ticket-price-return').innerHTML = totalPriceText;

	        updateTotal();
	    } else if (imageElement.src.includes("seat_selecting.svg")) {
	        const index = selectedSeatsReturn.indexOf(seatName);
	        if (index !== -1) {
	            selectedSeatsReturn.splice(index, 1);
	            selectedSeatIdsReturn.splice(index, 1);
	        }
	        imageElement.src = seatActiveSrc; 
	        spanElement.style.color = ""; 
	        selectedSeatsCountReturn--;
	        
	        let seatsText = String(selectedSeatsCountReturn).concat(" Ghế");
	        let totalPriceReturn = selectedSeatsCountReturn * ${price}; 
	        let formattedTotalPrice = totalPriceReturn.toLocaleString('vi-VN');
	        let totalPriceText = String(formattedTotalPrice).concat("đ");

	        document.querySelector('.number-return').innerHTML = seatsText;
	        document.querySelector('.seat-return').textContent = selectedSeatsReturn.join(', ');
	        document.querySelector('.price-return').innerHTML = totalPriceText;
	        document.querySelector('.ticket-price-return').innerHTML = totalPriceText;

	        updateTotal();
	    }
	}

	function updateTotal() {
	    let totalAll = (selectedSeatsCount * ${price}) + (selectedSeatsCountReturn * ${price});
	    let formattedTotalAll = totalAll.toLocaleString('vi-VN');
	    document.querySelector('.total').innerHTML = formattedTotalAll.concat("đ");
	}
	
	const returnDate = "${returnDate}";
	if (returnDate && returnDate.trim() !== "") {
	    document.querySelector('.center-text')?.style.removeProperty('display');
	    document.querySelector('.divide')?.style.removeProperty('display');
	    document.querySelector('.center-text-return')?.style.removeProperty('display');
	    document.querySelectorAll('.seating-list').forEach(el => el.style.removeProperty('display'));
	    document.querySelector('.destination-information')?.style.removeProperty('display');
	    document.querySelectorAll('.price-infor').forEach(el => el.style.removeProperty('display'));
	    document.getElementById("departInfo").textContent = "${departureDate} - ${returnDate}";
	}
	
	const nguoiDungStr = localStorage.getItem("nguoiDung");
    if (nguoiDungStr) {
        const nguoiDung = JSON.parse(nguoiDungStr);
        console.log("Thông tin người dùng:", nguoiDung);
        
        const greetingLink = document.getElementById("userGreeting");
        if (greetingLink) {
            greetingLink.innerText = "Chào " + nguoiDung.hoTen;

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
				document.getElementById('name').value = data.hoTen || "";
				document.getElementById('phone').value = data.soDienThoai || "";
				document.getElementById('email').value = data.email || "";
			})
			.catch(error => {
				console.error("❌ Lỗi khi lấy dữ liệu người dùng:", error.message);
			});
        }
    } else {
        console.log("Không tìm thấy người dùng trong localStorage");
    }
    
    function redirectToLogin() {
		const nguoiDungStr = localStorage.getItem("nguoiDung");
        if (nguoiDungStr) {
        	toggleModal();
        } else {
        	window.location.href = "http://localhost:8086/FutaBus_Frontend/login";
        }
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
    	    console.log("icon:",icon);
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
	
	document.getElementById('submit-button').addEventListener('click', function(event) {
        const nameInput = document.getElementById('name');
        const nameValue = nameInput.value.trim();
        
        const phoneInput = document.getElementById('phone');
        const phoneValue = phoneInput.value.trim();
        
        const emailInput = document.getElementById('email');
        const emailValue = emailInput.value.trim();
        
        const termsCheckbox = document.getElementById("accept-terms");
        let isFormValid = true;
        
        const regex = /^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừửữựỳỵỷỹ\s]+$/u;
        const phoneRegex = /^[0-9]{10}$/;
        const emailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
        
        if (selectedSeats.length === 0) {
        	isFormValid = false;
            event.preventDefault();
            toast({
                title: "Chú ý!",
                message: "Chọn ít nhất một ghế cho chuyến đi để thanh toán.",
                type: "error",
                duration: 1000
            });
        }
        
        const returnDate = "${returnDate}";
        if(returnDate) {
        	if (selectedSeatsReturn.length === 0) {
            	isFormValid = false;
                event.preventDefault();
                toast({
                    title: "Chú ý!",
                    message: "Chọn ít nhất một ghế cho chuyến về để thanh toán.",
                    type: "error",
                    duration: 1000
                });
            }
        }
        
        if (nameValue === '' || phoneValue === '' || emailValue === '') {
        	isFormValid = false;
            event.preventDefault();

            toast({
                title: "Chú ý!",
                message: "Vui lòng điền đầy đủ thông tin.",
                type: "error",
                duration: 1000
            });
        } 
        
        if (!regex.test(nameValue) && nameValue !== '') {
        	isFormValid = false;
            event.preventDefault();
            toast({
                title: "Lỗi!",
                message: "Họ và tên không được chứa số hoặc ký tự đặc biệt.",
                type: "error",
                duration: 1000
            });
        }
        
        if (!phoneRegex.test(phoneValue) && phoneValue !== '') {
        	isFormValid = false;
            event.preventDefault(); 
            toast({
                title: "Chú ý!",
                message: "Số điện thoại chứa 10 chữ số và chỉ bao gồm các số.",
                type: "error",
                duration: 1000
            });
        }
        
        if (!emailRegex.test(emailValue) && emailValue !== '') {
        	isFormValid = false;
            event.preventDefault();
            toast({
                title: "Lỗi!",
                message: "Email phải có đuôi @gmail.com.",
                type: "error",
                duration: 1000
            });
        }
        
        if (isFormValid && !termsCheckbox.checked) {
        	isFormValid = false;
            event.preventDefault();
            toast({
                title: "Chú ý!",
                message: "Bạn cần chấp nhận điều khoản để thanh toán.",
                type: "error",
                duration: 1000
            });
        }
        
        if (isFormValid) {
        	const returnDate = "${returnDate}";
        	
        	if (!returnDate || returnDate.trim() === "") {
        		let totalPrice = selectedSeatsCount * ${price};
                
                let selectedSeatsStr = selectedSeats.join(',');
                let selectedSeatIdsStr = selectedSeatIds.join(',');
                const returnDate = "${returnDate}";

                const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/checkout');
                
                url.searchParams.append("selectedSeatsCount", selectedSeatsCount);
                url.searchParams.append("totalPrice", totalPrice);
                url.searchParams.append("nameValue", nameValue);
                url.searchParams.append("phoneValue", phoneValue);
                url.searchParams.append("emailValue", emailValue);
                url.searchParams.append("selectedSeats", selectedSeatsStr);
                url.searchParams.append("selectedSeatIds", selectedSeatIdsStr);
                url.searchParams.append("idTrip", idTrip);
                url.searchParams.append("formattedStartTime", '${formattedStartTime}');
                url.searchParams.append("weekday", '${weekday}');
                url.searchParams.append("departureId", ${departureId});
                url.searchParams.append("departure", '${departure}');
                url.searchParams.append("destinationId", ${destinationId});
                url.searchParams.append("destination", '${destination}');
                url.searchParams.append("start", '${start}');
                url.searchParams.append("end", '${end}');
                url.searchParams.append("departureDate", '${departureDate}');
                url.searchParams.append("returnDate", '${returnDate}');
                url.searchParams.append("startTime", '${startTime}');
                url.searchParams.append("endTime", '${endTime}');
                url.searchParams.append("loai", '${loai}');
                url.searchParams.append("price", ${price});
                url.searchParams.append("soGhe", ${soGhe});
                url.searchParams.append("idXe", ${idXe});

                fetch(url, {
                    method: 'GET',  
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    console.log("Dữ liệu đã nhận thành công!", data);
                    const isRoundTrip = false;
                    if (data.status === "success") { 
                    	let redirectURL = '/FutaBus_Frontend/checkout?' +
                        'selectedSeatsCount=' + selectedSeatsCount +
                        '&totalPrice=' + totalPrice +
                        '&nameValue=' + nameValue +
                        '&phoneValue=' + phoneValue +
                        '&emailValue=' + emailValue +
                        '&selectedSeats=' + selectedSeatsStr + 
                        '&selectedSeatIds=' + selectedSeatIdsStr +
                        '&idTrip=' + idTrip +
                    	'&formattedStartTime=' + encodeURIComponent('${formattedStartTime}') +
                        '&weekday=' + encodeURIComponent('${weekday}') +
                        '&departureId=' + encodeURIComponent(${departureId}) +
                        '&departure=' + encodeURIComponent('${departure}') +
                        '&destinationId=' + encodeURIComponent(${destinationId}) +
                        '&destination=' + encodeURIComponent('${destination}') +
                        '&start=' + encodeURIComponent('${start}') +
                        '&end=' + encodeURIComponent('${end}') +
                        '&departureDate=' + encodeURIComponent('${departureDate}') +
                        (isRoundTrip ? 
                        		'&returnDate=' + returnDate +
                        		'&idTripReturn=' + idTripReturn + 
                                '&startTimeReturn=' + startTimeReturn + 
                                '&endTimeReturn=' + endTimeReturn + 
                                '&priceReturn=' + priceReturn + 
                                '&soGheReturn=' + soGheReturn + 
                                '&idXeReturn=' + idXeReturn : '') +
                        '&startTime=' + encodeURIComponent('${startTime}') +
                        '&endTime=' + encodeURIComponent('${endTime}') +
                        '&loai=' + encodeURIComponent('${loai}') +
                        '&price=' + encodeURIComponent(${price}) +
                        '&soGhe=' + encodeURIComponent(${soGhe}) +
                        '&idXe=' + encodeURIComponent(${idXe});

      					window.location.href = redirectURL;
                    } else {
                        console.error("❌ Lỗi phản hồi từ API:", data);
                    }
                })
                .catch(error => {
                    console.error("❌ Lỗi khi lấy dữ liệu:", error.message);
                    console.error("🔍 Chi tiết lỗi:", error);
                });
        	} else {
				let totalPrice = selectedSeatsCount * ${price};
				let totalPriceReturn = selectedSeatsCountReturn * ${price};
                
				let selectedSeatsStr = selectedSeats.join(',');
                let selectedSeatIdsStr = selectedSeatIds.join(',');
                let selectedSeatsReturnStr = selectedSeatsReturn.join(',');
                let selectedSeatIdsReturnStr = selectedSeatIdsReturn.join(',');

                const url = new URL('http://localhost:8085/FutaBus_Backend/api/user/checkout');
                
                url.searchParams.append("selectedSeatsCount", selectedSeatsCount);
                url.searchParams.append("selectedSeatsCountReturn", selectedSeatsCountReturn);
                url.searchParams.append("totalPrice", totalPrice);
                url.searchParams.append("nameValue", nameValue);
                url.searchParams.append("phoneValue", phoneValue);
                url.searchParams.append("emailValue", emailValue);
                url.searchParams.append("selectedSeats", selectedSeatsStr);
                url.searchParams.append("selectedSeatIds", selectedSeatIdsStr);
                url.searchParams.append("selectedSeatsReturn", selectedSeatsReturnStr);
                url.searchParams.append("selectedSeatIdsReturn", selectedSeatIdsReturnStr);
                url.searchParams.append("idTrip", idTrip);
                url.searchParams.append("formattedStartTime", '${formattedStartTime}');
                url.searchParams.append("weekday", '${weekday}');
                url.searchParams.append("departureId", ${departureId});
                url.searchParams.append("departure", '${departure}');
                url.searchParams.append("destinationId", ${destinationId});
                url.searchParams.append("destination", '${destination}');
                url.searchParams.append("start", '${start}');
                url.searchParams.append("end", '${end}');
                url.searchParams.append("departureDate", '${departureDate}');
                url.searchParams.append("returnDate", '${returnDate}');
                url.searchParams.append("startTime", '${startTime}');
                url.searchParams.append("endTime", '${endTime}');
                url.searchParams.append("loai", '${loai}');
                url.searchParams.append("price", ${price});
                url.searchParams.append("soGhe", ${soGhe});
                url.searchParams.append("idXe", ${idXe});
                url.searchParams.append("totalPriceReturn", totalPriceReturn);
                url.searchParams.append("idTripReturn", ${idTripReturn});
                url.searchParams.append("startTimeReturn", '${startTimeReturn}');
                url.searchParams.append("endTimeReturn", '${endTimeReturn}');
                url.searchParams.append("formattedStartTimeReturn", '${formattedStartTimeReturn}');
                url.searchParams.append("priceReturn", ${priceReturn});
                url.searchParams.append("soGheReturn", ${soGheReturn});
                url.searchParams.append("idXeReturn", ${idXeReturn});

                fetch(url, {
                    method: 'GET',  
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    console.log("Dữ liệu đã nhận thành công!", data);
                    const isRoundTrip = false;
                    if (data.status === "success") { 
                    	let redirectURL = '/FutaBus_Frontend/checkout?' +
                        'selectedSeatsCount=' + selectedSeatsCount +
                        '&selectedSeatsCountReturn=' + selectedSeatsCountReturn +
                        '&totalPrice=' + totalPrice +
                        '&nameValue=' + nameValue +
                        '&phoneValue=' + phoneValue +
                        '&emailValue=' + emailValue +
                        '&selectedSeats=' + selectedSeatsStr + 
                        '&selectedSeatIds=' + selectedSeatIdsStr +
                        '&selectedSeatsReturn=' + selectedSeatsReturnStr + 
                        '&selectedSeatIdsReturn=' + selectedSeatIdsReturnStr +
                        '&idTrip=' + idTrip +
                    	'&formattedStartTime=' + encodeURIComponent('${formattedStartTime}') +
                        '&weekday=' + encodeURIComponent('${weekday}') +
                        '&departureId=' + encodeURIComponent(${departureId}) +
                        '&departure=' + encodeURIComponent('${departure}') +
                        '&destinationId=' + encodeURIComponent(${destinationId}) +
                        '&destination=' + encodeURIComponent('${destination}') +
                        '&start=' + encodeURIComponent('${start}') +
                        '&end=' + encodeURIComponent('${end}') +
                        '&departureDate=' + encodeURIComponent('${departureDate}') +
                        '&returnDate=' + encodeURIComponent('${returnDate}') +
                        '&startTime=' + encodeURIComponent('${startTime}') +
                        '&endTime=' + encodeURIComponent('${endTime}') +
                        '&loai=' + encodeURIComponent('${loai}') +
                        '&price=' + encodeURIComponent(${price}) +
                        '&soGhe=' + encodeURIComponent(${soGhe}) +
                        '&idXe=' + encodeURIComponent(${idXe}) +
                        '&totalPriceReturn=' + totalPriceReturn +
                        '&idTripReturn=' + encodeURIComponent(${idTripReturn}) +
                        '&startTimeReturn=' + encodeURIComponent('${startTimeReturn}') +
                        '&endTimeReturn=' + encodeURIComponent('${endTimeReturn}') +
                        '&formattedStartTimeReturn=' + encodeURIComponent('${formattedStartTimeReturn}') +
                        '&priceReturn=' + encodeURIComponent(${priceReturn}) +
                        '&soGheReturn=' + encodeURIComponent(${soGheReturn}) +
                        '&idXeReturn=' + encodeURIComponent(${idXeReturn});

      					window.location.href = redirectURL;
                    } else {
                        console.error("❌ Lỗi phản hồi từ API:", data);
                    }
                })
                .catch(error => {
                    console.error("❌ Lỗi khi lấy dữ liệu:", error.message);
                    console.error("🔍 Chi tiết lỗi:", error);
                });
        	}
        }
    });
	
	function toggleModal() {
		var modal = document.getElementById("userModal");
		modal.classList.toggle("show");
	}

	</script>

</body>
</html>