import 'package:flutter/material.dart';

class CutomLoading2 extends StatefulWidget {
  final bool canPop;
  const CutomLoading2({super.key, this.canPop = false});

  @override
  State<CutomLoading2> createState() => _CutomLoading2State();
}

class _CutomLoading2State extends State<CutomLoading2> {
  Offset offset = const Offset(0, -1);
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) {
        setState(() {
          // Your state change code goes here
        });
      }
      setState(() {
        offset = Offset.zero;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.canPop,
      child: AnimatedSlide(
        offset: offset,
        duration: const Duration(milliseconds: 200),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
