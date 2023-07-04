import 'package:bmi_clac/constants.dart';
import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  IconContent( {required this.icon, required this.label});
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          label,
          style: labelTextStyle,



        ),

      ],
    );
  }
}
