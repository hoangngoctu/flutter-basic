import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Hàm main là điểm bắt đầu của ứng dụng
void main() {
  runApp(const MainApp()); // Chạy ứng dụng với Widget MainApp
}

/// Widget MainApp là widget gốc của ứng dụng
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt biểu tượng debug ở góc phải trên
      title: 'Ứng dụng full-stack flutter đơn giản',
      home: MyHomePage(),
    );
  }
}

/// Widget MyHomePage là trang chính của ứng dụng
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Lớp State cho MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  /// Controllers để lấy dữ liệu từ Widget TextField
  final studentIdController = TextEditingController();
  final nameController = TextEditingController();
  final classController = TextEditingController();
  final schoolNameController = TextEditingController();

  /// Biến để lưu thông điệp phản hồi từ server
  String responseMessage = '';

  /// Sử dụng địa chỉ IP thích hợp cho backend
  String getBackendUrl() {
    if (kIsWeb) {
      return 'http://localhost:5000'; // Đổi cổng từ 8080 sang 5000
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:5000'; // cho emulator
      // return 'http://192.168.1.x:5000'; // cho thiết bị thật khi truy cập qua LAN
    } else {
      return 'http://localhost:5000'; // Đổi cổng từ 8080 sang 5000
    }
  }

  /// Hàm để gửi thông tin lên server
  Future<void> sendData() async {
    // Lấy thông tin từ các TextField
    final studentId = studentIdController.text;
    final name = nameController.text;
    final className = classController.text;
    final schoolName = schoolNameController.text;

    // Xóa nội dung trong các controller
    studentIdController.clear();
    nameController.clear();
    classController.clear();
    schoolNameController.clear();

    final backendUrl = getBackendUrl();

    // Endpoint submit của server
    final url = Uri.parse('$backendUrl/api/v1/submit');
    try {
      // Gửi yêu cầu POST tới server
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'studentId': studentId,
              'name': name,
              'class': className,
              'school': schoolName,
            }),
          )
          .timeout(const Duration(seconds: 10));

      // Kiểm tra nếu phản hồi có nội dung
      if (response.body.isNotEmpty) {
        // Giải mã phản hồi từ server
        final data = json.decode(response.body);

        // Cập nhật trạng thái với thông điệp nhận được từ server
        setState(() {
          responseMessage = data['message'];
        });
      } else {
        // Phản hồi không có nội dung
        setState(() {
          responseMessage = 'Không nhận được phản hồi từ server';
        });
      }
    } catch (e) {
      // Xử lý lỗi kết nối hoặc lỗi khác
      setState(() {
        responseMessage = 'Đã xảy ra lỗi: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ứng dụng full-stack flutter đơn giản')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: studentIdController,
              decoration: const InputDecoration(labelText: 'Mã sinh viên'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Tên'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: classController,
              decoration: const InputDecoration(labelText: 'Lớp'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: schoolNameController,
              decoration: const InputDecoration(labelText: 'Tên trường'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: sendData,
              child: const Text('Gửi'),
            ),
            // Hiển thị thông điệp phản hồi từ server
            Text(
              responseMessage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
