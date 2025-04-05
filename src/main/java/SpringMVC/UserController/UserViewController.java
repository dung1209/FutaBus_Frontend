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

import org.springframework.http.*;

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
