import 'dart:async';

import 'package:botcell/db/group_db.dart';
import 'package:botcell/model/grupos.dart';
import 'package:botcell/model/oferta.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class AddGrupoProvider extends ChangeNotifier {
  final _gruposController = StreamController<List<Grupo>>.broadcast();
  final _ofertasController = StreamController<List<Oferta>>.broadcast();

  StreamSink<List<Grupo>> get _inGrupoSink => _gruposController.sink;

  StreamSink<List<Oferta>> get _inOfertaSink => _ofertasController;

  Stream<List<Grupo>> get getGruposStream => _gruposController.stream;
  Stream<List<Oferta>> get getOfertaStream => _ofertasController.stream;

  final _insertController = StreamController<Grupo>.broadcast();
  final _updateController = StreamController<Grupo>.broadcast();
  final _deleteController = StreamController<int>.broadcast();
  final _searchController = StreamController<String>.broadcast();

  final _insertOfertaController = StreamController<Oferta>.broadcast();
  final _updateControllerOferta = StreamController<Oferta>.broadcast();
  final _deleteControllerOferta = StreamController<int>.broadcast();

  StreamSink<Grupo> get insertGrupo => _insertController.sink;

  StreamSink<Grupo> get updateGrupo => _updateController.sink;

  StreamSink<int> get isDeleteGrupo => _deleteController.sink;

  StreamSink<String> get isSearchGrupo => _searchController.sink;

  StreamSink<Oferta> get insertOferta => _insertOfertaController;

  StreamSink<Oferta> get updateOferta => _updateControllerOferta;

  StreamSink<int> get deleteOferta => _deleteControllerOferta;

  AddGrupoProvider() {
    updateScreenData();
    updateScreenOferta();
    _updateController.stream.listen(_handleUpdateGrupo);
    _updateControllerOferta.stream.listen(_handleUpdateOferta);
    _insertController.stream.listen(_handleAddGrupo);
    _insertOfertaController.stream.listen(_hangleAddOferta);

    _deleteController.stream.listen(_handleDeleteGrupo);
    _deleteControllerOferta.stream.listen(_handleDeleteOferta);
    _searchController.stream.listen(_handleSearchGrupo);
  }

  void _handleAddGrupo(Grupo grupoModel) async {
    await GroupDbProvider.group_db.insertData(grupoModel);

    updateScreenData();
  }

  void _hangleAddOferta(Oferta oferta) async {
    await GroupDbProvider.group_db.insertDataOfert(oferta);
    updateScreenOferta();
  }

  void _handleUpdateGrupo(Grupo grupoModel) async {
    await GroupDbProvider.group_db.updateGrupo(grupoModel);

    updateScreenData();
  }

  void _handleUpdateOferta(Oferta oferta) async {
    await GroupDbProvider.group_db.updateOferta(oferta);
    updateScreenOferta();
  }

  void _handleDeleteGrupo(int id) async {
    await GroupDbProvider.group_db.deleteGrupo(id);
    updateScreenData();
  }

  void _handleDeleteOferta(int id) async {
    await GroupDbProvider.group_db.deleteOferta(id);
    updateScreenOferta();
  }

  void _handleSearchGrupo(String text) async {
    List<Grupo> user = await GroupDbProvider.group_db.getGrupo();

    var dummyListData = <Grupo>[];
    user.forEach((stud) {
      var st2 = Grupo(
          id: stud.id,
          name: stud.name,
          groupName: stud.groupName,
          time: stud.time);
      if ((st2.name.toLowerCase() + " " + st2.groupName.toLowerCase())
              .contains(text.toLowerCase()) ||
          st2.name.toLowerCase().contains(text.toLowerCase()) ||
          st2.groupName.toLowerCase().contains(text.toLowerCase()) ||
          st2.time.toLowerCase().contains(text.toLowerCase())) {
        dummyListData.add(stud);
      }
    });

    _inGrupoSink.add(dummyListData);
  }

  void updateScreenData() async {
    List<Grupo> grupos = await GroupDbProvider.group_db.getGrupo();
    _inGrupoSink.add(grupos);
  }

  void updateScreenOferta() async {
    List<Oferta> ofertas = await GroupDbProvider.group_db.getOfertas();
    _inOfertaSink.add(ofertas);
  }

  @override
  void dispose() {
    _gruposController.close();
    _insertController.close();
    _insertOfertaController.close();
    _updateController.close();
    _searchController.close();
    super.dispose();
  }
}
