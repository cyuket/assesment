import 'package:flutter/material.dart';
import 'package:luvit/app/src/theme/colors.dart';

class ScrollerIndexContainer extends StatelessWidget {
  const ScrollerIndexContainer({
    required this.isActive,
    super.key,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        height: 3,
        decoration: BoxDecoration(
          gradient: isActive
              ? const LinearGradient(
                  colors: [
                    Color(0xffFF006B),
                    Color(0xffFF4593),
                  ],
                )
              : null,
          color: !isActive ? LuvitColors.backgroundColor : null,
        ),
      ),
    );
  }
}
