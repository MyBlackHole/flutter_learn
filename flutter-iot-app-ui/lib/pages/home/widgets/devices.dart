import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_ui_challenge/client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class Devices extends StatelessWidget {
  MqttClient? client;
  var topic = "flutter/gate/1";

  final String token;

  final String name;
  final String svg;
  final Color color;
  final bool isActive;
  final Function(bool) onChanged;

  Devices(
      {Key? key,
      required this.token,
      required this.name,
      required this.svg,
      required this.color,
      required this.onChanged,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: (details) {
        publishMessage(topic, token);

        HapticFeedback.vibrate();
        onChanged(true);
      },
      onTapUp: (details) {
        HapticFeedback.vibrate();
        onChanged(false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 0.6,
          ),
          color: isActive ? color : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    svg,
                    color: isActive ? Colors.white : Colors.black,
                    height: 30,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: 65,
                    child: Text(
                      name,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        color: isActive ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
