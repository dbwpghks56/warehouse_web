import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ToastBuilder extends ConsumerStatefulWidget {
  const ToastBuilder({
    super.key,
    required this.text,
    required this.animDuration,
  });

  final String text;
  final Duration animDuration;

  @override
  ConsumerState<ToastBuilder> createState() => ToastBuilderState();
}

class ToastBuilderState extends ConsumerState<ToastBuilder> {
  bool _isShow = false;

  bool get isShow => _isShow;

  set isShow(bool value) {
    setState(() {
      _isShow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: screenSize.height * 0.25,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedOpacity(
          duration: widget.animDuration,
          opacity: isShow ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF000000).withOpacity(0.85),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: DefaultTextStyle(
              style: const TextStyle(
                height: 1.3,
                fontSize: 18,
                color: Color(0xFF000000),
              ).copyWith(
                color: const Color(0xFFFAFAFA),
              ),
              child: Text(
                widget.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
