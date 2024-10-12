import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget children;
  const ContainerWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: children,
    );
  }
}
