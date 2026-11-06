# Video Focus — Bản vá v0.2.1

Sửa lỗi PowerShell `Index operation failed; the array index evaluated to null`
trong giao diện v0.2: biến cấu hình đã ghi đè đối tượng ô lựa chọn. Bản vá tách tên
biến giao diện/cấu hình, kiểm tra chỉ số lựa chọn và ngăn bấm bắt đầu trùng.

[Tải VideoFocus-Update-v0.2.1.zip](https://github.com/lequang1234561214-rgb/dd/raw/refs/heads/updates-v0.2.1/VideoFocus-Update-v0.2.1.zip)

1. Đóng toàn bộ cửa sổ Video Focus và hộp thoại lỗi.
2. Giải nén ZIP vá, mở Cap-nhat.cmd.
3. Chọn thư mục tool cũ chứa runtime, tools và VideoFocus.ps1
   (thường là app/VideoFocus-Windows-x64 trong gói đã tải).
4. Sau cập nhật, tiêu đề cửa sổ hiển thị Video Focus v0.2.1.

Có thể vá trực tiếp bản v0.1 hoặc v0.2; không cần tải lại Python/FFmpeg.
Gói có checksum, sao lưu và hoàn nguyên khi thay tệp lỗi. Giữ các tối ưu v0.2:
NVENC tùy thiết bị, cache metadata, chỉ xuất MP4, không tự zoom và hạn chế đổi crop.

Đã tái hiện đúng lỗi và chạy hồi quy PowerShell trên handler thật với đối tượng
UI mô phỏng: nhiều batch, thay lựa chọn, worker args, chống click trùng và lựa chọn
rỗng. Đã cài thử chính ZIP này và kiểm tra bản sao/tệp video giữ nguyên. Native
WinForms trên Windows thật vẫn cần được kiểm tra trên máy người dùng.
