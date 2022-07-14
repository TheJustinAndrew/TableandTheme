import 'package:flutter/material.dart';


class TableDataCell extends StatelessWidget {
  final String value;
  final Color color;

  TableDataCell({
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
