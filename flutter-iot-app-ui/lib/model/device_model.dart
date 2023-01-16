class DeviceModel {
  String token = "";
  String name = "";
  String color = "";
  String clickColor = "";
  bool isActive = false;
  String icon = "";

  DeviceModel({
    required this.token,
    required this.name,
    required this.color,
    required this.isActive,
    required this.icon,
    required this.clickColor,
  });

  DeviceModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    color = json['color'];
    isActive = json['isActive'];
    icon = json['icon'];
    clickColor = json['clickColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['color'] = this.color;
    data['isActive'] = this.isActive;
    data['icon'] = this.icon;
    data['clickColor'] = this.clickColor;
    return data;
  }
}
