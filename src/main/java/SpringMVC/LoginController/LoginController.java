package SpringMVC.LoginController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String loginPage() {

		return "login/Login";
	}
	
	@GetMapping("/login/callback")
	public String showLoginCallback(@RequestParam("email") String email, Model model) {
	    model.addAttribute("email", email);
	    return "login/LoginCallback";
	}

}