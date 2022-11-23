import 'model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchlist>> fetchMyWatchList() async {
  var url = Uri.parse('https://pbp-tugas-2.herokuapp.com/mywatchlist/json/');
  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<MyWatchlist> listMyWatchList = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchList.add(MyWatchlist.fromJson(d));
    }
  }

  return listMyWatchList;
}
