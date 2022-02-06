import 'package:flutter/material.dart';

class TextCadastroG extends StatelessWidget {
  const TextCadastroG({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        'CADASTRO DE GRUPOS',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20,
          color: Color(0xffffffff),
          letterSpacing: -0.5142857666015626,
          fontWeight: FontWeight.w700,
          height: 1.25,
        ),
        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
        textAlign: TextAlign.center,
      ),
    );
  }
}
