import 'package:ekursus/widgets/MyIcon.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Aplikasi eKursus'),
      //   backgroundColor: Colors.grey,
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('images/background.png', fit: BoxFit.fill),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                color: Colors.white.withOpacity(0.5),
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text('APLIKASI eKURSUS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                        color: Colors.orangeAccent,
                      )),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              right: 100,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset('images/circle.png'),
              ),
            ),
            const MyIcon(
                topval: 0.25,
                leftval: 145,
                name: Icons.vertical_split,
                label: 'Katalog',
                link: '/katalog'),
            const MyIcon(
                topval: 0.35,
                leftval: 220,
                name: Icons.manage_search,
                label: 'Semakan',
                link: '/status'),
            const MyIcon(
                topval: 0.50,
                leftval: 260,
                name: Icons.perm_contact_calendar,
                label: 'Profil',
                link: '/profil'),
            const MyIcon(
                topval: 0.65,
                leftval: 220,
                name: Icons.contact_support,
                label: 'Bantuan',
                link: '/bantuan'),
            const MyIcon(
                topval: 0.75,
                leftval: 145,
                name: Icons.phonelink_lock,
                label: 'Login',
                link: '/login'),
          ],
        ),
      ),
    );
  }
}
