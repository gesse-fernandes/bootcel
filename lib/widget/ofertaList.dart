import 'package:botcell/model/oferta.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:flutter/material.dart';

class HomeOferta extends StatelessWidget {
  final List<Oferta> data;
  final AddGrupoProvider addGrupoProvider;
  HomeOferta({required this.data, required this.addGrupoProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        child: Image.network(
                            "https://contweb.net.br/fileUpload/${data[index].imageName}"),
                        backgroundColor: const Color(0xFF20283e),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                data[index].nameGroup +
                                    " " +
                                    data[index].caption,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.lightBlueAccent),
                              ),
                              Text(
                                data[index].time,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.lightBlueAccent),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /*IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.cyan,
                              ),
                              onPressed: () =>
                                  // _openupdateGrupo(true, data[index], context),
                                  print("")),*/
                          IconButton(
                              icon: const Icon(Icons.delete_forever,
                                  color: Colors.cyan),
                              onPressed: () async {
                                addGrupoProvider.deleteOferta
                                    .add(data[index].id!);
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }
}
