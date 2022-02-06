import 'package:botcell/widget/cadastro-grupos.dart';
import 'package:botcell/widget/custom-drawer.dart';
import 'package:botcell/widget/showStreamOfertas.dart';
import 'package:flutter/material.dart';

class OfertasPostadas extends StatefulWidget {
  const OfertasPostadas({Key? key}) : super(key: key);

  @override
  _OfertasPostadasState createState() => _OfertasPostadasState();
}

class _OfertasPostadasState extends State<OfertasPostadas> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POSTADAS',
      home: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: const Color(0xFF01086D),
          title: const Center(
            child: Text(
              "POSTADAS",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: ShowAllOfertas()),
          ],
        ),
      ),
    );
  }
}
