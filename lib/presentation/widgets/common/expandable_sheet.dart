import 'package:flutter/cupertino.dart';

typedef HeaderBuilder = Widget Function(bool isOpen);

class ExpandableSheet extends StatefulWidget {
  final HeaderBuilder header;
  final Widget body;

  const ExpandableSheet({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);

  @override
  State<ExpandableSheet> createState() => _ExpandableSheetState();
}

class _ExpandableSheetState extends State<ExpandableSheet>
    with TickerProviderStateMixin {
  final GlobalKey _headerKey = GlobalKey(debugLabel: 'headerKey');
  final GlobalKey _bodyKey = GlobalKey(debugLabel: 'bodyKey');
  bool _isOpen = false;

  double _bodySize = 0.0;
  double _headerSize = 0.0;
  double _totalSize = 0.0;
  Offset _minOffset = Offset.zero;
  double _scrollStartDy = 0.0;

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _controller.addStatusListener(_animationStatusChange);

    WidgetsBinding.instance.addPostFrameCallback(_calculateSizes);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ExpandableSheet oldWidget) {
    if (oldWidget.body != widget.body || oldWidget.header != widget.header) {
      WidgetsBinding.instance.addPostFrameCallback(_calculateSizes);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: false,
      bottom: false,
      child: SlideTransition(
        position: Tween<Offset>(begin: _minOffset, end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        ),
        child: GestureDetector(
          onTap: _tap,
          onVerticalDragStart: _dragStart,
          onVerticalDragUpdate: _dragUpdate,
          onVerticalDragEnd: _dragEnd,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                key: _headerKey,
                child: widget.header(_isOpen),
              ),
              Expanded(
                child: Container(
                  key: _bodyKey,
                  child: widget.body,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateSizes(Duration _) {
    _bodySize = _bodyKey.currentContext?.size?.height ?? 0.0;
    _headerSize = _headerKey.currentContext?.size?.height ?? 0.0;
    _totalSize = _bodySize + _headerSize;

    setState(() {
      _minOffset = Offset(0, _bodySize / _totalSize);
    });
  }

  void _tap() {
    if (_controller.isAnimating) {
      return;
    }

    if (_controller.isDismissed) {
      _controller.forward();
    }

    if (_controller.isCompleted) {
      _controller.reverse();
    }
  }

  void _dragEnd(DragEndDetails details) {
    if (_controller.value > 0.5 && !_controller.isCompleted) {
      _controller.forward();
    }

    if (_controller.value <= 0.5 && !_controller.isDismissed) {
      _controller.reverse();
    }
  }

  void _dragUpdate(DragUpdateDetails details) {
    //current visible part
    final double dragOffset = _scrollStartDy - details.localPosition.dy;
    final double visibleSize = _controller.value * _totalSize;

    double offset = visibleSize + dragOffset;
    offset = offset.clamp(0, _totalSize);

    final double animationPercentage = offset / _totalSize;

    _controller.value = animationPercentage;
  }

  void _dragStart(DragStartDetails details) {
    if (_controller.isAnimating) {
      _controller.stop(canceled: false);
    }

    _scrollStartDy = details.localPosition.dy;
  }

  void _animationStatusChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.dismissed:
        setState(() {
          _isOpen = false;
        });
        break;
      case AnimationStatus.completed:
        setState(() {
          _isOpen = true;
        });
        break;
      default:
        break;
    }
  }
}
