class Incidents {
  DateTime? date;

  Incidents();
  Map<String, dynamic> toJson() => {'Date': date};
  Incidents.fromSnapshot(snapshot) : date = snapshot.data()['Date'].toDate();
}
