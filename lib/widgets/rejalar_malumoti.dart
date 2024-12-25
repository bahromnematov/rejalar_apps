import 'package:flutter/material.dart';

import '../models/reja_modeli.dart';

class RejalarMalumoti extends StatelessWidget {
  int _bajarilganRejalar;
  List<RejaModeli> ruyxat;

  RejalarMalumoti(this.ruyxat,this._bajarilganRejalar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ruyxat.length < 10 ? "0${ruyxat.length}" : "${ruyxat.length}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Barcha Rejalaringiz",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _bajarilganRejalar < 10
                    ? "0$_bajarilganRejalar"
                    : "$_bajarilganRejalar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                "Bajarilgan Rejalaringiz",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }
}
