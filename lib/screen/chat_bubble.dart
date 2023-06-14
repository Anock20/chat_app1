import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';

class MyChatBubble extends StatelessWidget {
  final Color color;
  final Alignment alignment;
  final Widget child;

  const MyChatBubble({
    required this.color,
    required this.alignment,
    required this.child, required bool isFromMe,
  });

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper2(
        type: alignment == Alignment.topRight ? BubbleType.sendBubble : BubbleType.receiverBubble,
      ),
      alignment: alignment,
      backGroundColor: color,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: child,
      ),
    );
  }
}

class _ChatBubblePainter extends CustomPainter {
  final Color color;

  _ChatBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 50.0;
    final path = Path();

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(
      size.width, 0,
      size.width, radius,
    );
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width, size.height,
      size.width - radius, size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(
      0, size.height,
      0, size.height - radius,
    );
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
