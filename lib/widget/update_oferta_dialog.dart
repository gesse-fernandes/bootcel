import 'package:botcell/model/oferta.dart';
import 'package:botcell/providers/add_grupos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateOfertaDialog extends StatelessWidget {
  final BuildContext context;
  final bool isEdit;
  final AddGrupoProvider addGrupoProvider;
  final Oferta? model_oferta;
  UpdateOfertaDialog(
      this.context, this.isEdit, this.addGrupoProvider, this.model_oferta);

  final TextEditingController nameGroup = TextEditingController();
  final TextEditingController namesGroups = TextEditingController();

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: inputBoxController,
        decoration: InputDecoration(hintText: inputBoxName),
      ),
    );
  }

  Widget getAppBorderButton(String buttonLabel) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF28324E)),
          borderRadius: BorderRadius.all(const Radius.circular(6.0))),
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: const Color(0xFF28324E),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  String nowTime() {
    final now = DateTime.now();
    String date = DateFormat("yyyy-MM-dd").format(now);
    String time = DateFormat("H:m:s").format(now);
    return date + " " + time;
  }

  void _saveData() {
    /*addGrupoProvider.updateGrupo.add(Oferta(
        id: model_oferta!.id,
        nameGroup: : nameGroup.text,
        groupName: namesGroups.text,
        time: nowTime()));*/
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
