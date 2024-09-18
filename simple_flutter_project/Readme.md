# Làm quen với ứng dụng web động đơn giản sử dụng Flutter và Dart

Trong bài lab này tôi sẽ hướng dẫn phát triển ứng dụng full-stack đơn giản với Dart và Flutter bao gồm backend và frontend.

Việc sử dụng các framework hiện đại trong phát triển ứng dụng web giúp tăng tốc quá trình phát triển và dễ dàng quản lý dự án. Flutter là một công cụ phát triển ứng dụng đa nền tảng, cho phép chúng ta tạo ra các ứng dụng cho web, di động (Android, iOS) và desktop (Windows, macOS và Linux) từ cùng một dự án mã nguồn (codebase). Điều này giúp chúng ta tiết kiệm thời gian và công sức khi chúng ta chỉ cần viết mã một lần mà có thể biên dịch để chạy trên nhiều nền tảng khác nhau.

Quá trình biên dịch và phát hành ứng dụng web từ Dart và Framework sẽ tự động sinh ra mã cho backend và mã cho frontend (HTML, CSS và JavaScript) mà chúng ta không cần phải viết chúng trực tiếp. Điều này giúp chúng ta tập trung vào logic ứng dụng và giảm thiểu thời gian viết mã lặp lại. Tương tự, khi biên dịch ra các nền tảng di động hay desktop, chúng cũng sinh ra ứng dụng native trên cùng một codebase.
 ## Mục tiêu
 - Hiểu và áp dụng được các khái niệm cơ bản về ứng dụng web động, ứng dụng đa nền tảng.
 - Sử dụng Flutter framework để tạo giao diện đơn giản cho một ứng dụng.
 - Sử dụng Dart và thư viện shelf, shelf_router để tạo server đơn giản xử lý các yêu cầu HTTP theo chuẩn RESTful API.
 - Tích hợp giao diện với logic xử lý phản hồi từ server, thực hiện thao tác gửi dữ liệu từ client lên server thông qua HTTP POST.
 - Kiểm thử đơn giản với Postman để kiểm tra phản hồi từ server đối với các yêu cầu GET và POST, bao gồm cả trường hợp hợp lệ và không hợp lệ.

 ## Cấu trúc thư mục
Để tiện cho việc quản lý và có thể đẩy lên GitHub, chúng ta sẽ cài đặt backend và frontend trong cùng một thư mục dự án.

```
simple_flutter_project\
|-- frontend/ # thư mục chứa mã nguồn Dart và Flutter cho frontend
|-- backend/  # thư mục chứa mã nguồn Dart cho backend
```



## Các bước thực hiện
### Bước 1 :Khởi tạo dự án
1. Tạo thư mục gốc chứa dự án simple_flutter_project`
2. Tạo thư mục backend và frontend trong thư mục `simple_flutter_project` như cấu trúc ở trên
3. Mở ứng dụng VS Code và mở thư mục `simple_flutter_project`

### Bước 2 :Tạo ứng dụng sever cho backend và Dart farmework

1. Đi đến thư mục backend từ thư mục `simple_flutter_project`
 ```
 cd backend
  ```

2. Khởi tạo dự án Dart mới cho sever
  ```
  dart create -t server-shelf . --force
  ```



Lưu ý:

 - Nếu bạn chưa cài Flutter, hãy truy cập vào https://docs.flutter.dev/get-started/install/windows/web để tải về và cài đặt theo hướng dẫn. Bạn có thể chọn theo nền tảng Windows hoặc macOS của bạn.
 - Lệnh dart `create -t server-shelf . --force` sẽ tạo một dự án Dart với mẫu `-t, template` là `server-shelf `trong thư mục hiện tại `.` và tham số `--force `cho biết sẽ tạo dự án cho dù thư mục gốc đã tồn tại (mặc định là sẽ tạo mới thư mục).
3. Thêm các thư viện vào dự án backend nếu cần.
 - Trong ứng dụng mẫu `server-shelf`, dự án đã sử dụng các thư viện `shelf` và `shelf-router` trong tệp `pubspec.yaml`.
 - Các bạn có thể xem các thư viện khác ở trang https://pub.dev trên đó mình cũng có tạo một số package cho cộng đồng. Bạn có thể xem mô tả, ví dụ và hướng dẫn cài đặt.

 ### Bước 3: Tạo ứng dụng frontend bằng Flutter framework

 - Quay lại thư mục dự án chính (nếu bạn đang ở thư mục backend)

 ```
 cd ..
 ```
 - Chuyển đến thư mục frontend
 ```
 cd frondend
 ```
  - Khởi tạo dự án Flutter mới trong thư mục frontend

  ```
  flutter create -e .
  ```
Lưu ý: Lệnh trên sẽ tạo một dự án Flutter mới trong thư mục frontend với mẫu là `Empty Application` hay tham số `-e` và tham số dấu chấm `.` cho biết sẽ khởi tạo trong thư mục hiện tại là thư mục `frontend`.

 - Thêm thư viên `http` vào dự án frontend

 ```
 flutter pub add http
 ```

 ### Bước 4:Thiết lập debug cho cả backend và frontend

  - Mở tệp `frontend/lib/main`.dart trước
  - Chọn `Run and Debug` ở thanh Side Bar và chọn `create a launch.json file` để tạo file cấu hình gỡ lỗi (debug).
  - Tiến hành gỡ lỗi backend và frontend Lưu ý: Chúng ta thiết lập cổng mặc định cho server backend là 8080 và cổng mặc định cho frontend là 8081 khi debug. Các bạn có thể thay đổi cổng.

  ## Bước 5: Đẩy dự án mã nguồn lên GitHub và quản lý mã nguồn
 - Chọn `Source Control` ở thanh Side Bar và chọn `Publish to GitHub`.
 - Quản lý mã nguồn bằng cách commit, push (Sync Changes...), pull,... từ cửa sổ `Source Control`. Lưu ý: Nếu bạn chưa có Git thì hãy cài Git (tham khảo google). Cũng cần một chút kiến thức sử dụng GitHub từ google cũng khá là dễ.

 ### Bước 6:Phát triển backend và kiểm thử

 ### Bước 7:Phát triển frontend và tích hợp hệ thống
