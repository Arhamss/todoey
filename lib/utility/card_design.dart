import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';

class ItemCard extends StatelessWidget {
  ItemCard({required this.card, required this.h, required this.w});
  final Widget card;
  final int h;
  final int w;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: h.toDouble(),
        width: w.toDouble(),
        margin: const EdgeInsets.fromLTRB(7, 15, 7, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF041A55),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: card,
      ),
    );
  }
}
