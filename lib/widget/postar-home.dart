import 'dart:convert';
import 'dart:io';

import 'package:botcell/api/api.dart';
import 'package:botcell/db/group_db.dart';
import 'package:botcell/model/grupos.dart';
import 'package:botcell/model/oferta.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/custom-drawer.dart';
import 'package:botcell/widget/text-welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final formKey = GlobalKey<FormState>();
  String addContact = '';
  String textArea = '';
  File? image;
  String status = '';
  String base64Image = '';
  final AddGrupoProvider _addGrupoProvider = AddGrupoProvider();
  Grupo? group;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) {
        return;
      }
      final imageTemporay = File(image.path);

      setState(() => this.image = imageTemporay);
      final ok = this.image!.path.split('/').last;
      upload(ok);
    } on PlatformException catch (e) {
      return e;
    }
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  upload(String fileName) {
    http.post(Uri.parse("https://contweb.net.br/fileUpload/server.php"), body: {
      "image": base64Encode(image!.readAsBytesSync()),
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : '');
    }).catchError((error) {
      setStatus(error);
    });
  }

  void _savedata(
      String groupName, String caption, String fileImage, String time) async {
    _addGrupoProvider.insertOferta.add(Oferta(
        nameGroup: groupName,
        caption: caption,
        imageName: fileImage,
        time: time));
  }

  Widget buildAddContact() => Card(
        color: Colors.white,
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Adicionar contato',
            enabled: false,
            border: OutlineInputBorder(),
            // errorBorder:
            //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
            // focusedErrorBorder:
            //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
            // errorStyle: TextStyle(color: Colors.purple),
          ),
          validator: (value) {},
          onSaved: (value) => setState(() => addContact = value!),
        ),
      );
  String nowTime() {
    final now = DateTime.now();
    String date = DateFormat("yyyy-MM-dd").format(now);
    String time = DateFormat("H:m:s").format(now);
    return date + " " + time;
  }

  Widget buildTextArea() => Card(
        color: Colors.white,
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Descrição',
            border: OutlineInputBorder(),
          ),
          validator: (value) {},
          maxLines: 8,
          keyboardType: TextInputType.text,
          onSaved: (value) => setState(() => textArea = value!),
        ),
      );

  Widget buildImage() => Builder(
      builder: (context) => ButtonWidget(
          text: 'ENVIAR IMAGEM',
          onClicked: () {
            pickImage(ImageSource.gallery);
          }));

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'ENVIAR OFERTA',
          onClicked: () {
            formKey.currentState?.save();

            String caminho = 'https://contweb.net.br/fileUpload/';
            var last = image!.path.split('/').last;
            Api.sendMessageGroup(group!.groupName, textArea, caminho + last)
                .then((value) {
              //  print(value['status']);
              final res = value;

              print(res);
              if (res['status'] == true) {
                _savedata(group!.groupName, textArea, last, nowTime());
                var mess = res['message'];

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    mess,
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.green,
                ));
              } else {
                const snackBar = SnackBar(
                  content: Text(
                    'A mensagem falhou',
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            });
          },
        ),
      );

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
                "POSTAR",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF0E96CC),
          body: StreamBuilder<List<Grupo>>(
            stream: _addGrupoProvider.getGruposStream,
            builder: (context, AsyncSnapshot<List<Grupo>> asyncSnapshot) {
              if (!asyncSnapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const TextWelcome(),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButton<Grupo>(
                            hint: Text("Grupos*"),
                            value: group,
                            alignment: Alignment.center,
                            items: asyncSnapshot.data!
                                .map((grupo) => DropdownMenuItem(
                                      child: Text(grupo.name),
                                      value: grupo,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                group = value;
                              });
                            }),
                        Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                group?.groupName != null
                                    ? Text(
                                        group!.groupName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(""),
                                const SizedBox(
                                  height: 32,
                                ),
                                buildTextArea(),
                                const SizedBox(
                                  height: 32,
                                ),
                                image != null
                                    ? Image.file(
                                        image!,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.contain,
                                      )
                                    : const Text(""),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildImage(),
                                const SizedBox(
                                  height: 32,
                                ),
                                buildSubmit(),
                                const SizedBox(
                                  height: 32,
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          /*Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              const TextWelcome(),
              StreamBuilder<List<Grupo>>(
                stream: _addGrupoProvider.getGruposStream,
                builder: (context, AsyncSnapshot<List<Grupo>> asyncSnapshot) {
                  if (!asyncSnapshot.hasData)
                    return CircularProgressIndicator();
                  return ListView.builder(
                    itemCount: asyncSnapshot.data!.length,
                    itemBuilder: (context, int index) {
                      return DropdownButton<Grupo>(
                          items: asyncSnapshot.data!
                              .map((grupo) => DropdownMenuItem(
                                    child: Text(grupo.name),
                                    value: grupo,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            group = value;
                          });
                    },
                  );
                },
              ),
              buildAddContact(),
              const SizedBox(
                height: 32,
              ),
              buildTextArea(),
              const SizedBox(
                height: 32,
              ),
              image != null
                  ? Image.file(
                      image!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    )
                  : const Text(""),
              const SizedBox(
                height: 20,
              ),
              buildImage(),
              const SizedBox(
                height: 32,
              ),
              buildSubmit(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),*/
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textColor: Colors.white,
        onPressed: widget.onClicked,
      );
}
