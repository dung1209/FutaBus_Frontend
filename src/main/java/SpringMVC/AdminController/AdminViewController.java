package SpringMVC.AdminController;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/admin")
public class AdminViewController {
	
	private static final String API_URL = "http://localhost:8085/FutaBus_Backend/api/admin/";
	
	@GetMapping
    public String homeAdminPage(@RequestParam(value = "page", defaultValue = "1") int page,
                                @RequestParam(value = "loaiNguoiDung", defaultValue = "1") int loaiNguoiDung,
                                Model model) {
        
        RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "nguoidung" + "?page=" + page + "&loaiNguoiDung=" + loaiNguoiDung;
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();
        model.addAttribute("nguoiDungList", responseData.get("nguoiDungList"));
        model.addAttribute("currentPage", responseData.get("currentPage"));
        model.addAttribute("totalPages", responseData.get("totalPages"));
        model.addAttribute("totalCustomer", responseData.get("totalCustomer"));
        model.addAttribute("totalXe", responseData.get("totalXe"));
        model.addAttribute("totalChuyenXe", responseData.get("totalChuyenXe"));
        model.addAttribute("tongDoanhThuThangHienTai", responseData.get("tongDoanhThuThangHienTai"));

        return "admin/Home"; 
    }
	
	@GetMapping("/bus-route")
    public String bookTicketsPage(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "tuyenxe" + "?page=" + page;
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();
        model.addAttribute("tuyenXeList", responseData.get("tuyenXeList"));
        model.addAttribute("benXeList", responseData.get("benXeList"));
        model.addAttribute("quanHuyenList", responseData.get("quanHuyenList"));
        model.addAttribute("currentPage", responseData.get("currentPage"));
        model.addAttribute("totalPages", responseData.get("totalPages"));
        model.addAttribute("totalCustomer", responseData.get("totalCustomer"));
        model.addAttribute("totalXe", responseData.get("totalXe"));
        model.addAttribute("totalChuyenXe", responseData.get("totalChuyenXe"));
        model.addAttribute("tongDoanhThuThangHienTai", responseData.get("tongDoanhThuThangHienTai"));
        
        return "admin/BusRoute";
    }
	
	@GetMapping("/bus-trip")
    public String busTripPage(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "chuyenxe" + "?page=" + page;
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();
        model.addAttribute("chuyenXeList", responseData.get("chuyenXeList"));
        model.addAttribute("tuyenXeList", responseData.get("tuyenXeList"));
        model.addAttribute("xeList", responseData.get("xeList"));
        model.addAttribute("nguoiDungList", responseData.get("nguoiDungList"));
        model.addAttribute("currentPage", responseData.get("currentPage"));
        model.addAttribute("totalPages", responseData.get("totalPages"));
        return "admin/BusTrip";
    }
	
	@GetMapping("/bus")
    public String busPage(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "xe" + "?page=" + page;
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();
        model.addAttribute("xeList", responseData.get("xeList"));
        model.addAttribute("loaiXeList", responseData.get("loaiXeList"));
        model.addAttribute("currentPage", responseData.get("currentPage"));
        model.addAttribute("totalPages", responseData.get("totalPages"));
        return "admin/Bus";
    }
    
    @GetMapping("/location")
    public String locationPage(@RequestParam(value = "pageQuan", defaultValue = "1") int pageQuan, 
    							@RequestParam(value = "pageTinh", defaultValue = "1") int pageTinh, Model model) {
    	RestTemplate restTemplate = new RestTemplate();
        String apiUrlWithParams = API_URL + "diadiem" + "?pageQuan=" + pageQuan + "&pageTinh=" + pageTinh;
        ResponseEntity<Map> response = restTemplate.getForEntity(apiUrlWithParams, Map.class);

        Map<String, Object> responseData = response.getBody();
        model.addAttribute("quanHuyenList", responseData.get("quanHuyenList"));
        model.addAttribute("tinhThanhList", responseData.get("tinhThanhList"));
        model.addAttribute("currentQuanPage", responseData.get("currentQuanPage"));
        model.addAttribute("totalQuanPages", responseData.get("totalQuanPages"));
        model.addAttribute("currentTinhPage", responseData.get("currentTinhPage"));
        model.addAttribute("totalTinhPages", responseData.get("totalTinhPages"));

        return "admin/Location";
    }
    
    @GetMapping("/ticket")
	public String ticketPage() {

		return "admin/Ticket";
	}
}


