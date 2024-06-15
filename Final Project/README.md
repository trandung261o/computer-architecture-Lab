### Curiosity Marsbot

Curiosity Marsbot là một xe tự hành trên sao Hỏa, được điều khiển từ xa bởi các lập trình viên trên Trái Đất. Quá trình di chuyển của Marsbot được điều khiển thông qua các mã lệnh được gửi từ một bàn phím ma trận. Các mã lệnh này được định nghĩa như sau:

| Mã điều khiển | Ý nghĩa |
|---------------|---------|
| 1b4 | Marsbot bắt đầu chuyển động |
| c68     | Marsbot đứng im |
| 444     | Rẽ trái 90 độ so với phương hướng hiện tại và giữ hướng mới |
| 666     | Rẽ phải 90 độ so với phương hướng hiện tại và giữ hướng mới |
| dad     | Bắt đầu để lại vết trên đường |
| cbc          | Chấm dứt để lại vết trên đường |
|   999            | Tự động quay trở lại theo lộ trình ngược lại mà không vẽ vết và không nhận mã lệnh khác cho đến khi kết thúc lộ trình ngược |

**Mô tả:**
Marsbot được lập trình để ghi nhớ toàn bộ lịch sử các mã lệnh và khoảng thời gian giữa các lần thay đổi mã. Điều này cho phép Marsbot có thể quay trở lại điểm xuất phát theo lộ trình ngược lại (dù có thể lệch một chút do hàm syscall sleep không thực sự thời gian thực).

Sau khi nhận mã lệnh, Curiosity Marsbot sẽ không thực thi ngay mà phải chờ lệnh kích hoạt từ bàn phím Keyboard & Display MMIO Simulator. Có hai lệnh kích hoạt như sau:

| Kích hoạt mã | Ý nghĩa |
|--------------|---------------|
| Enter        | Kết thúc nhập mã và yêu cầu Marsbot thực thi |
| Del          | Xóa toàn bộ mã lệnh đang nhập dở dang |

**Yêu cầu:**
Hãy lập trình để Marsbot có thể hoạt động như đã mô tả. Đồng thời, bổ sung thêm tính năng: mỗi khi gửi một mã lệnh cho Marsbot, hiển thị mã đó lên màn hình console để người xem có thể giám sát lộ trình của xe.
