import 'package:http_learn/http_learn.dart' as http_learn;
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  print('Hello world: ${http_learn.calculate()}!');
  sendGetRequest();

}

void sendGetRequest() async {
    final url = Uri.parse("https://baidu.com");
    final response = await http.get(url);
    print('Response status:${response.statusCode}');
    print('Response body:${response.body}');
  }
