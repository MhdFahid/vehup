import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 6, 14, 41),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("message"),
          ),
        ],
      ),
    );
  }
}
