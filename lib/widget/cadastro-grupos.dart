import 'package:botcell/api/api.dart';
import 'package:botcell/model/grupos.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/custom-drawer.dart';
import 'package:botcell/widget/groups.dart';
import 'package:botcell/widget/text-cadastrog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CadastroG extends StatefulWidget {
  const CadastroG({Key? key}) : super(key: key);

  @override
  State<CadastroG> createState() => _CadastroGState();
}

class _CadastroGState extends State<CadastroG> {
  final formKey = GlobalKey<FormState>();
  String addContact = '';
  String textArea = '';
  final AddGrupoProvider _addGrupoProvider = AddGrupoProvider();

  void _saveData(String name, String groupName, String time) {
    _addGrupoProvider.insertGrupo
        .add(Grupo(name: name, groupName: groupName, time: time));
  }

  String nowTime() {
    final now = DateTime.now();
    String date = DateFormat("yyyy-MM-dd").format(now);
    String time = DateFormat("H:m:s").format(now);
    return date + " " + time;
  }

  Widget buildAddContact() => Card(
        color: Colors.white,
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Nome do Grupo',
            border: OutlineInputBorder(),
          ),
          validator: (value) {},
          onSaved: (value) => setState(() => addContact = value!),
        ),
      );

  Widget buildTextArea() => Card(
        color: Colors.white,
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Os grupos',
            border: OutlineInputBorder(),
          ),
          validator: (value) {},
          maxLines: 8,
          keyboardType: TextInputType.text,
          onSaved: (value) => setState(() => textArea = value!),
        ),
      );

  Widget buildSubmitSave() => Builder(
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              text: 'Salvar',
              onClicked: () async {
                formKey.currentState?.save();

                _saveData(addContact, textArea, nowTime());
                const snackBar = SnackBar(
                  duration: Duration(seconds: 365),
                  content: Text(
                    'Grupo salvo com sucesso',
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
   
                //ScaffoldMessengerState();
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return GroupsCreate();
                }));*/
              },
            ),
          ],
        ),
      );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddGrupoProvider>(
            create: (context) => AddGrupoProvider()),
      ],
      child: MaterialApp(
        title: 'Adicionar',
        home: Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            backgroundColor: const Color(0xFF01086D),
            title: const Center(
              child: Text(
                "CADASTRO",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF0E96CC),
          body: SizedBox(
              width: double.infinity,
              child: Form(
                key: formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    const TextCadastroG(),
                    buildAddContact(),
                    const SizedBox(
                      height: 32,
                    ),
                    buildTextArea(),
                    const SizedBox(
                      height: 32,
                    ),
                    buildSubmitSave(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) => RaisedButton(
        color: const Color(0xFFE0D63D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            color: Color(0xff000000),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        textColor: Colors.white,
        onPressed: widget.onClicked,
      );
}
