// ignore: file_names
// ignore_for_file: deprecated_member_use

import 'package:botcell/widget/cadastro-grupos.dart';
import 'package:botcell/widget/postadas.dart';
import 'package:botcell/widget/postar-home.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: RaisedButton(
        color: const Color(0xFFE0D63D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              constraints:
                  const BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: const Text(
                'NOVA OFERTA',
                style: TextStyle(
                  fontFamily: 'Rift Soft',
                  fontSize: 20,
                  color: Color(0xFF000000),
                  letterSpacing: 2.8000000000000003,
                  fontWeight: FontWeight.w700,
                  height: 2.5,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const Welcome();
          })),
        },
      ),
    );
  }
}

class ButtonText2 extends StatelessWidget {
  const ButtonText2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: RaisedButton(
        color: const Color(0xFFE0D63D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              constraints:
                  const BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: const Text(
                'OFERTAS POSTADAS',
                style: TextStyle(
                  fontFamily: 'Rift Soft',
                  fontSize: 20,
                  color: Color(0xFF000000),
                  letterSpacing: 2.8000000000000003,
                  fontWeight: FontWeight.w700,
                  height: 2.5,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const OfertasPostadas();
          })),
        },
      ),
    );
  }
}

class ButtonText3 extends StatelessWidget {
  const ButtonText3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: RaisedButton(
        color: const Color(0xFFE0D63D),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              constraints:
                  const BoxConstraints(maxHeight: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: const Text(
                'CADASTRO DE GRUPOS',
                style: TextStyle(
                  fontFamily: 'Rift Soft',
                  fontSize: 20,
                  color: Color(0xFF000000),
                  letterSpacing: 2.8000000000000003,
                  fontWeight: FontWeight.w700,
                  height: 2.5,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const CadastroG();
          })),
        },
      ),
    );
  }
}
