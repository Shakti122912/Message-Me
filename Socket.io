<!-- public/index.html -->
<input type="text" id="messageInput" placeholder="Type a message...">
<button onclick="sendMessage()">Send</button>
<div id="chatArea"></div>

<script src="/socket.io/socket.io.js"></script>
<script>
  const socket = io();
  const partnerId = 'PARTNER_SOCKET_ID'; // Replace with actual user ID

  function sendMessage() {
    const message = document.getElementById('messageInput').value;
    socket.emit('private-message', { to: partnerId, message });
  }

  socket.on('private-message', ({ from, message }) => {
    const chatArea = document.getElementById('chatArea');
    chatArea.innerHTML += `<p>${from}: ${message}</p>`;
  });
</script>
