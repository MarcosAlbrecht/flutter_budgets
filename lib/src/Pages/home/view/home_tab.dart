import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
