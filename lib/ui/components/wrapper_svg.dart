import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// обёртка над SvgPicture
class WrapperSvg extends StatelessWidget {
  final String imgUrl;
  final double? width;
  final double? height;
  final Color? color;

  const WrapperSvg({
    Key? key,
    required this.imgUrl,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imgUrl,
      width: width,
      height: height,
      color: color,
    );
  }
}
