import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RejalarSanasi extends StatelessWidget {
  final Function sananiTanlash;
  final DateTime belgilanganSana;
  final Function keyingiSana;
  final Function oldingiSana;

  const RejalarSanasi(this.sananiTanlash, this.belgilanganSana,
      this.oldingiSana, this.keyingiSana);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              oldingiSana();
            },
            icon: Icon(
              Icons.arrow_left,
              size: 35,
            )),
        TextButton(
            onPressed: () {
              sananiTanlash();
            },
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(
                        text: "${DateFormat.EEEE().format(belgilanganSana)}, ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${DateFormat("d MMM").format(belgilanganSana)}"),
                  ]),
            )),
        IconButton(
            onPressed: () {
              keyingiSana();
            },
            icon: Icon(
              Icons.arrow_right,
              size: 35,
            )),
      ],
    );
  }
}
