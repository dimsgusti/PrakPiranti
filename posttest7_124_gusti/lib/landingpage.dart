import 'package:flutter/material.dart';
import 'kalkulator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: lebar,
        height: tinggi,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blue[300],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Selamat datang!',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                    ),
                    const Center(
                      child: Text(
                        'Pengeluaran bulan ini',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                    ),
                    const Center(
                      child: Text(
                        'Rp -',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // children: [
                          //   Text(
                          //     'data'
                          //   ),
                          //   Text(
                          //     'data'
                          //   ),
                          //   Text(
                          //     'data'
                          //   ),
                          // ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Kalkulator'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Kalkulator();
                            }
                          )
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: (){showAlertDialog(context, "Alert", "Posttest 7");
                      Text('OK');}, child: Text('Informasi lebih lanjut'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

void showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}