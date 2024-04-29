import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatApi {
  Future<String> chat({required message}) async {
    http.Response response =
        await http.post(Uri.parse('http://10.0.2.2:5000/chat?'), body: {
      'msg': message,
    });
    // print(response.body);
    final decodedResponse = json.decode(response.body) as Map<String, dynamic>;

    return decodedResponse['CHATBOT'] + "<bot>";
  }
}
