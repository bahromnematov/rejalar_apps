import 'package:flutter/material.dart';
import 'package:rejalar_apps/widgets/reja.dart';

import '../models/reja_modeli.dart';

class RejalarRuyxati extends StatelessWidget {
 final Function bajarilganDebBelgilash;
  List<RejaModeli> ruyxat;
  final Function _rejaniUchirish;

  RejalarRuyxati(this.ruyxat,this.bajarilganDebBelgilash,this._rejaniUchirish);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (ctx, index) {
        return Reja(ruyxat[index],bajarilganDebBelgilash,_rejaniUchirish);
      },
      itemCount: ruyxat.length,
    ));
  }
}
