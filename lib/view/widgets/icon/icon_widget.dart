import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:dujo_kerala_application/view/colors/colors.dart';
import 'package:dujo_kerala_application/view/widgets/fonts/google_poppins.dart';
import 'package:dujo_kerala_application/view/widgets/fonts/google_salsa.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const ContainerWidget({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100.w, //110
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: adminePrimayColor.withOpacity(0.5))),
              child: Center(
                child: Image.asset(
                  'assets/flaticons/icons8-attendance-100.png',
                  fit: BoxFit.contain,
                  scale: 2,
                ),
              ),
            ),
            GooglePoppinsWidgets(text: 'Attendence', fontsize: 10)
          ],
        ),
      ),
    );
  }
}
