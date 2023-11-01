import 'package:flutter/material.dart';
import 'package:posttest5_124_gusti/introduction_screen.dart';
import 'create.dart';
import 'about.dart';
import 'landingpage.dart';

void main() {
  List<DataPengeluaran> dataPengeluaranList = [];
  runApp(MyApp(dataPengeluaranList: dataPengeluaranList, primaryColor: Colors.blue, accentColor: Colors.green, brightness: Brightness.light, appTextStyle: TextStyle(fontWeight: FontWeight.bold),));
} 

class DataPengeluaran {
  String listNama;
  int listJumlah;
  String pilihan;

  DataPengeluaran(
      {required this.listNama, required this.listJumlah, required this.pilihan});
}

class MyApp extends StatelessWidget {
  final List<DataPengeluaran> dataPengeluaranList;
  final Color primaryColor;
  final Color accentColor;
  final Brightness brightness;
  final TextStyle appTextStyle;

  MyApp({
    Key? key,
    required this.dataPengeluaranList,
    required this.primaryColor,
    required this.accentColor,
    required this.brightness,
    required this.appTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: accentColor,
          brightness: brightness,
        ),
        textTheme: TextTheme(
          displaySmall: appTextStyle,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        textTheme: TextTheme(
          displaySmall: appTextStyle,
        ),
      ),
      home: IntroductionPage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final List<DataPengeluaran> dataPengeluaranList;
  MyHomePage({Key? key, required this.dataPengeluaranList}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _widgetOptions;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      LandingPage(),
      Create(onAddData: onAddData),
      About(),
    ];
  }

  void onAddData(DataPengeluaran data) {
    // Implement your logic to add data to dataPengeluaranList here
    setState(() {
      widget.dataPengeluaranList.add(data);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      body: Center(
        child: Container(
          width: lebar,
          height: tinggi,
          child: _widgetOptions.elementAt(_selectedIndex)
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
