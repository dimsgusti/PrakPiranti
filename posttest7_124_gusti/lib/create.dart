import 'package:flutter/material.dart';
import 'main.dart';

class Create extends StatefulWidget {
  final Function(DataPengeluaran) onAddData;
  Create({Key? key, required this.onAddData}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController _namaPengeluaran = TextEditingController();
  TextEditingController _jumlahPengeluaran = TextEditingController();
  String selectedRadio = 'Kebutuhan';

  void _clearTextFields() {
    _namaPengeluaran.clear();
    _jumlahPengeluaran.clear();
    setState(() {
      selectedRadio = 'Kebutuhan';
    });
  }

  setSelectedRadio(String? value) {
    setState(() {
      selectedRadio = value ?? '';
    });
  }

  void _saveData() {
    String nama = _namaPengeluaran.text;
    String jumlahString = _jumlahPengeluaran.text;
    int jumlahInt = int.tryParse(jumlahString) ?? 0;

    if (nama.isNotEmpty && jumlahInt > 0 && selectedRadio.isNotEmpty) {
      DataPengeluaran data =
          DataPengeluaran(listNama: nama, listJumlah: jumlahInt, pilihan: selectedRadio);
      widget.onAddData(data);
      _clearTextFields();
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: lebar,
        height: tinggi,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nama pengeluaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.grey[200],
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Buku',
                      ),
                      controller: _namaPengeluaran,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Jumlah pengeluaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.grey[200],
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '2000',
                      ),
                      controller: _jumlahPengeluaran,
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  RadioListTile(
                    groupValue: selectedRadio,
                    title: Text('Kebutuhan'),
                    value: 'Kebutuhan',
                    onChanged: (val) {
                      setSelectedRadio(val as String?);
                    },
                  ),
                  RadioListTile(
                    groupValue: selectedRadio,
                    title: Text('Keinginan'),
                    value: 'Keinginan',
                    onChanged: (val) {
                      setSelectedRadio(val as String?);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _saveData,
                child: Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
