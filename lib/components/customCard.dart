import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  static List<BoxShadow> defaultBoxShadow = const [
    const BoxShadow(
        offset: const Offset(0, 3),
        blurRadius: 18,
        spreadRadius: 2,
        color: Color.fromRGBO(0, 0, 0, 0.2))
  ];

  static List<BoxShadow> noneBoxShadow = const [];

  CustomCard(
      {this.width,
      this.height,
      this.color,
      this.child,
      this.image,
      this.border,
      this.borderRadius,
      this.shape,
      this.boxShadow,
      this.margin,
      this.padding,
      this.alignment,
      this.constraints});
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final DecorationImage image;
  final BoxBorder border;
  final BorderRadiusGeometry borderRadius;
  final BoxShape shape;
  final List<BoxShadow> boxShadow;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final BoxConstraints constraints;

  factory CustomCard.cricleEnds({
    double width,
    @required double height,
    Color color,
    Widget child,
    DecorationImage image,
    BoxBorder border,
    List<BoxShadow> boxShadow,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
    AlignmentGeometry alignment,
    BoxConstraints constraints,
  }) =>
      CustomCard(
        width: width,
        height: height,
        child: child,
        image: image,
        border: border,
        boxShadow: boxShadow,
        margin: margin,
        padding: padding,
        color: color,
        alignment: alignment,
        constraints: constraints,
        borderRadius: BorderRadius.circular(height * 0.5),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      alignment: alignment ?? Alignment.center,
      constraints: constraints,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          image: image,
          border: border,
          borderRadius: borderRadius,
          shape: shape ?? BoxShape.rectangle,
          boxShadow: boxShadow ?? defaultBoxShadow),
      child: child,
    );
  }
}
