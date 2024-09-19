import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///Hàm main là điểm bắt đầu của ứng dụng
void main() {
  runApp(const MainApp()); //Chạy ứng dụng với Widget MainApp
}

/// Widget MainApp là widget gốc của ứng dụng, sử dụng một StatelessWidget
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

///Widget MyHoamePage là trang chính của ứng dụng,sử dụng StatefulWidget
///để quản lý trạng thái do có nội dung cần tahy đổi trên trang này

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Lớp State cho MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  ///Controller để lấy dữ liêu từ Widget TextField
  final controller = TextEditingController();

  /// Biến để lưu thông điệp phản hồi từ server
  String responseMessage = '';

  ///Hàm để gửi tệp lên tới sever
  Future<void> sendName() async {
    //Lấy tên từ TextFiled
    final name = controller.text;
    //Sau khi lấy được tên hiển thị xóa nội dung trong controller
    controller.clear();

    //Endpoint submit của sever
    final url = Uri.parse('http://localhost:3000/api/v1/submit');
    try {
      //Gửi yêu cầu POST tới sever
     final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'name': name}),
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
      //Xử lý lỗi kết nối hoặc lỗi khác
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
              controller: controller,
              decoration: const InputDecoration(labelText: 'Tên'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: sendName,
              child: const Text('Gửi'),
            ),
            // Hiển thị thông điệp phản hồi từ server
            Text(
              responseMessage,
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
