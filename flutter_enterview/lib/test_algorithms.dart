import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestAlgorithms extends StatefulWidget {
  const TestAlgorithms({super.key});

  @override
  State<TestAlgorithms> createState() => _TestAlgorithmsState();
}

class _TestAlgorithmsState extends State<TestAlgorithms> {
  final _controller = TextEditingController();
  int _numberOfDigits = 0;

  void numberOfDigits(int number) {
    int residuo = number;
    int cont = 0;

    do {
      residuo = residuo ~/ 10;

      cont++;
    } while (residuo > 0);

    setState(() {
      _numberOfDigits = cont;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calcular cantidad de dígitos de: ',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _controller,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Número',
                  ),
                ),
              ),
              Text(
                'Cantidad de dígitos: $_numberOfDigits',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                color: Colors.blueAccent.withOpacity(0.5),
                onPressed: () {
                  numberOfDigits(int.parse(_controller.text));
                },
                child: const Text('Calcular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
