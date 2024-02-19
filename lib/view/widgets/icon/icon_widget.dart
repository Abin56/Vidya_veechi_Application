import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:vidya_veechi/view/colors/colors.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String text;
  final String icon;
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
        width: 105.w, //110
        height: 110.h,
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
                  icon,
                  fit: BoxFit.contain,
                  height: 40,width: 40,
                  scale: 2,
                ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
