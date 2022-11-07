# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.  
Stateless widget adalah widget pada flutter yang tidak dapat diubah (immutable) setelah dibuat. Sementara stateful widget adalah widget pada flutter yang dapat diubah (mutable) setelah dibuat.  

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.  
- Text, untuk menampilkan text 'ganjil atau 'genap'.  
FloatingActionButton, button untuk melakukan increment dan - decrement counter.  

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
