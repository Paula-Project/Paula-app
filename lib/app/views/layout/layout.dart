import 'package:flutter/material.dart';
import 'package:paula/app/service/prefs_service.dart';
import 'package:paula/app/state/usuario_state.dart';
import 'package:paula/app/views/home_page.dart';
import 'package:paula/app/views/login_page.dart';
import 'package:paula/app/views/person_data_page.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  final int indexPage;
  final Widget bodyContent;
  const Layout({Key? key, required this.indexPage, required this.bodyContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    logout() {
      Future.delayed(const Duration(seconds: 0), () async {
        var user = Provider.of<UsuarioState>(context, listen: false);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage(),
          ),
          (route) => false,
        );
        await PrefsService.removeUser().then((e) {
          user.resetUSER();
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          OutlinedButton(
            onPressed: () {
              logout();
            },
            child: const Icon(
              Icons.logout,
              color: Colors.grey,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Créditos",
              style: TextStyle(color: Colors.black45, fontSize: 15.0),
            ),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: bodyContent,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.white,
              blurRadius: 50.0,
              spreadRadius: 30.0,
              offset: Offset.zero)
        ]),
        child: BottomNavigationBar(
            currentIndex: indexPage,
            backgroundColor: Colors.white,
            elevation: 50,
            iconSize: 40,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false,
                  );
                  break;
                case 1:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PersonData(),
                    ),
                    (route) => false,
                  );
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Perfil"),
            ]),
      ),
    );
  }
}
