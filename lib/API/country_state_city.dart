import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> csc_Data() async {
  final response = await http.get(
    Uri.parse('https://www.universal-tutorial.com/api/getaccesstoken'),
    headers: {
      "Accept": "application/json",
      "api-token": "AuXnFjES43NqbdODZoc1anLtpO9op_9HsA7hqU56HJoxlbbNrMsUAzmsp6cqoZ0HhWQ",
      "user-email": "sivamuthuraj1999@gmail.com"
    },
  );

  if (response.statusCode == 200) {
    var data = response.body;
    var jsonData = jsonDecode(data);
    print(jsonData["auth_token"]);
    await csc_Data_country(jsonData["auth_token"]);
  } else {
    print('Request failed with status1: ${response.statusCode}');
  }
}
Future<void> csc_Data_country(String token) async {
  final response = await http.get(
    Uri.parse('https://www.universal-tutorial.com/api/countries/'),
    headers: {
      'Authorization': 'Bearer ${token}',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    print('Response Body: ${response.body}');
  } else {
    print('Request failed with status: ${response}');
  }
}
