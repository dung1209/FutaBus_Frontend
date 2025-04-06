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

        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat targetFormat = new SimpleDateFormat("HH:mm"); 

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

        model.addAttribute("numberOfTrips", responseData.get("numberOfTrips"));
        model.addAttribute("chuyenXeResultList", chuyenXeList); 
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
    	        + "&startTime=" + startTime
    	        + "&endTime=" + endTime
    	        + "&loai=" + loai
    	        + "&price=" + price
    	        + "&soGhe=" + soGhe
    	        + "&idXe=" + idXe;

    	ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);
    	Map<String, Object> responseData = response.getBody();

//    	List<Map<String, Object>> viTriGheTangDuoiList = (List<Map<String, Object>>) responseData.get("viTriGheTangDuoiList");
//    	List<Map<String, Object>> viTriGheTangTrenList = (List<Map<String, Object>>) responseData.get("viTriGheTangTrenList");
//
//    	// Bạn có thể debug hoặc in ra để kiểm tra
//    	for (Map<String, Object> ghe : viTriGheTangDuoiList) {
//    	    System.out.println("Ghế dưới: " + ghe.get("tenViTri") + " - Trạng thái: " + ghe.get("trangThai"));
//    	}
//
//    	for (Map<String, Object> ghe : viTriGheTangTrenList) {
//    	    System.out.println("Ghế trên: " + ghe.get("tenViTri") + " - Trạng thái: " + ghe.get("trangThai"));
//    	}
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
    public String checkoutPage() {
        return "user/Checkout";
    }

    @GetMapping("/thank-you")
    public String thankYouPage() {
        return "user/Thankyou";
    }
}
