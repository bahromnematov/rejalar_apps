import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YangiReja extends StatefulWidget {
  final Function rejaQushish;

  const YangiReja(this.rejaQushish);

  @override
  State<YangiReja> createState() => _YangiRejaState();
}

class _YangiRejaState extends State<YangiReja> {
  DateTime? rejaUchunSana;
  final _rejaController = TextEditingController();

  void rejaUchunSanaTanlash() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2023),
            lastDate: DateTime(2030),
            initialDate: DateTime.now())
        .then((sana) {
      setState(() {
        rejaUchunSana = sana;
        print(rejaUchunSana);
      });
    });
  }

  void submit() {
    if (_rejaController.text.isEmpty || rejaUchunSana == null) {
      return;
    }
    print(_rejaController.text);

      widget.rejaQushish(_rejaController.text, rejaUchunSana);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _rejaController,
            decoration: InputDecoration(labelText: "Reja Nomi"),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rejaUchunSana == null
                    ? "Reja Kuni Tanlanmagan"
                    : "${DateFormat("d MMM, yyyy").format(rejaUchunSana!)}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: rejaUchunSana == null
                        ? FontWeight.w300
                        : FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    rejaUchunSanaTanlash();
                  },
                  child: Text(
                    "KUNNI TANLASH",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "BEKOR QILISH",
                    style: TextStyle(fontSize: 17),
                  )),
              ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text(
                    "KIRITISH",
                    style: TextStyle(fontSize: 17),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
