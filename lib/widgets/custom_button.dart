import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.title,
    this.active = false,
  });

  final Size size;
  final String title;
  final bool? active;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: active == false ? onTap : null,
      child: Container(
          width: size.width * 0.9,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xFF4A101D),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: active == true
                  ? CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 15,
                    )
                  : Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
    );
  }
}
