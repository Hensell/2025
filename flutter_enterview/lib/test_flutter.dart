import 'package:flutter/material.dart';

class TestFlutter extends StatefulWidget {
  const TestFlutter({super.key});

  @override
  TestFlutterState createState() => TestFlutterState();
}

class TestFlutterState extends State<TestFlutter> {
  @override
  Widget build(BuildContext context) {
    // Problema: Hacer que los elementos de la lista se animen solo una vez,
    //mientras estás deslizando,
    // si regresas y te deslizas hacia arriba nuevamente, ya no deberían animarse, porque ya se animaron.

    return Scaffold(
      body: ListView(
        children: List.generate(100, (index) {
          return MyItem(
            index: index,
          );
        }),
      ),
    );
  }
}

class MyItem extends StatefulWidget {
  const MyItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) {
          return Center(
            child: Transform.scale(
              scale: value,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color:
                      Colors.primaries[widget.index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(100 * value),
                ),
                child: FittedBox(
                  child: Text(
                    widget.index.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
