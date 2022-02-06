import 'package:botcell/model/grupos.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/groupList.dart';
import 'package:botcell/widget/groups.dart';
import 'package:flutter/material.dart';

class ShowAllGroups extends StatefulWidget {
  ShowAllGroups({Key? key}) : super(key: key);

  @override
  State<ShowAllGroups> createState() => _ShowAllGroupsState();
}

class _ShowAllGroupsState extends State<ShowAllGroups> {
  late AddGrupoProvider _addGrupoProvider = AddGrupoProvider();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Grupo>>(
      stream: _addGrupoProvider.getGruposStream,
      builder: (context, AsyncSnapshot<List<Grupo>> asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          if (asyncSnapshot.data!.length == 0) {
            // ignore: prefer_const_constructors
            return Center(
              child: const Text(
                'Grupo Vazio Sem Dados',
                textAlign: TextAlign.center,
              ),
            );
          }
          return HomeGroups(
            data: asyncSnapshot.data!,
            addGrupoProvider: _addGrupoProvider,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
