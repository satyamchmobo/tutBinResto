import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomExpansionWidget extends StatefulWidget {
  const CustomExpansionWidget({
    Key? key,
    required this.expandedChild,
    required this.builder,
    this.defaultIsExpanded = false,
    this.childAlignment,
  }) : super(key: key);
  final Widget expandedChild;
  final bool defaultIsExpanded;
  final Alignment? childAlignment;
  final Widget Function(
    BuildContext context,
    Widget expandedChild,
    void Function() toggleExpansion,
    bool isAnimating,
    bool isExpanded,
  ) builder;

  @override
  // ignore: library_private_types_in_public_api
  _CustomExpansionWidgetState createState() => _CustomExpansionWidgetState();
}

class _CustomExpansionWidgetState extends State<CustomExpansionWidget>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController controller;
  late Animation<double> heightFactor;
  bool _isExpanded = false;

  bool get closed => !_isExpanded && controller.isDismissed;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    heightFactor = controller.drive(CurveTween(curve: Curves.easeIn));
    if (widget.defaultIsExpanded) {
      handleTap(vibrateOnClick: false);
    }
    super.initState();
  }

  void handleTap({bool vibrateOnClick = true}) {
    setState(() {
      _isExpanded = !_isExpanded;
      if (vibrateOnClick) {
        HapticFeedback.selectionClick();
      }
      if (_isExpanded) {
        controller.forward();
      } else {
        controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: controller.view,
      builder: (BuildContext context, Widget? child) {
        final expansionChild = ClipRect(
          child: Align(
            alignment: widget.childAlignment ?? Alignment.center,
            heightFactor: heightFactor.value,
            child: child,
          ),
        );
        return widget.builder(
          context,
          expansionChild,
          handleTap,
          controller.isAnimating,
          _isExpanded,
        );
      },
      child: closed
          ? null
          : Offstage(
              offstage: closed,
              child: TickerMode(enabled: !closed, child: widget.expandedChild),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
