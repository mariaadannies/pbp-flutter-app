import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key, required this.lst, required this.addData});
  final List<DataBudget> lst;
  final Function(DataBudget) addData;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data'),
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
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: widget.lst.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(
                    title: Text(widget.lst[index].judul),
                    subtitle: Text(widget.lst[index].nominal.toString()),
                    trailing: Text(widget.lst[index].tipe),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
