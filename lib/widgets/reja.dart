import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/reja_modeli.dart';

class Reja extends StatefulWidget {
  RejaModeli reja;
  final Function bajarilganDebBelgilash;
  final Function _rejaniUchirish;

  Reja(this.reja, this.bajarilganDebBelgilash, this._rejaniUchirish);

  @override
  State<Reja> createState() => _RejaState();
}

class _RejaState extends State<Reja> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          widget.bajarilganDebBelgilash(widget.reja.id);
        },
        icon: widget.reja.bajarildi
            ? Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              )
            : Icon(Icons.circle_outlined),
      ),
      title: Text(
        "${widget.reja.name}",
        style: TextStyle(
            color: widget.reja.bajarildi ? Colors.grey : Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            decoration: widget.reja.bajarildi
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      // subtitle: Text(
      //     DateFormat("yyyy-MM-dd hh:mm").format(widget.reja.kuni).toString()),
      trailing: IconButton(
        onPressed: () {
          widget._rejaniUchirish(widget.reja.id);
        },
        icon: const Icon(
          Icons.delete_forever,
          color: Colors.red,
        ),
      ),
    );
  }
}
