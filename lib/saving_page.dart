import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavingPage extends StatefulWidget {
  const SavingPage({super.key});

  @override
  State<SavingPage> createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  final TextEditingController _dateInput = TextEditingController();
  final TextEditingController _total = TextEditingController();
  final TextEditingController _money = TextEditingController();

  @override
  void initState() {
    _dateInput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _money.text = "";
    _total.text = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saving Page'),
      ),
      body: ListView(children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
               const Padding(
                  padding: EdgeInsets.only(
                top: 40,
              )),
              const Text(
                "Savings",
                style: TextStyle(fontSize: 24),
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 50,
              )),
              TextField(
                controller: _money,
                decoration: InputDecoration(
                    hintText: "Uang Masuk",
                    labelText: "Uang Masuk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                keyboardType: TextInputType.number,
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 20,
              )),
              TextField(
                controller: _dateInput,
                decoration: InputDecoration(
                    hintText: "Tanggal",
                    labelText: "Tanggal",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      _dateInput.text = formattedDate;
                    });
                  }
                },
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 20,
              )),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 40, 150, 194)),
                child: const  Text(
                  'Tambah',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    double result = ((double.parse(_money.text)) +
                        (double.parse(_total.text)));
                    _total.text = result.toString();
                    _money.text = "";
                    _dateInput.text =
                        DateFormat('yyyy-MM-dd').format(DateTime.now());
                  });
                },
              ),
              const Padding(
                  padding: EdgeInsets.only(
                top: 20,
              )),
              TextField(
                controller: _total,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Total Tabungan",
                    labelText: "Total Tabungan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                readOnly: true,
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
