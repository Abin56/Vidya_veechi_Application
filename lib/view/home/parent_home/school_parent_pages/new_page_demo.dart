import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: 100,
                  color: Colors.amber,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
