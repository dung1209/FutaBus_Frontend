package SpringMVC.UserController;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

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
    
    @GetMapping("/trip-selection")
    public String tripSelectionPage(HttpSession session, Model model) {
    	RestTemplate restTemplate = new RestTemplate();

        String apiUrlWithParams = API_URL + "tinhthanh";
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();  
        model.addAttribute("tinhThanhList", responseData.get("tinhThanhList"));
        
        model.addAttribute("departure", session.getAttribute("departure"));
        model.addAttribute("destination", session.getAttribute("destination"));
        model.addAttribute("departureDate", session.getAttribute("departureDate"));
        model.addAttribute("returnDate", session.getAttribute("returnDate"));
        model.addAttribute("tickets", session.getAttribute("tickets"));
        
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
