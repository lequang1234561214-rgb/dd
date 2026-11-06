# Video Focus v0.3 — Cập nhật biểu cảm và zoom cận mặt

[Tải VideoFocus-Update-v0.3.0.zip](https://github.com/lequang1234561214-rgb/dd/raw/refs/heads/updates-v0.3.0/VideoFocus-Update-v0.3.0.zip)

## Cài vào bộ tool hiện có

1. Đóng Video Focus và hộp thoại lỗi nếu có.
2. Giải nén toàn bộ gói cập nhật rồi mở **Cap-nhat.cmd**.
3. Chọn thư mục tool cũ chứa `runtime`, `tools`, `VideoFocus.ps1` — thường là
   `app/VideoFocus-Windows-x64` trong gói đã tải.
4. Cập nhật xong, cửa sổ hiện **Video Focus v0.3.0**. Tùy chọn
   **Zoom cận mặt theo biểu cảm** bật mặc định.

Gói dùng lại Python/OpenCV/FFmpeg có sẵn; kèm hai mô hình ngoại tuyến khoảng5MB,
license và checksum. Có thể cập nhật trực tiếp từ v0.1, v0.2 hoặc v0.2.1.
Tệp cũ được sao lưu; video và thư viện phân tích được giữ lại.

## Luồng zoom

Nhận diện7biểu cảm bằng MobileFaceNet + căn chỉnh5điểm YuNet. Tín hiệu cần được
xác nhận theo thời gian. Mỗi điểm nhấn: vào mượt khoảng1giây → **giữ cận≥5giây
sau khi vào khung hoàn tất** → ra mượt khoảng1giây. Bám cùng track, không có
nhịp zoom lặp; cảnh quá ngắn hoặc mất dấu lâu được bỏ qua. Chỉ xuất MP4, giữ
NVENC và cache. Các nhãn là dự đoán biểu cảm, không bảo đảm hiểu cao trào câu chuyện.

85 kiểm tra đã đạt; binaryWindows trong Wine vượt kiểm tra DNN và giữ cận tổng
hợp. Chưa kiểm thử GUI trên Windows thật hay đo RTX3060 trực tiếp. Xem
`VALIDATION-v0.3.txt`, `HUONG-DAN.txt` và `models/NOTICE.txt` trong ứng dụng.
