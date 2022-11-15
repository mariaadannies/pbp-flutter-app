# Tugas 8

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Center
- Column
- Container
## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- onPressed
- onLongPressed
## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator mengelola stack berisi routes. Setiap kali method Navigator.push atau method-method serupa lainnya dipanggil, routes baru akan ditambahkan ke dalam stack tersebut.
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan drawer/hamburger menu pada app yang telah dibuat sebeumnya.  
Menggunakan kode 
```
drawer: Drawer(
  child: Column(
    children: [
      ...
          );
        },
      ),
    ],
  ),
),
```

2. Menambahkan tiga tombol navigasi pada drawer/hamburger.
Menambahkan kode berikut pada drawer
```
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
```

3. Menambahkan halaman form
Menambahkan elemen input dengan tipe data String berupa judul budget.
Menambahkan kode berikut pada form.dart
```
Padding(
  // Menggunakan padding sebesar 8 pixels
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Contoh: Beli Sate Pacil",
      labelText: "Judul",
      // Menambahkan icon agar lebih intuitif
      // icon: const Icon(Icons.people),
      // Menambahkan circular border agar lebih rapi
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    // Menambahkan behavior saat nama diketik
    onChanged: (String? value) {
      setState(() {
        judul = value!;
      });
    },
    // Menambahkan behavior saat data disimpan
    onSaved: (String? value) {
      setState(() {
        judul = value!;
      });
    },
    // Validator sebagai validasi form
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return 'Judul tidak boleh kosong!';
      }
      return null;
    },
  ),
),
```

Menambahkan elemen input dengan tipe data int berupa nominal budget.
Menambahkan kode berikut pada form.dart
```
Padding(
  // Menggunakan padding sebesar 8 pixels
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    decoration: InputDecoration(
      hintText: "Contoh: 15000",
      labelText: "Nominal",
      // Menambahkan icon agar lebih intuitif
      // icon: const Icon(Icons.people),
      // Menambahkan circular border agar lebih rapi
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    // Menambahkan behavior saat nama diketik
    onChanged: (String? value) {
      setState(() {
        nominal = int.parse(value!);
      });
    },
    // Menambahkan behavior saat data disimpan
    onSaved: (String? value) {
      setState(() {
        nominal = int.parse(value!);
      });
    },
    // Validator sebagai validasi form
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return 'Masukan nominal!';
      }

      // Cek apakah input berupa angka
      if (int.tryParse(value) == null) {
        return 'Nominal harus berupa angka!';
      }
      
      return null;
    },
  ),
  ),
```

Menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran.
Menambahkan kode berikut pada form.dart
```
ListTile(
  trailing: DropdownButton(
  value: strJenis,
  icon: const Icon(Icons.keyboard_arrow_down),
  items: lstJenis.map((String items) {
    return DropdownMenuItem(
      value: items,
      child: Text(items),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      strJenis = newValue!;
    });
  },
),
),
```

Menambahkan button untuk menyimpan budget.
Menambahkan kode berikut pada form.dart
```
TextButton(
  child: const Text(
    "Simpan",
    style: TextStyle(color: Colors.white),
  ),
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Menambahkan data ke list
      widget.addData(DataBudget(judul, nominal, strJenis));
      // Menampilkan snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil disimpan!'),
        ),
      );
      // Mengosongkan form
      _formKey.currentState!.reset();
    }
  },
),
```

4. Menambahkan halaman data budget
Menampilkan semua judul, nominal, dan tipe budget yang telah ditambahkan pada form.
Menambahkan kode berikut pada data.dart
```
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
```

# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.  
Stateless widget adalah widget pada flutter yang tidak dapat diubah (immutable) setelah dibuat. Sementara stateful widget adalah widget pada flutter yang dapat diubah (mutable) setelah dibuat.  

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.  
- Text, untuk menampilkan text 'ganjil atau 'genap'.  
- FloatingActionButton, button untuk melakukan increment dan - decrement counter.  

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState() digunakan bersama dengan statefulWidget pada flutter. Fungsi setState() memberi tahu flutter untuk membangun kembali elemen-elemen pada flutter saat suatu konsisi ditentukan.  

## Jelaskan perbedaan antara const dengan final.
Const digunakan untuk mendefinisikan seuatu variabel yang masih dapat dimodifikasi. Objek yang menggunakan const ditentukan seutuhnya pada saat program di-compile Sementara final berarti single-assignment atau suatu variabel harus memiliki initializer dan tidak dapat dimodifikasi.  

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat sebuah program Flutter baru dengan nama counter_7.  
Menggunakan command flutter create counter_7

2. Mengubah tampilan program menjadi seperti berikut.  
Menambahkan kode berikut pada floatingActionButton  
```
mainAxisAlignment: MainAxisAlignment.spaceBetween,
```

Menambahkan padding left pada button decrement    
```
child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
```

Menambahkan padding right pada button increment  
```
Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              )
            )
```

2. Mengimplementasikan logika berikut pada program.   

 Tombol + menambahkan angka sebanyak satu satuan.  
 Menggunakan kode  
 ```
 void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _visible = true;
    });
  }
 ```  
  
 Tombol - mengurangi angka sebanyak satu satuan. 
 Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.
 Menggunakan kode  
 ```
 void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter > 1) {
        _counter--;
      } else if (_counter == 1) {
        _counter = 0;
        _visible = false;
      } else {
        _counter = _counter;
      }
    });
  }
  ```  

 Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.
 Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.
 Angka 0 dianggap sebagai angka genap. 
 Menggunakan kode   
 ```
 Widget text() {
    const ganjil = Text('ganjil', style: TextStyle(color: Colors.blue));
    const genap = Text('genap', style: TextStyle(color: Colors.red));

    if (_counter % 2 == 0) {
      return genap;
    } else {
      return ganjil;
    }
  }
  ```  


# counter_7

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
