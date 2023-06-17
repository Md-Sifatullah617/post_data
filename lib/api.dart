import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getPostData(int start, int end) async {
  var url = Uri.parse(
      "https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$end");
  var response = await http.get(url);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if (resultCode == 200) {
    print("resultBody: $resultBody");
    return resultBody;
  } else {
    return [];
  }
}
