# Video Focus — Cập nhật v0.2.0

Dành cho bản Windows portable đã tải trước đó.

[Tải VideoFocus-Update-v0.2.0.zip](https://github.com/lequang1234561214-rgb/dd/raw/refs/heads/updates-v0.2.0/VideoFocus-Update-v0.2.0.zip)

1. Đóng ứng dụng Video Focus.
2. Giải nén toàn bộ ZIP cập nhật, mở `Cap-nhat.cmd`.
3. Chọn thư mục ứng dụng cũ chứa `runtime`, `tools` và `VideoFocus.ps1` — thường là `app/VideoFocus-Windows-x64` bên trong thư mục gói cũ.
4. Sau cập nhật, dùng **Nhanh + NVIDIA RTX / NVENC + 1 video đồng thời**.

Bản cập nhật kiểm tra checksum, sao lưu tệp cũ và khôi phục khi có lỗi thay tệp.
Không kèm runtime mới; cần bộ portable v0.1 đã giải nén trước đó.

Thay đổi: chỉ xuất MP4, không chụp ảnh; tắt zoom tự động; giữ chế độ khung hình
ít nhất5giây giữa các lần đổi (cắt cảnh gốc có thể reset); thư viện phân tích
cục bộ tối đa128MiB; NVENC khi driverGPU sẵn sàng và tự dùng CPU khi không cóGPU;
giảm tính toán nền và gộp âm thanh trong một lần xuất.

Thư viện phân tích hữu ích khi xuất lại cùng nội dung video; video mới vẫn phải
phân tích lần đầu. Nhận diện người nói vẫn là ước lượng, có thể nhầm.

25 kiểm tra Linux đạt. BinaryWindows dưới Wine đạt kiểm tra MP4-only, cache và
đường dẫn tiếng Việt. Chưa đo RTX3060 thực tế hoặc kiểm thử GUI trên Windows thật.
Trong bài thử CPU tổng hợp6giây, riêng render nhanh hơn5,4–5,9lần; RAM gần như không
đổi. Đây không phải cam kết tốc độ tổng thể hay tốc độNVENC trên máy người dùng.
