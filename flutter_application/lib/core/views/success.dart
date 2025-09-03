import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onFinished;

  const Success({
    super.key,
    this.duration = const Duration(seconds: 2),
    this.onFinished,
  });

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();

    Future.delayed(widget.duration, () {
      if (!mounted) return;
      if (widget.onFinished != null) {
        widget.onFinished!();
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
    );
  }
}
