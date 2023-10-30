import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final Gradient gradient;
  final Widget text;

  const GradientText({
    super.key,
    required this.gradient,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: text,
    );
  }
}
