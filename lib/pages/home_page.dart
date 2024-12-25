import 'package:flutter/material.dart';
import 'package:rejalar_apps/models/reja_modeli.dart';
import 'package:rejalar_apps/service/shared_preference.dart';

import '../widgets/reja_qushish.dart';
import '../widgets/rejalar_malumoti.dart';
import '../widgets/rejalar_ruyxati.dart';
import '../widgets/rejalar_sanasi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime belgilanganSana = DateTime.now();

  var ruyxat = Rejalar();

  void sanaiTanlash() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2023),
            lastDate: DateTime(2030),
            initialDate: DateTime.now())
        .then((sana) {
      setState(() {
        belgilanganSana = sana!;
        print(belgilanganSana);
      });
    });
  }

  void oldingiSana() {
    setState(() {
      belgilanganSana = DateTime(
          belgilanganSana.year, belgilanganSana.month, belgilanganSana.day - 1);
    });
  }

  void keyingiSana() {
    setState(() {
      belgilanganSana = DateTime(
          belgilanganSana.year, belgilanganSana.month, belgilanganSana.day + 1);
    });
  }

  void yangiRejaQushish() {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return YangiReja(rejaQushish);
        });
  }

  void rejaQushish(String name, DateTime kun) {
    setState(() {
      ruyxat.addReja(name, kun);
    });
  }

  int get _bajarilganRejalar {
    return ruyxat.KunBuyichaReja(belgilanganSana)
        .where((reja) => reja.bajarildi)
        .length;
  }

  void bajarilganDebBelgilash(String rejaid) {
    setState(() {
      ruyxat.KunBuyichaReja(belgilanganSana)
          .firstWhere((reja) => reja.id == rejaid)
          .bajarilganReja();
    });
  }

  void _rejaniUchirish(String rejaId) {
    setState(() {
      ruyxat.rejalar.removeWhere((reja) => reja.id == rejaId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreference.storeName("JAsur");
    RejaModeli2 model1 =
    RejaModeli2(name: "Bozorga Borish", kuni: "DateTime.now()", id: "id1");
    SharedPreference.storeReja(model1);
    SharedPreference.loadReja().then((value) => {
          print(value?.toJson().toString()),
        });
    SharedPreference.removeReja().then((value) => {
      print(value)
    });
  }

  @override
  Widget build(BuildContext context) {
    print(ruyxat.rejalar);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Rejalar Dasturi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          RejalarSanasi(
              sanaiTanlash, belgilanganSana, oldingiSana, keyingiSana),
          RejalarMalumoti(
              ruyxat.KunBuyichaReja(belgilanganSana), _bajarilganRejalar),
          RejalarRuyxati(ruyxat.KunBuyichaReja(belgilanganSana),
              bajarilganDebBelgilash, _rejaniUchirish),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          yangiRejaQushish();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
