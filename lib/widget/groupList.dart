import 'package:botcell/model/grupos.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/update_grupo_dialog.dart';
import 'package:flutter/material.dart';

class HomeGroups extends StatelessWidget {
  final List<Grupo> data;
  final AddGrupoProvider addGrupoProvider;
  HomeGroups({required this.data, required this.addGrupoProvider});

  Future _openupdateGrupo(
    bool isEdit,
    Grupo group,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return UpadteGrupo(context, isEdit, addGrupoProvider, group);
      },
    );
  }

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
                        child: Text(
                          data[index].name,
                        ),
                        backgroundColor: const Color(0xFF20283e),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                data[index].name + " " + data[index].groupName,
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
                          IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.cyan,
                              ),
                              onPressed: () =>
                                  _openupdateGrupo(true, data[index], context)),
                          IconButton(
                              icon: const Icon(Icons.delete_forever,
                                  color: Colors.cyan),
                              onPressed: () async {
                                addGrupoProvider.isDeleteGrupo
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