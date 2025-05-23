package SpringMVC.UserController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import FutaBus.bean.ChuyenXeResult;
import FutaBus.bean.NguoiDung;
import FutaBus.bean.ViTriGhe;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Locale;

import org.springframework.http.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class UserViewController {

	private static final String API_URL = "http://localhost:8085/FutaBus_Backend/api/user/";

	@GetMapping("/")
	public String homePage(Model model, HttpSession session) {
		RestTemplate restTemplate = new RestTemplate();
		String apiUrlWithParams = API_URL + "tinhthanh";
		ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

		Map<String, Object> responseData = response.getBody();
		model.addAttribute("tinhThanhList", responseData.get("tinhThanhList"));

		return "user/Home";
	}

	private final RestTemplate restTemplate = new RestTemplate();

	@GetMapping("/trip-selection")
	public String tripSelectionOneWay(@RequestParam int departureId, @RequestParam String departure,
			@RequestParam int destinationId, @RequestParam String destination, @RequestParam String departureDate,
			@RequestParam(required = false) String returnDate, @RequestParam int tickets, Model model) {

		RestTemplate restTemplate = new RestTemplate();
		String apiUrlWithParams = API_URL + "trip-selection?" + "departureId=" + departureId + "&departure=" + departure
				+ "&destinationId=" + destinationId + "&destination=" + destination + "&departureDate=" + departureDate
				+ (returnDate != null ? "&returnDate=" + returnDate : "") + "&tickets=" + tickets;

		ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);
		Map<String, Object> responseData = response.getBody();

		List<Map<String, Object>> chuyenXeList = (List<Map<String, Object>>) responseData.get("chuyenXeResultList");
		List<Map<String, Object>> chuyenXeReturnList = (List<Map<String, Object>>) responseData
				.get("chuyenXeReturnList");

		SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat targetFormat = new SimpleDateFormat("HH:mm");

		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		DateTimeFormatter dayFormatter = DateTimeFormatter.ofPattern("EEEE, dd/MM/yyyy", new Locale("vi", "VN"));

		LocalDate departureLocalDate = LocalDate.parse(departureDate, inputFormatter);
		String formattedDepartureDateWithDay = departureLocalDate.format(dayFormatter);

		if (returnDate != null && !returnDate.trim().isEmpty()) {
			LocalDate returnLocalDate = LocalDate.parse(returnDate, inputFormatter);
			String formattedReturnDateWithDay = returnLocalDate.format(dayFormatter);
			model.addAttribute("formattedReturnDateWithDay", formattedReturnDateWithDay);
		} else {
			model.addAttribute("formattedReturnDateWithDay", "");
		}

		for (Map<String, Object> chuyen : chuyenXeList) {

			String thoiDiemDi = (String) chuyen.get("thoiDiemDi");
			String thoiDiemDen = (String) chuyen.get("thoiDiemDen");

			try {
				Date dateDi = originalFormat.parse(thoiDiemDi);
				Date dateDen = originalFormat.parse(thoiDiemDen);
				String formattedThoiDiemDi = targetFormat.format(dateDi);
				String formattedThoiDiemDen = targetFormat.format(dateDen);

				chuyen.put("thoiDiemDiFormatted", formattedThoiDiemDi);
				chuyen.put("thoiDiemDenFormatted", formattedThoiDiemDen);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		for (Map<String, Object> chuyenxe : chuyenXeReturnList) {

			String thoiDiemDi = (String) chuyenxe.get("thoiDiemDi");
			String thoiDiemDen = (String) chuyenxe.get("thoiDiemDen");

			try {
				Date dateDi = originalFormat.parse(thoiDiemDi);
				Date dateDen = originalFormat.parse(thoiDiemDen);
				String formattedThoiDiemDiReturn = targetFormat.format(dateDi);
				String formattedThoiDiemDenReturn = targetFormat.format(dateDen);

				chuyenxe.put("thoiDiemDiReturnFormatted", formattedThoiDiemDiReturn);
				chuyenxe.put("thoiDiemDenReturnFormatted", formattedThoiDiemDenReturn);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("formattedDepartureDateWithDay", formattedDepartureDateWithDay);
		model.addAttribute("numberOfTrips", responseData.get("numberOfTrips"));
		model.addAttribute("numberOfTripReturns", responseData.get("numberOfTripReturns"));
		model.addAttribute("chuyenXeResultList", chuyenXeList);
		model.addAttribute("chuyenXeReturnList", chuyenXeReturnList);
		model.addAttribute("departureId", departureId);
		model.addAttribute("departure", departure);
		model.addAttribute("destinationId", destinationId);
		model.addAttribute("destination", destination);
		model.addAttribute("departureDate", departureDate);
		model.addAttribute("returnDate", returnDate);
		model.addAttribute("tickets", tickets);

		return "user/TripSelection";
	}

	@GetMapping("/book-tickets")
	public String bookTicketsPage(@RequestParam String departureId, @RequestParam String departure,
			@RequestParam String destinationId, @RequestParam String destination, @RequestParam String start,
			@RequestParam String end, @RequestParam String departureDate,
			@RequestParam(required = false) String returnDate, @RequestParam int idTrip, @RequestParam String startTime,
			@RequestParam String endTime, @RequestParam String loai, @RequestParam String price,
			@RequestParam String soGhe, @RequestParam String idXe,

			@RequestParam(value = "idTripReturn", required = false) Integer idTripReturn,
			@RequestParam(value = "startTimeReturn", required = false) String startTimeReturn,
			@RequestParam(value = "endTimeReturn", required = false) String endTimeReturn,
			@RequestParam(value = "priceReturn", required = false) String priceReturn,
			@RequestParam(value = "soGheReturn", required = false) String soGheReturn,
			@RequestParam(value = "idXeReturn", required = false) String idXeReturn, Model model) {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate departureLocalDate = LocalDate.parse(departureDate, formatter);
		DayOfWeek departureDayOfWeek = departureLocalDate.getDayOfWeek();

		String[] weekdays = { "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy", "Chủ Nhật" };
		String departureWeekday = weekdays[departureDayOfWeek.getValue() - 1];

		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");

		LocalDateTime startDateTimeGo = LocalDateTime.parse(startTime, inputFormatter);

		String formattedStartTimeGo = startDateTimeGo.format(outputFormatter);

		if (returnDate != null && !returnDate.trim().isEmpty()) {
			LocalDate returnLocalDate = LocalDate.parse(returnDate, formatter);
			DayOfWeek returnDayOfWeek = returnLocalDate.getDayOfWeek();
			String returnWeekday = weekdays[returnDayOfWeek.getValue() - 1];
			LocalDateTime startDateTimeReturn = LocalDateTime.parse(startTimeReturn, inputFormatter);
			String formattedStartTimeReturn = startDateTimeReturn.format(outputFormatter);

			model.addAttribute("returnWeekday", returnWeekday);
			model.addAttribute("formattedStartTimeReturn", formattedStartTimeReturn);
		}

		RestTemplate restTemplate = new RestTemplate();

		String apiUrlWithParams = API_URL + "/book-tickets?" + "departureId=" + departureId + "&departure=" + departure
				+ "&destinationId=" + destinationId + "&destination=" + destination + "&start=" + start + "&end=" + end
				+ "&departureDate=" + departureDate + "&returnDate=" + returnDate + "&idTrip=" + idTrip + "&startTime="
				+ startTime + "&endTime=" + endTime + "&loai=" + loai + "&idTripReturn=" + idTripReturn
				+ "&startTimeReturn=" + startTimeReturn + "&endTimeReturn=" + endTimeReturn + "&price=" + price
				+ "&priceReturn=" + priceReturn + "&soGhe=" + soGhe + "&soGheReturn=" + soGheReturn + "&idXe=" + idXe
				+ "&idXeReturn=" + idXeReturn;

		ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);
		Map<String, Object> responseData = response.getBody();
		List<ViTriGhe> viTriGheGoDuoi = (List<ViTriGhe>) responseData.get("viTriGheTangDuoiList");
		List<ViTriGhe> viTriGheGoTren = (List<ViTriGhe>) responseData.get("viTriGheTangTrenList");

		if (returnDate != null && !returnDate.trim().isEmpty()) {
			List<ViTriGhe> viTriGheReturnDuoi = (List<ViTriGhe>) responseData.get("viTriGheTangDuoiReturnList");
			List<ViTriGhe> viTriGheReturnTren = (List<ViTriGhe>) responseData.get("viTriGheTangTrenReturnList");

			model.addAttribute("viTriGheTangDuoiReturnList", viTriGheReturnDuoi);
			model.addAttribute("viTriGheTangTrenReturnList", viTriGheReturnTren);
		}

		model.addAttribute("departureId", departureId);
		model.addAttribute("departure", departure);
		model.addAttribute("destinationId", destinationId);
		model.addAttribute("destination", destination);
		model.addAttribute("departureDate", departureDate);
		model.addAttribute("returnDate", returnDate);
		model.addAttribute("weekday", departureWeekday);

		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("idTrip", idTrip);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("formattedStartTime", formattedStartTimeGo);
		model.addAttribute("price", price);
		model.addAttribute("soGhe", soGhe);
		model.addAttribute("idXe", idXe);
		model.addAttribute("viTriGheTangDuoiList", viTriGheGoDuoi);
		model.addAttribute("viTriGheTangTrenList", viTriGheGoTren);

		if (idTripReturn != null) {
			model.addAttribute("idTripReturn", idTripReturn);
			model.addAttribute("startTimeReturn", startTimeReturn);
			model.addAttribute("endTimeReturn", endTimeReturn);

			model.addAttribute("priceReturn", priceReturn);
			model.addAttribute("soGheReturn", soGheReturn);
			model.addAttribute("idXeReturn", idXeReturn);
		} else {
			model.addAttribute("idTripReturn", "null");
			model.addAttribute("startTimeReturn", null);
			model.addAttribute("endTimeReturn", null);
			model.addAttribute("formattedStartTimeReturn", "null");
			model.addAttribute("priceReturn", 0);
			model.addAttribute("soGheReturn", 0);
			model.addAttribute("idXeReturn", null);
		}

		return "user/BookTickets";
	}

	@GetMapping("/checkout")
	public String checkoutPage(@RequestParam("selectedSeatsCount") int selectedSeatsCount,
			@RequestParam(value = "selectedSeatsCountReturn", required = false) Integer selectedSeatsCountReturn,
			@RequestParam("totalPrice") double totalPrice, @RequestParam("nameValue") String nameValue,
			@RequestParam("phoneValue") String phoneValue, @RequestParam("emailValue") String emailValue,
			@RequestParam("selectedSeats") String selectedSeats,
			@RequestParam("selectedSeatIds") String selectedSeatIds,
			@RequestParam(value = "selectedSeatsReturn", required = false) String selectedSeatsReturn,
			@RequestParam(value = "selectedSeatIdsReturn", required = false) String selectedSeatIdsReturn,
			@RequestParam("idTrip") Long idTrip, @RequestParam("formattedStartTime") String formattedStartTime,
			@RequestParam("weekday") String weekday, @RequestParam("departureId") int departureId,
			@RequestParam("departure") String departure, @RequestParam("destinationId") int destinationId,
			@RequestParam("destination") String destination, @RequestParam("start") String start,
			@RequestParam("end") String end, @RequestParam("departureDate") String departureDate,
			@RequestParam(value = "returnDate", required = false) String returnDate, @RequestParam("startTime") String startTime,
			@RequestParam("endTime") String endTime, @RequestParam("loai") String loai,
			@RequestParam("price") double price, @RequestParam("soGhe") int soGhe, @RequestParam("idXe") Long idXe,
			@RequestParam(value = "totalPriceReturn", required = false) Double totalPriceReturn,
			@RequestParam(value = "idTripReturn", required = false) Long idTripReturn,
			@RequestParam(value = "startTimeReturn", required = false) String startTimeReturn,
			@RequestParam(value = "endTimeReturn", required = false) String endTimeReturn,
			@RequestParam(value = "formattedStartTimeReturn", required = false) String formattedStartTimeReturn,
			@RequestParam(value = "priceReturn", required = false) Double priceReturn,
			@RequestParam(value = "soGheReturn", required = false) Integer soGheReturn,
			@RequestParam(value = "idXeReturn", required = false) Long idXeReturn, Model model) {

		System.out.println("*********************FrontEND*************************");
		System.out.println("selectedSeatsCount: " + selectedSeatsCount);
		System.out.println("totalPrice: " + totalPrice);
		System.out.println("nameValue: " + nameValue);
		System.out.println("phoneValue: " + phoneValue);
		System.out.println("emailValue: " + emailValue);
		System.out.println("selectedSeats: " + selectedSeats);
		System.out.println("selectedSeatIds: " + selectedSeatIds);
		System.out.println("idTrip: " + idTrip);
		System.out.println("formattedStartTime: " + formattedStartTime);
		System.out.println("weekday: " + weekday);
		System.out.println("departureId: " + departureId);
		System.out.println("departure: " + departure);
		System.out.println("destinationId: " + destinationId);
		System.out.println("destination: " + destination);
		System.out.println("start: " + start);
		System.out.println("end: " + end);
		System.out.println("departureDate: " + departureDate);
		System.out.println("returnDate: " + returnDate);
		System.out.println("startTime: " + startTime);
		System.out.println("endTime: " + endTime);
		System.out.println("loai: " + loai);
		System.out.println("price: " + price);
		System.out.println("soGhe: " + soGhe);
		System.out.println("idXe: " + idXe);
		System.out.println("**********************************************");

		model.addAttribute("selectedSeatsCount", selectedSeatsCount);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("nameValue", nameValue);
		model.addAttribute("phoneValue", phoneValue);
		model.addAttribute("emailValue", emailValue);
		model.addAttribute("selectedSeats", selectedSeats);
		model.addAttribute("selectedSeatIds", selectedSeatIds);
		model.addAttribute("idTrip", idTrip);
		model.addAttribute("formattedStartTime", formattedStartTime);
		model.addAttribute("weekday", weekday);
		model.addAttribute("departureId", departureId);
		model.addAttribute("departure", departure);
		model.addAttribute("destinationId", destinationId);
		model.addAttribute("destination", destination);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("departureDate", departureDate);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("loai", loai);
		model.addAttribute("price", price);
		model.addAttribute("soGhe", soGhe);
		model.addAttribute("idXe", idXe);
		if (idTripReturn != null) {
			model.addAttribute("returnDate", returnDate);
			model.addAttribute("totalPriceReturn", totalPriceReturn);
			model.addAttribute("idTripReturn", idTripReturn);
			model.addAttribute("startTimeReturn", startTimeReturn);
			model.addAttribute("endTimeReturn", endTimeReturn);
			model.addAttribute("formattedStartTimeReturn", formattedStartTimeReturn);
			model.addAttribute("priceReturn", priceReturn);
			model.addAttribute("soGheReturn", soGheReturn);
			model.addAttribute("idXeReturn", idXeReturn);
			model.addAttribute("selectedSeatsCountReturn", selectedSeatsCountReturn);
			model.addAttribute("selectedSeatsReturn", selectedSeatsReturn);
			model.addAttribute("selectedSeatIdsReturn", selectedSeatIdsReturn);
		} else {
			model.addAttribute("returnDate", null);
			model.addAttribute("totalPriceReturn", 0);
			model.addAttribute("idTripReturn", "null");
			model.addAttribute("startTimeReturn", null);
			model.addAttribute("endTimeReturn", null);
			model.addAttribute("formattedStartTimeReturn", null);
			model.addAttribute("priceReturn", 0);
			model.addAttribute("soGheReturn", 0);
			model.addAttribute("idXeReturn", null);
			model.addAttribute("selectedSeatsCountReturn", 0);
			model.addAttribute("selectedSeatsReturn", "");
			model.addAttribute("selectedSeatIdsReturn", "");
		}

		return "user/Checkout";
	}

	@GetMapping("/thank-you")
	public String thankYouPage(@RequestParam("start") String start, 
			@RequestParam("end") String end,
			@RequestParam("departure") String departure, 
			@RequestParam("destination") String destination,
			@RequestParam("departureDate") String departureDate,
			@RequestParam("selectedSeatsCount") int selectedSeatsCount, 
			@RequestParam("totalPrice") double totalPrice,
			@RequestParam(value = "returnDate", required = false) String returnDate,
			@RequestParam(value = "departureDateReturn", required = false) String departureDateReturn,
			@RequestParam(value = "selectedSeatsCountReturn", required = false) Integer selectedSeatsCountReturn,
			@RequestParam(value = "totalPriceReturn", required = false) Double totalPriceReturn,
			Model model) {

		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("departure", departure);
		model.addAttribute("destination", destination);
		model.addAttribute("departureDate", departureDate);
		model.addAttribute("selectedSeatsCount", selectedSeatsCount);
		model.addAttribute("totalPrice", totalPrice);

		if (returnDate != null) {
			model.addAttribute("returnDate", returnDate);
			model.addAttribute("departureDateReturn", departureDateReturn);
			model.addAttribute("selectedSeatsCountReturn", selectedSeatsCountReturn);
			model.addAttribute("totalPriceReturn", totalPriceReturn);
		} else {
			model.addAttribute("returnDate", "");
			model.addAttribute("departureDateReturn", "");
			model.addAttribute("selectedSeatsCountReturn", 0);
			model.addAttribute("totalPriceReturn", 0);
		}

		return "user/Thankyou";
	}
	
	@GetMapping("/general-information")
	public String informationPage(Model model, HttpSession session) {

		return "user/GeneralInformation";
	}
	
	@GetMapping("/reset-password")
	public String resetPasswordPage(Model model, HttpSession session) {

		return "user/ResetPassword";
	}
	
	@GetMapping("/purchase-history")
	public String purchaseHistoryPage(Model model, HttpSession session) {

		return "user/PurchaseHistory";
	}

}
