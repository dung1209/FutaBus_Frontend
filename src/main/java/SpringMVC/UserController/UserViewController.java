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
    public String homePage(Model model) {
    	RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "tinhthanh";
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();
        model.addAttribute("tinhThanhList", responseData.get("tinhThanhList"));
        
        return "user/Home";
    }

    private final RestTemplate restTemplate = new RestTemplate();
    
    @GetMapping("/trip-selection")
    public String tripSelectionPage(
            @RequestParam int departureId,
            @RequestParam String departure,
            @RequestParam int destinationId,
            @RequestParam String destination,
            @RequestParam String departureDate,
            @RequestParam(required = false) String returnDate,
            @RequestParam int tickets,
            Model model) {

        RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "trip-selection?"
                + "departureId=" + departureId
                + "&departure=" + departure
                + "&destinationId=" + destinationId
                + "&destination=" + destination
                + "&departureDate=" + departureDate
                + (returnDate != null ? "&returnDate=" + returnDate : "")
                + "&tickets=" + tickets;

        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);
        Map<String, Object> responseData = response.getBody();

        List<Map<String, Object>> chuyenXeList = (List<Map<String, Object>>) responseData.get("chuyenXeResultList");
        List<Map<String, Object>> chuyenXeReturnList = (List<Map<String, Object>>) responseData.get("chuyenXeReturnList");

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
    public String bookTicketsPage(
            @RequestParam String departureId,
            @RequestParam String departure,
            @RequestParam String destinationId,
            @RequestParam String destination,
            @RequestParam String start,
            @RequestParam String end,
            @RequestParam String departureDate,
            @RequestParam(required = false) String returnDate,
            @RequestParam int idTrip,
            @RequestParam String startTime,
            @RequestParam String endTime,
            @RequestParam String loai,
            @RequestParam String price,
            @RequestParam String soGhe,
            @RequestParam String idXe,
            Model model) {
    	
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    	LocalDate departureLocalDate = LocalDate.parse(departureDate, formatter);
    	DayOfWeek dayOfWeek = departureLocalDate.getDayOfWeek();

    	String[] weekdays = {
    	    "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy", "Chủ Nhật"
    	};
    	String departureWeekday = weekdays[dayOfWeek.getValue() - 1];

    	DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    	DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");

    	LocalDateTime startDateTime = LocalDateTime.parse(startTime, inputFormatter);
    	String formattedStartTime = startDateTime.format(outputFormatter);

    	RestTemplate restTemplate = new RestTemplate();

    	String apiUrlWithParams = API_URL + "book-tickets?"
    	        + "departureId=" + departureId
    	        + "&departure=" + departure
    	        + "&destinationId=" + destinationId
    	        + "&destination=" + destination
    	        + "&start=" + start
    	        + "&end=" + end
    	        + "&departureDate=" + departureDate
    	        + (returnDate != null ? "&returnDate=" + returnDate : "")
    	        + "&idTrip=" + idTrip
    	        + "&startTime=" + startTime
    	        + "&endTime=" + endTime
    	        + "&loai=" + loai
    	        + "&price=" + price
    	        + "&soGhe=" + soGhe
    	        + "&idXe=" + idXe;

    	ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);
    	Map<String, Object> responseData = response.getBody();

    	List<ViTriGhe> viTriGheTangDuoiList = (List<ViTriGhe>) responseData.get("viTriGheTangDuoiList");
    	List<ViTriGhe> viTriGheTangTrenList = (List<ViTriGhe>) responseData.get("viTriGheTangTrenList");

    	model.addAttribute("formattedStartTime", formattedStartTime);
    	model.addAttribute("weekday", departureWeekday);
    	model.addAttribute("departureId", departureId);
    	model.addAttribute("departure", departure);
    	model.addAttribute("destinationId", destinationId);
    	model.addAttribute("destination", destination);
    	model.addAttribute("start", start);
    	model.addAttribute("end", end);
    	model.addAttribute("departureDate", departureDate);
    	model.addAttribute("returnDate", returnDate);
    	model.addAttribute("idTrip", idTrip);
    	model.addAttribute("startTime", startTime);
    	model.addAttribute("endTime", endTime);
    	model.addAttribute("loai", loai);
    	model.addAttribute("price", price);
    	model.addAttribute("soGhe", soGhe);
    	model.addAttribute("idXe", idXe);
    	model.addAttribute("viTriGheTangDuoiList", viTriGheTangDuoiList);
    	model.addAttribute("viTriGheTangTrenList", viTriGheTangTrenList);

        return "user/BookTickets";
    }

    @GetMapping("/checkout")
    public String checkoutPage(
        @RequestParam("selectedSeatsCount") int selectedSeatsCount,
        @RequestParam("totalPrice") double totalPrice,
        @RequestParam("nameValue") String nameValue,
        @RequestParam("phoneValue") String phoneValue,
        @RequestParam("emailValue") String emailValue,
        @RequestParam("selectedSeats") String selectedSeats,
        @RequestParam("selectedSeatIds") String selectedSeatIds,
        @RequestParam("idTrip") Long idTrip,
        @RequestParam("formattedStartTime") String formattedStartTime,
        @RequestParam("weekday") String weekday,
        @RequestParam("departureId") int departureId,
        @RequestParam("departure") String departure,
        @RequestParam("destinationId") int destinationId,
        @RequestParam("destination") String destination,
        @RequestParam("start") String start,
        @RequestParam("end") String end,
        @RequestParam("departureDate") String departureDate,
        @RequestParam("returnDate") String returnDate,
        @RequestParam("startTime") String startTime,
        @RequestParam("endTime") String endTime,
        @RequestParam("loai") String loai,
        @RequestParam("price") double price,
        @RequestParam("soGhe") int soGhe,
        @RequestParam("idXe") Long idXe,
        Model model) {

        // Debug log
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
        model.addAttribute("returnDate", returnDate);
        model.addAttribute("startTime", startTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("loai", loai);
        model.addAttribute("price", price);
        model.addAttribute("soGhe", soGhe);
        model.addAttribute("idXe", idXe);

        return "user/Checkout";
    }

    @GetMapping("/thank-you")
    public String thankYouPage(
            @RequestParam("start") String start,
            @RequestParam("end") String end,
            @RequestParam("departure") String departure,
            @RequestParam("destination") String destination,
            @RequestParam("departureDate") String departureDate,
            @RequestParam("selectedSeatsCount") int selectedSeatsCount,
            @RequestParam("totalPrice") double totalPrice,
            Model model) {

        model.addAttribute("start", start);
        model.addAttribute("end", end);
        model.addAttribute("departure", departure);
        model.addAttribute("destination", destination);
        model.addAttribute("departureDate", departureDate);
        model.addAttribute("selectedSeatsCount", selectedSeatsCount);
        model.addAttribute("totalPrice", totalPrice);

        return "user/Thankyou";
    }

}
