import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:posttest5_124_gusti/main.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: Text("Selanjutnya"),
      done: Text("Selesai"),
      onDone: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MyHomePage(dataPengeluaranList: [],);
            },
          ),
        );
      },
      pages: [
        PageViewModel(
          title: "Selamat datang",
          body: "Solusi Keuangan Anda",
          image: Image(
            image: AssetImage('assets/images/logo.png'),
          )
        ),
        PageViewModel(
          title: "Ketahui",
          body: "Manajemen Keuangan Penting",
          image: Image(
            image: AssetImage('assets/images/money.png'),
          )
        ),
        PageViewModel(
          title: "Mulai",
          body: "Tidak Ada Kata Terlambat",
          image: Image(
            image: AssetImage('assets/images/time.jpeg'),
          )
        ),
      ],
    );
  }
}
