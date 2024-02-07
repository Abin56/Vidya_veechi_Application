
import 'package:dujo_kerala_application/view/widgets/fonts/google_salsa.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
final  void Function()? onTap;

 const  ContainerWidget({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 2, top: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan),
                color: Colors.lightBlue.withOpacity(0.0),
                borderRadius: BorderRadius.circular(10)),
            width: 100,//110
            height: 80,//90
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientIcon(
                  icon: icon,
                  gradient: const LinearGradient(
                      //colors: [Colors.cyan,Colors.grey],
                //  colors: [Colors.black,Colors.indigo],
                   // colors: [Colors.brown,Colors.orange],
                   colors: [Colors.red, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GoogleSalsaWidgets(
                    text: text,
                    fontsize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}