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


import org.springframework.http.*;
//import jakarta.servlet.http.HttpSession;

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
            @RequestParam String departure,
            @RequestParam String destination,
            @RequestParam String departureDate,
            @RequestParam(required = false) String returnDate,
            @RequestParam int tickets,
            Model model) {

        try {
//            ResponseEntity<List> response = restTemplate.exchange(apiUrl, HttpMethod.GET, null, List.class);
//            List<?> tripList = response.getBody();  // API trả về danh sách chuyến đi

            //model.addAttribute("trips", tripList);

            model.addAttribute("departure", departure);
            model.addAttribute("destination", destination);
            model.addAttribute("departureDate", departureDate);
            model.addAttribute("returnDate", returnDate);
            model.addAttribute("tickets", tickets);

        } catch (Exception e) {
            System.out.println("❌ Lỗi khi gọi API: " + e.getMessage());
            model.addAttribute("error", "Không thể lấy thông tin chuyến xe! Vui lòng thử lại.");
        }
        return "user/TripSelection";
    }

    @GetMapping("/book-tickets")
    public String bookTicketsPage() {
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
