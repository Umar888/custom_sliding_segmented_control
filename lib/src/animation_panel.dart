import 'package:flutter/material.dart';

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    super.key,
    required this.offset,
    required this.index,
    required this.totalItemsLength,
    required this.alignment,
    required this.width,
    required this.height,
    required this.hasTouch,
    required this.duration,
    required this.curve,
    required this.margin,
    this.decoration,
  });

  final double offset;
  final int index;
  final int totalItemsLength;
  final Alignment alignment;
  final double? width;
  final double? margin;
  final double? height;
  final Duration duration;
  final Curve curve;
  final bool hasTouch;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final double m = margin ?? 0;

    double adjustedOffset = isRtl ? offset * -1 : offset;

    if (index == 0) {
      // first item → only right margin
      adjustedOffset += 0;
    }
    else if (index == totalItemsLength - 1) {
      // last item → full margin on left
      adjustedOffset += m;
    }
    else {
      // middle items → half margin both sides
      adjustedOffset += m / 2;
    }

    return AnimatedContainer(
      transform: Matrix4.translationValues(adjustedOffset, 0, 0),
      duration: hasTouch == false ? Duration.zero : duration,
      curve: curve,
      width: (width ?? 0) - m,
      decoration: decoration,
      height: height,
    );
  }
}
