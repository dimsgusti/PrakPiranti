import 'package:flutter/material.dart';
import 'dart:math';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  double _sliderValue1 = 50;
  double _sliderValue2 = 50;
  double _hasil = 0;

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _hitung(){
    setState(() {
      _hasil = _sliderValue1 / 10 + _sliderValue2 / 10;
      _hasil *= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Tracker'),
        backgroundColor: Colors.red[300],
      ),
      body: Container(
        width: lebar,
        height: tinggi,
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                      value: _sliderValue1,
                      min: 0,
                      max: 100,
                      onChanged: (value){
                        setState(() {
                          _sliderValue1 = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                      value: _sliderValue2,
                      min: 0,
                      max: 100,
                      onChanged: (value){
                        setState(() {
                          _sliderValue2 = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(height: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _hitung();
                    },
                    child: Text('Hitung'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(height: 20),
                  ),
                  Text(
                    'Hasil: $_hasil',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: (){
                        setState(() {
                          final random = Random();
                  
                          _width = random.nextInt(300).toDouble();
                          _height = random.nextInt(300).toDouble();
                  
                          _color = Color.fromRGBO(
                            random.nextInt(256),
                            random.nextInt(256),
                            random.nextInt(256),
                            1
                          );
                          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: _borderRadius,
                      ),
                      // Define how long the animation should take.
                      duration: const Duration(seconds: 1),
                      // Provide an optional curve to make the animation feel smoother.
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}