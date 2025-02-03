import 'package:flutter/material.dart';

class TestFlutter2 extends StatefulWidget {
  const TestFlutter2({super.key});

  @override
  TestFlutter2State createState() => TestFlutter2State();
}

class TestFlutter2State extends State<TestFlutter2> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Problema: Ya conocemos la función del AnimatedSwitcher, ahora queremos hacer una animación, con el mismo AnimatedSwitcher
            // Actualizar el código para que anime 2 Container uno azul y uno rojo con la transación que provee el AnimatedSwitcher

            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: _isActive
                  ? Container(
                      key: ValueKey(1),
                      color: Colors.red,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    )
                  : Container(
                      key: ValueKey(2),
                      color: Colors.blue,
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isActive = !_isActive;
                });
              },
              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
