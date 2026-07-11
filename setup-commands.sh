#!/bin/bash
---
# 1. Các lệnh chạy tại máy cá nhân (Local)
# Khởi động SSH Agent ngầm
eval $(ssh-agent -s)

# Nạp Private Key (.pem) vào Agent
ssh-add /path/to/key-name.pem

# Kết nối vào Bastion Host bằng cơ chế chuyển tiếp key (-A)
ssh -A ec2-user@<PUBLIC_IP_BASTION>
---
# 2. Các lệnh chạy bên trong Bastion Host
# Nhảy chặng tiếp theo sang App Server bằng IP nội bộ
ssh ec2-user@<PRIVATE_IP_APP_SERVER>

---
# 3. Các lệnh chạy bên trong App Server (Private Subnet)
# Kiểm tra kết nối Internet một chiều qua NAT Gateway
ping -c 4 google.com
