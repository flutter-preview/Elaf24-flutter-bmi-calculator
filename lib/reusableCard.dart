import 'package:flutter/cupertino.dart';

class reuseable_card extends StatelessWidget {
  const reuseable_card({super.key, required this.color, this.cardChild,this.onPressed});
  final Color color;
  final Widget? cardChild;
  final Function ?onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed != null ? () => onPressed!() : null,
      child: Container(
        height: 200,
        width: 170,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
