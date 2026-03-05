import 'package:flutter/material.dart';

class AnimationPanel<T> extends StatelessWidget {
  const AnimationPanel({
    super.key,
    required this.offset,
    required this.index,
    required this.totalItemsLength,
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
    final _offset = isRtl ? offset * -1 : offset;

    return AnimatedContainer(
      transform: Matrix4.translationValues(_offset, 0, 0),
      duration: hasTouch == false ? Duration.zero : duration,
      curve: curve,
      alignment: Alignment.center,
      margin: index == 0
          ? EdgeInsets.only(right: margin ?? 0)
          : index == totalItemsLength - 1
              ? EdgeInsets.only(left: margin ?? 0)
              : EdgeInsets.symmetric(horizontal: margin ?? 0),
      width: (width ?? 0),
      decoration: decoration,
      height: height,
    );
  }
}
