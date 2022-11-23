import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/fetchmywatchlist.dart';
import 'package:counter_7/model/mywatchlist.dart';

import '../main.dart';

// Detail Page untuk menampilkan detail data MyWatchList
class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.watched,
      required this.title,
      required this.rating,
      required this.releaseDate,
      required this.review});
  final String watched;
  final String title;
  final int rating;
  final String releaseDate;
  final String review;

  @override
  Widget build(BuildContext context) {
    var dataMyWatchlist;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Row(
              children: [
                SizedBox(width: 15, height: 25),
                Text(
                  'Release Date: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(releaseDate, style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 15, height: 25),
                Text('Rating: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(rating.toString(), style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 15, height: 25),
                Text('Status: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(watched, style: TextStyle(fontSize: 20)),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 15, height: 25),
                Text('Review: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 15, height: 25),
                Text(review, style: TextStyle(fontSize: 20)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key, required this.lst, required this.addData});
  final List<DataBudget> lst;
  final Function(DataBudget) addData;

  @override
  _MyWatchListPageState createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  late final Future _getMyWatchListAsync;

  @override
  void initState() {
    super.initState();
    _getMyWatchListAsync = fetchMyWatchList();
  }

  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.red;
      }
      return Colors.grey;
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('My Watch List'),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              lst: widget.lst,
                              addData: widget.addData,
                            )),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFormPage(
                              lst: widget.lst,
                              addData: widget.addData,
                            )),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyDataPage(
                              lst: widget.lst,
                              addData: widget.addData,
                            )),
                  );
                },
              ),
              ListTile(
                title: const Text('My Watch List'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyWatchListPage(
                              lst: widget.lst,
                              addData: widget.addData,
                            )),
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: _getMyWatchListAsync,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada List :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        watched: snapshot
                                            .data![index].fields.watched,
                                        title:
                                            snapshot.data![index].fields.title,
                                        rating:
                                            snapshot.data![index].fields.rating,
                                        releaseDate: snapshot
                                            .data![index].fields.releaseDate,
                                        review:
                                            snapshot.data![index].fields.review,
                                      )),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: snapshot.data![index].fields.isWatched
                                      ? Colors.blue
                                      : Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value:
                                        snapshot.data![index].fields.isWatched,
                                    onChanged: (newValue) {
                                      setState(() {
                                        snapshot.data![index].fields.isWatched =
                                            !snapshot
                                                .data![index].fields.isWatched;
                                        snapshot.data![index].fields.isWatched
                                            ? snapshot.data![index].fields
                                                .watched = "Ya"
                                            : snapshot.data![index].fields
                                                .watched = "Tidak";
                                      });
                                    }),
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
