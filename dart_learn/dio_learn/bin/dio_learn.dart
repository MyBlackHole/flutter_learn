import 'package:dio/dio.dart';
import 'package:dio_learn/dio_learn.dart' as dio_learn;

void main(List<String> arguments) {
  print('Hello world: ${dio_learn.calculate()}!');
  getData();
}

void getData() async {
  try {
    var response = await Dio().get("https://baidu.com");
    print('data ${response.data}');
    print('headers ${response.headers}');
  } catch (e) {
    print(e);
  }
}
