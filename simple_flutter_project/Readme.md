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
 1. Chỉnh sửa file `backend/bin/server.dart`:
 - Mở file `server.dart` và chỉnh sửa:
 ```
 import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

/// Cấu hình các routes
final _router = Router(notFoundHandler: _notFoundHandler)
  ..get('/', _rootHandler)
  ..get('/api/v1/check', _checkHandler)
  ..get('/api/v1/echo/<message>', _echoHandler)
  ..post('/api/v1/submit', _submitHandler);

/// Header mặc định cho dữ liệu trả về dưới dạng JSON
final _headers = {'Content-Type': 'aplication/json'};

/// Xử lý các yêu cầu dẫn đến các đường dẫn không được định nghĩa(404 Not Found)
Response _notFoundHandler(Request req) {
  return Response.notFound('Không tìm thấy đươngf dẫn "$req.url" trên sever');
}

///Hàm sử lý các yêu cầu gốc tại đường dẫn "/"
///
///Trả về một phản hồi với thông điệp "Hello,World!" dưới dạng Json
///
///`reg`:Đối tượng yêu cầu từ cilent
///
///Trả về:Một đối tượng `Response`với mã trạng thái 200 và nội dung JSON

Response _rootHandler(Request req) {
  // Constructor `ok` của Response có statusCode là 200
  return Response.ok(
    json.encode({'mesage': 'Hello, World!'}),
    headers: _headers,
  );
}

///Hàm xử lý yêu càu tại đường dẫn `/api/v1/check`
Response _checkHandler(Request req) {
  return Response.ok(
    json.encode({'message': 'Chào mừng bạn đến với ứng dụng web di động'}),
    headers: _headers,
  );
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Future<Response> _submitHandler(Request req) async {
  try {
    ///Đọc payload từ request

    final payload = await req.readAsString();

    //Giải mã JSON từ payload
    final data = json.decode(payload);

    //Lấy giá trị 'name' từ data,ép kiểu về String? nếu có
    final name = data['name'] as String?;

    //Kiểm tra 'name hợp lệ'
    if (name != null && name.isNotEmpty) {
      //Tạo phản hồi chào mừng
      final response = {'message': 'Chào mừng $name'};

      //Trả về phản hồi với satatusCode 200 với nội dung JSON
      return Response.ok(
        json.encode(response),
        headers: _headers,
      );
    } else {
      //Tạo phản hồi yêu cầu cug cấp tên
      final response = {'message': 'Sever không nhận được tên của bạn.'};
      //Trả về phản hôi với statusCode 400 và nội dung JSON
      return Response.badRequest(
        body: json.encode(response),
        headers: _headers,
      );
    }
  } catch (e) {
    ///Xử lý ngoại lệ khi giải mã JSON
    final response = {'message': 'Yêu cầu không hợp lệ  . Lỗi ${e.toString()}'};
    //Trả về phản hôi với statusCode 400
    return Response.badRequest(
      body: json.encode(response),
      headers: _headers,
    );
  }
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '3000');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}

 ```
 2. Debug backend và kiểm thử Postman
  3. Thêm Middleware xử lý CORS cho backend
   - **CORS là gì?** CORS (Cross-Origin Resource Sharing) là một cơ chế bảo mật được các trình duyệt web sử dụng để ngăn chặn các trang web gửi yêu cầu đến một domain khác với domain của trang hiện tại. Điều này nhằm bảo vệ người dùng khỏi các cuộc tấn công CSRF (Cross-Site Request Forgery) và các mối đe doạn bảo mật khác.
 - **Vì sao cần thêm CORS middleware?** Khi frontend (Flutter Web) gửi yêu cầu HTTP đến backend trên một domain khác, trình duyệt web sẽ chặn yêu cầu do vi phạm chính sách cùng nguồn gốc (Same-Origin Policy). Các yêu cầu từ Flutter Web (chạy trên localhost:8081) đến server backend (chạy trên localhost:8080) sẽ bị chặn nếu server không xử lý đúng các header CORS. Trình duyệt sẽ gửi một yêu cầu OPTIONS (Preflight Request) để kiểm tra xem server có cho phép không. Nếu server không phản hồi đúng, yêu cầu chính sẽ không được gửi.
 - **Giải pháp**: Thêm Middleware xử lý CORS vào server backend để xử lý các yêu cầu OPTIONS bằng cách trả về các header CORS cần thiết. Thêm các header CORS vào tất cả các phản hồi từ server để trình duyệt cho phép giao tiếp giữa frontend và backend.
 - Cập nhật mã nguồn hàm main của server:
```dart
void main(List<String> args) async {
  // Lắng nghe trên tất cả các địa chỉ IPV4
  final ip = InternetAddress.anyIPv4;

  final corsHeader = createMiddleware(
    requestHandler: (req) {
      if (req.method == 'OPTIONS') {
        return Response.ok('', headers: {
          //Cho phép mọi nguồn truy cập (trong môi trường dev). Trong môi trường production chúng ta nên thay * bằng domain cụ thể.
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, HEAD',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        });
      }
      return null; //Tiếp tục sử lý các yêu cầu khác
    },
    responseHandler: (res) {
      return res.change(headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, HEAD',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      });
    },
  );

  // Cấu hình một pipeline để logs các requests và middleware
  final handler = Pipeline()
      .addMiddleware(corsHeader) // Thêm middleware xử lý CORS
      .addMiddleware(logRequests())
      .addHandler(_router.call);

  // Để chạy trong các container, chúng ta sẽ sử dụng biến môi trường PORT.
  // Nếu biến môi trường không được thiết lập nó sẽ sử dụng giá trị từ biến
  // môi trường này; nếu không, nó sẽ sử dụng giá trị mặc định là 8080.
  //Tại đây với máy đang sử dụng phải đổi giá trị là 3000
  final port = int.parse(Platform.environment['PORT'] ?? '3000');

  // Khởi chạy server tại địa chỉ và cổng chỉ định
  final server = await serve(handler, ip, port);
  print('Server đang chạy tại http://${server.address.host}:${server.port}');
}

```

 ### Bước 7:Phát triển frontend và tích hợp hệ thống
