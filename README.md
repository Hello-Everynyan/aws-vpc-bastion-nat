1. Khởi tạo hạ tầng mạng: Tạo VPC, chia subnet (Public Subnet và Private Subnet) và cấu hình Route Table
2. Thiết lập lối thoát Internet một chiều (NAT Gateway): Tạo một NAT Gateway đặt tại Public Subnet và cấu hình Route Table của Private Subnet trỏ sang NAT để máy vùng kín có thể đi ra ngoài.
3. Cấu hình lớp bảo mật (Security Groups):* Tạo Bastion-SG mở cổng 22 cho IP máy cá nhân
* **Tạo App-Server-SG mở cổng 22 nhưng chỉ chấp nhận nguồn từ Bastion-SG
4. Triển khai máy chủ: Khởi tạo Bastion Host ở vùng Public (gắn đúng Key Pair) và App Server ở vùng Private
5. Sử dụng cơ chế SSH Agent Forwarding để thực hiện nhảy từ máy cá nhân -> Bastion Host -> App Server, sau đó test 'ping google.com' để xác thực đường mạng một chiều.
