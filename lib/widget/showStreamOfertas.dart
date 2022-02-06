import 'package:botcell/model/oferta.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/ofertaList.dart';
import 'package:flutter/material.dart';

class ShowAllOfertas extends StatefulWidget {
  ShowAllOfertas({Key? key}) : super(key: key);

  @override
  State<ShowAllOfertas> createState() => _ShowAllOfertasState();
}

class _ShowAllOfertasState extends State<ShowAllOfertas> {
  late AddGrupoProvider _addGrupoProvider = AddGrupoProvider();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Oferta>>(
      stream: _addGrupoProvider.getOfertaStream,
      builder: (context, AsyncSnapshot<List<Oferta>> asyncSnapshot) {
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
          return HomeOferta(
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