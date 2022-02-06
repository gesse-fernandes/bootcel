import 'package:botcell/widget/cadastro-grupos.dart';
import 'package:botcell/widget/groups.dart';
import 'package:botcell/widget/inicio-my-app.dart';
import 'package:botcell/widget/postar-home.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const MyApp();
              }))
            },
            title: const Text("INICIO"),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const CadastroG();
            })),
            title: const Text("CADASTRO"),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const Welcome();
            })),
            title: const Text("POSTAR"),
          ),
          ListTile(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return GroupsCreate();
            })),
            title: const Text("GRUPOS"),
          )
        ],
      ),
    );
  }
}
