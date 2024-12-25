class RejaModeli {
  final String name;
  final DateTime kuni;
  bool bajarildi = false;
  final String id;

  RejaModeli({required this.name, required this.kuni, required this.id});

  RejaModeli.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        kuni = json['kuni'],
        id = json['id'];

  Map<String,dynamic> toJson()=>{
    'name':name,
    'kuni':kuni,
    'id':id
  };

  void bajarilganReja() {
    bajarildi = !bajarildi;
  }
}

class RejaModeli2 {
  final String name;
  final String kuni;
  bool bajarildi = false;
  final String id;

  RejaModeli2({required this.name, required this.kuni, required this.id});

  RejaModeli2.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        kuni = json['kuni'],
        id = json['id'];

  Map<String,dynamic> toJson()=>{
    'name':name,
    'kuni':kuni,
    'id':id
  };


}

class Rejalar {
  final List<RejaModeli> _rejalarRuyxati = [
    RejaModeli(name: "Bozorga Borish", kuni: DateTime.now(), id: "r1"),
    RejaModeli(name: "Maktabga Borish", kuni: DateTime.now(), id: "r2"),
    RejaModeli(name: "Flutterni urganish", kuni: DateTime.now(), id: "r3"),
    RejaModeli(name: "Kitob uqish", kuni: DateTime.now(), id: "r4"),
  ];

  List<RejaModeli> get rejalar {
    return _rejalarRuyxati;
  }

  List<RejaModeli> KunBuyichaReja(DateTime kun) {
    return rejalar
        .where((reja) =>
            reja.kuni.year == kun.year &&
            reja.kuni.month == kun.month &&
            reja.kuni.day == kun.day)
        .toList();
  }

  void addReja(String name, DateTime kun) {
    _rejalarRuyxati.add(RejaModeli(
        name: name, kuni: kun, id: "r${_rejalarRuyxati.length + 1}"));
  }
}
