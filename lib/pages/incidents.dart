class Incidents {
  String? query;
  DateTime? date;

  Incidents();
  Map<String, dynamic> toJson() => {"query": query, 'Date': date};
  Incidents.fromSnapshot(snapshot)
      : query = snapshot.data()['query'],
        date = snapshot.data()['Date'].toDate();
}
