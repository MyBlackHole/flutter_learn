// (flutter pub run build_runner build) result.g.dart 将在我们运行生成命令后自动生成
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  //{"code": 0, "method": "GET", "requestPrams": "shenlong"}
  final int userId;
  final int id;
  final String title;

  Result(this.userId, this.id, this.title);

  // 固定格式，不同的类使用不同的mixin即可
  // 这里声明一个工厂构造方法
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
