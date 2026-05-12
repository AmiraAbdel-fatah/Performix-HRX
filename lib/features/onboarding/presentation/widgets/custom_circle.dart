import 'package:flutter/cupertino.dart';

class CustomCircle extends StatelessWidget {
  final Color color;
  final double size;
  final double opacity;

  const CustomCircle({
    super.key,
    required this.color,
    required this.size,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}
