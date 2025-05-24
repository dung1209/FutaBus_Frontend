<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Đang xử lý đăng nhập...</title></head>
<body>
<script>
    const params = new URLSearchParams(window.location.search);
    const email = params.get("email");

    if (email) {
        fetch("http://localhost:8085/FutaBus_Backend/api/user/get-by-email?email=" + encodeURIComponent(email))
            .then(res => res.json())
            .then(data => {
                if (data.status === "success") {
                    localStorage.setItem("nguoiDung", JSON.stringify(data.nguoiDung));
                    window.location.href = "http://localhost:8086/FutaBus_Frontend";
                } else {
                    alert("Đăng nhập thất bại!");
                }
            })
            .catch(err => {
                alert("Lỗi khi đăng nhập.");
                console.error(err);
            });
    } else {
        alert("Không nhận được email từ redirect.");
    }
</script>
</body>
</html>
