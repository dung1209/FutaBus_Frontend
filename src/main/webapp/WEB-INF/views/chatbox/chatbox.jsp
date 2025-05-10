<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>FutaBot Chat</title>
  <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/user/css/chatbox.css">
</head>
<body>

<button id="chat-button"><img
					src="<%=request.getContextPath()%>/assets/user/image/chat.png"
					alt="icon_chat"></button>

<div id="chat-box" style="display:none;">
  <div class="chat-header">Chatbox FutaBus</div>
  <div id="chat-messages"></div>
  <div id="chat-input">
    <input type="text" id="user-input" placeholder="Nhập tin nhắn...">
    <button id="send-btn">Gửi</button>
  </div>
</div>

<script>
  window.onload = function () {
    const chatButton = document.getElementById("chat-button");
    const chatBox = document.getElementById("chat-box");
    const chatMessages = document.getElementById("chat-messages");
    const sendBtn = document.getElementById("send-btn");
    const input = document.getElementById("user-input");

    chatButton.addEventListener("click", () => {
      chatBox.style.display = chatBox.style.display === "none" || chatBox.style.display === "" ? "flex" : "none";
    });

    function addMessage(content, sender) {
      const msg = document.createElement("div");
      msg.className = 'message' + " " + sender;
      msg.textContent = content;
      chatMessages.appendChild(msg);
      chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    async function sendMessage() {
      const message = input.value.trim();
      if (!message) return;
      addMessage(message, "user");
      input.value = "";

      try {
        const res = await fetch("http://127.0.0.1:5000/chat", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ message })
        });

        const data = await res.json();
        addMessage(data["Câu trả lời"], "bot");
      } catch (err) {
        addMessage("Lỗi kết nối đến máy chủ.", "bot");
      }
    }

    sendBtn.addEventListener("click", sendMessage);
    input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") sendMessage();
    });
  };
</script>

</body>
</html>
