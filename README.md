# Control-SSP-base-on-Fuzzy-Genetic-Controller

# Description

Đây là dự án điều khiển giàn khoan bán tiềm thủy dựa trên giải thuật Genetic kết hợp Fuzzy Logic. Mục tiêu chính là xây dựng và kiểm chứng các giải pháp điều khiển thích nghi cho giàn khoan bán tiềm thủy trong trường hợp mô phỏng và trên mô hình thực tế.
# Mô hình giàn khoan
Mô hình được thiết lập dựa trên giàn Stena Don Rig thực tế, từ đó:
- Phân tích cấu trúc di chuyển của bán tiềm thủy.

- Xác định các chế độ làm việc khác nhau (định vị trí, di chuyển theo hành trình).

- Các yếu tố ảnh hưởng đến quá trình hoạt động.

- Mô phỏng toàn bộ hệ thống trên môi trường Matlab/Simulink để đánh giá hiệu suất và độ ổn định.
# Giải pháp điều khiển
Chúng tôi phát triển hai giải pháp chính:
- Adaptive Fuzzy Controller đo sai số (hiệu giữa giá trị mong muốn và giá trị thực tế) cùng với tốc độ thay đổi của sai số, sau đó áp dụng các quy tắc mờ để tính ra tín hiệu điều khiển phù hợp.
- CFGOC (Constrained Fuzzy Genetic Optimized Controller)	Tối ưu hóa hiệu năng & tuân thủ ràng buộc lực đẩy	Kết hợp Genetic để điều chỉnh tham số Fuzzy, xét đến giới hạn lực và góc quay chân vịt.
# Mô hình thử nghiệm thực nghiệm
Nhằm kiểm chứng tính hiệu quả của giải pháp, mô hình giàn khoan bán tiềm thuỷ được phát triển theo giàn Stena Don với tỉ lệ 1:100 so với kích thước thật Stena Don.
Xây dựng hệ thống nhúng bao gồm:
- Bộ điều khiển trung tâm (STM32F767).
- Mạch drive cho động cơ cho 4 hệ động lực đẩy chân vịt.
- Hệ động cảm biến Lidar thu thập vị trí và Compass thu thập hướng.
- Hệ thống điều khiển và giám sát từ xa.
# Yêu cầu 
Cài đặt Matlab R2023b trở lên kèm Simulink

Toolbox Fuzzy Logic

Global Optimization.
# Cài đặt & Hướng dẫn sử dụng

Mô phỏng: 
- Chạy tập lệnh Parameter.m để khởi tạo thông số mô hình.
- Thêm thư viện GNC vào máy 
- Mở thư mục 2. Simulation -> DP_GA_DeltaM.slx để xem mô hình.
- Nhấn run để tiến hành mô phỏng.

Thực nghiệm:
- Chạy tập lệnh Parameter.m để khởi tạo thông số mô hình và giải thuật.
- Mở thư mục 2. Simulation -> CFGOC_SSPUT02.slx để xem mô hình.
- Nhấn build Load and Run để xây dựng chương trình và nạp xuống STM32F676.


# Cấu trúc thư mục

- 0. Configuration Parameter. chúa các file thiết lập hàm mờ, thông số khởi tạo mô hình
- 1. Training CFGOC. chứa các file để mô phỏng giải pháp trên Simulink, script chạy mô phỏng, kết quả đầu ra mẫu.
- 2. Experiment. chứa các file để xây dựng mã nhúng, sơ đồ mạch drive và hướng dẫn phần cứng.
- 3. Result. các kết quả thực nghiệm bao gồm mô phỏng và thực nghiệm được tác lưu trữ trên một thứ mục trong cả 2 trường học thử và thực nghiệm. 


Bản quyền thuộc về nhóm nghiên cứu AIT. Mọi thắc mắc hoặc đóng góp vui lòng mở Issue trên GitHub hoặc liên hệ tác giả.