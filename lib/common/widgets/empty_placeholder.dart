import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  final double? height;
  final String? imageUrl;

  const EmptyPlaceholder({
    super.key,
    required this.message,
    this.height = 200,
    this.imageUrl = 'assets/images/empty-box.png',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            Image.asset(
              imageUrl!,
              height: 160,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
