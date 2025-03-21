
import 'package:flutter/material.dart';

class SizeConstraintsRoute extends StatelessWidget{
  const SizeConstraintsRoute({super.key});
  
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red)
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("约束"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50.0
              ),
              child: Container(
                height: 5.0,
                child: redBox,
              ),
            ),
            SizedBox(width: 80.0, height: 80.0, child: redBox),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0,minHeight: 60.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90.0,minHeight: 20.0),
                child: redBox,
              ),
            )
          ],
        ),
      ),
    );
  }
}