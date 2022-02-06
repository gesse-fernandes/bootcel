import 'package:botcell/model/grupos.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:botcell/widget/cadastro-grupos.dart';
import 'package:botcell/widget/custom-drawer.dart';
import 'package:botcell/widget/showStreamGroups.dart';
import 'package:botcell/widget/update_grupo_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';

class GroupsCreate extends StatefulWidget {
  const GroupsCreate({Key? key})
      : super(
          key: key,
        );

  @override
  _GroupsCreateState createState() => _GroupsCreateState();
}

class _GroupsCreateState extends State<GroupsCreate> {
  String textArea = '';
  List<Grupo>? data;
  Grupo? _selectItemGrupo;
  late AddGrupoProvider _addGrupoProvider = AddGrupoProvider();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _addGrupoProvider = context.watch<AddGrupoProvider>();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget _searchField() {
    return TextFormField(
      style: const TextStyle(fontSize: 14.0, color: Colors.black),
      controller: _searchController,
      onChanged: (changed) {
        _addGrupoProvider.isSearchGrupo.add(changed);
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.grey[100],
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.grey[500],
                  size: 16.0,
                ),
                onPressed: () {})
            : Icon(
                Icons.search_outlined,
                color: Colors.grey[500],
                size: 16.0,
              ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0)),
        contentPadding: const EdgeInsets.only(left: 15.0, right: 10.0),
        labelText: "Pesquisar...",
        hintStyle: const TextStyle(
            fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w500),
        labelStyle: const TextStyle(
            fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      autocorrect: false,
      autovalidateMode: AutovalidateMode.always,
    );
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
          backgroundColor: const Color(0xFF0E96CC),
          drawer: const CustomDrawer(),
          appBar: AppBar(
            backgroundColor: const Color(0xFF01086D),
            title: const Center(
              child: Text(
                " GRUPOS",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //   _searchField(),
              Expanded(child: ShowAllGroups()),
            ],
          ),
        ),
      ),
    );
  }
}

class ColumnButtons extends StatelessWidget {
  const ColumnButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonWidget(text: 'Ver', onClicked: () {}),
        ButtonWidget(text: 'Editar', onClicked: () {}),
        ButtonWidget(text: 'Excluir', onClicked: () {})
      ],
    );
  }
}
