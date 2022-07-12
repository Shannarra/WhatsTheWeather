import 'dart:math';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final Color backgroundColor;
  final Color foregroundColor;
  final double backgroundWidth;
  final double foregroundWidth;
  final double progress;
  final double startAngle;
  final double sweepAngle;

  late Paint _backgroundPaint;
  late Paint _foregroundPaint;

  ArcPainter({
    required this.backgroundColor,
    required this.foregroundColor,
    this.backgroundWidth = 1,
    this.foregroundWidth = 5,
    this.progress = 0,
    this.startAngle = 130,
    this.sweepAngle = 280,
  }) : assert(progress >= 0 && progress <= 1) {
    _backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = backgroundWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _foregroundPaint = Paint()
      ..color = foregroundColor
      ..strokeWidth = foregroundWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width, size.height) / 2;
    final Rect arcRect = Rect.fromCircle(center: center, radius: radius);
    final double progressAngle = sweepAngle * progress;
    final double startRad = radians(startAngle).toDouble();
    final double sweepRad = radians(sweepAngle).toDouble();
    final double progressRad = radians(progressAngle).toDouble();

    canvas.drawArc(arcRect, startRad, sweepRad, false, _backgroundPaint);

    canvas.drawArc(arcRect, startRad, progressRad, false, _foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant ArcPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }

  num radians(num deg) => deg * (pi / 180.0);
}

class ArcProgressBar extends StatefulWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double progress;
  final Duration duration;
  final Curve curve;

  const ArcProgressBar({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.progress,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  State<ArcProgressBar> createState() => _ArcProgressBarState();
}

class _ArcProgressBarState extends State<ArcProgressBar>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)..duration = widget.duration;
    _controller.animateTo(widget.progress, curve: widget.curve);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ArcProgressBar oldWidget) {
    if (oldWidget.progress != widget.progress) {
      _controller.animateTo(widget.progress, curve: widget.curve);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        painter: ArcPainter(
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          progress: _controller.value,
        ),
      ),
    );
  }
}
