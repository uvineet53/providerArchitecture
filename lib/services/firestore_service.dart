import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/models/report.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;
  var random = Random();
  Stream<List<Report>> getReports() {
    return _db
        .collection('reports')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => Report.fromJson(document.data))
            .toList());
  }

  Future<void> addReport() {
    var temp = random.nextInt(10);
    var line = (temp < 5) ? 'Swix' : 'Toco';
    var wax = (temp.isEven) ? 'Red' : 'Green';
    var datamap = Map<String, dynamic>();
    datamap['line'] = line;
    datamap['temp'] = temp;
    datamap['wax'] = wax;
    datamap['timestamp'] = DateTime.now().toIso8601String();
    return _db.collection('reports').add(datamap);
  }

  // int next(int min, int max) => min = random.nextInt(max - min);
}
