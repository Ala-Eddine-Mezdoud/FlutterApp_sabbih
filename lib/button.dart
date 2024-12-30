import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() add;
  const MyButton({super.key, required this.add});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.green[900],
              minimumSize: Size(double.infinity, 10)),
          onPressed: add,
          child: Text("استغفر الله")),
    );
  }
}
