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
final _headers = {'Content-Type': 'application/json'};

/// Xử lý các yêu cầu dẫn đến các đường dẫn không được định nghĩa (404 Not Found)
Response _notFoundHandler(Request req) {
  return Response.notFound('Không tìm thấy đường dẫn "${req.url}" trên server');
}

/// Hàm xử lý các yêu cầu gốc tại đường dẫn "/"
Response _rootHandler(Request req) {
  return Response.ok(
    json.encode({'message': 'Hello, World!'}),
    headers: _headers,
  );
}

/// Hàm xử lý yêu cầu tại đường dẫn `/api/v1/check`
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
    /// Đọc payload từ request
    final payload = await req.readAsString();

    // Giải mã JSON từ payload
    final data = json.decode(payload);

    // Lấy các giá trị từ data
    final studentId = data['studentId'] as String?;
    final name = data['name'] as String?;
    final className = data['class'] as String?;
    final schoolName = data['school'] as String?;

    // Kiểm tra tính hợp lệ của các trường
    if (studentId != null &&
        studentId.isNotEmpty &&
        name != null &&
        name.isNotEmpty &&
        className != null &&
        className.isNotEmpty &&
        schoolName != null &&
        schoolName.isNotEmpty) {
      // Tạo phản hồi chào mừng
      final response = {
        'message':
            'Thông tin đã nhận: Mã sinh viên: $studentId, Tên: $name, Lớp: $className, Trường: $schoolName'
      };

      return Response.ok(
        json.encode(response),
        headers: _headers,
      );
    } else {
      final response = {'message': 'Vui lòng cung cấp đầy đủ thông tin.'};
      return Response.badRequest(
        body: json.encode(response),
        headers: _headers,
      );
    }
  } catch (e) {
    final response = {'message': 'Yêu cầu không hợp lệ. Lỗi: ${e.toString()}'};
    return Response.badRequest(
      body: json.encode(response),
      headers: _headers,
    );
  }
}

void main(List<String> args) async {
  // Lắng nghe trên tất cả các địa chỉ IPV4
  final ip = InternetAddress.anyIPv4;

  final corsHeader = createMiddleware(
    requestHandler: (req) {
      if (req.method == 'OPTIONS') {
        return Response.ok('', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, HEAD',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        });
      }
      return null; // Tiếp tục xử lý các yêu cầu khác
    },
    responseHandler: (res) {
      return res.change(headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, HEAD',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      });
    },
  );

  final handler = Pipeline()
      .addMiddleware(corsHeader)
      .addMiddleware(logRequests())
      .addHandler(_router.call);

  // Để chạy trong các container, chúng ta sẽ sử dụng biến môi trường PORT.
  final port = int.parse(Platform.environment['PORT'] ?? '5000');

  // Khởi chạy server tại địa chỉ và cổng chỉ định
  final server = await serve(handler, ip, port);
  print('Server đang chạy tại http://${server.address.host}:${server.port}');
}
