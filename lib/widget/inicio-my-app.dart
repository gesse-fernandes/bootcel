import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/button-text.dart';
import 'package:botcell/widget/cadastro-grupos.dart';
import 'package:botcell/widget/custom-drawer.dart';
import 'package:botcell/widget/description-widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AddGrupoProvider>(
              create: (context) => AddGrupoProvider()),
        ],
        child: MaterialApp(
            title: 'POSTADOR DE OFERTAS DO WHATSAPP',
            home: Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                backgroundColor: const Color(0xFF01086D),
                title: const Center(
                  child: Text(
                    "BOOTCEL",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              backgroundColor: const Color(0xFF0E96CC),
              body: SizedBox(
                width: double.infinity,
                child: Column(children: const <Widget>[
                  DecriptionHome(),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonText(),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonText2(),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonText3(),
                ]),
              ),
              // home: MyHomePage(),
            )));
  }
}
