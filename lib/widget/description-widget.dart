import 'package:flutter/material.dart';

class DecriptionHome extends StatelessWidget {
  const DecriptionHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'POSTADOR DE OFERTAS DO WHATSAPP',
          style: TextStyle(
            fontFamily: 'Europa',
            fontSize: 15,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w700,
            height: 1.1666666666666667,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
