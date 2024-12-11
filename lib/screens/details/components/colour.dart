import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Products.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Color"),
                Row(
                  children: <Widget>[
                    ColorDot(
                      color: Colors.pink,
                      isSelected: true,
                    ),
                    ColorDot(
                      color: Colors.pinkAccent,
                      isSelected: true,
                    ),
                    ColorDot(
                      color: Colors.purple,
                      isSelected: true,
                    ),
                    ColorDot(color:Colors.red, isSelected: false),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
