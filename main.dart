// package yg dibuutuhkan aplikasi
import 'package:english_words/english_words.dart';
// paket bahasa inggris
import 'package:flutter/material.dart';
// paket untuk tampilan UI
import 'package:provider/provider.dart';
// paket untuk interaksi aplikasi
void main() {
  runApp(MyApp());//memanggil fungsi runapp yang mejalankan keseluruhan aplikasi dalam MyApp ()
}
//membuat abstrak aplikasi dari statelessWidget (templet aplikasi)aplikaisny bernama MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});//menunjukan bahwa aplikasi ini akan tetap, tidak berubah setelah di-build 

  @override //mengganti nilai lama yg sudah ada di template,dengan nilai-nilai yg baru(replace/overwrite)
  Widget build(BuildContext context) {
    //fungsi build adalah fungdi yang membangun UI (mengatur posisi widget,dst)
    //ChangeNotifierProvider mendengarkan/mendeteksi semua interaksi yang terjadi di apliksi
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),//membuat satu state/halaman bernama MyAppState
      child: MaterialApp( //pada state ini,menggunakan style desain MaterialUI
        title: 'Namer App',//diberi judul Namer App
        theme: ThemeData( //data tema aplikasi, di beri warna deepOrange
          useMaterial3: true, //versi materialUI yang dipakai versi 3
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(), //nama halaman "MyHomePage" yang menggunakan  state "MyAppState"
      ),
    );
  }
}
// mendefinisikan isi MyAppState
class MyAppState extends ChangeNotifier {
  //state MyAppState disini dengan 2 kata random yang digabung, katarandom tsb disimpan di variable WordPair
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}
//membuat layout 
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold( //base (canvas) dari layout
      body: Column( //diatas scaffold,ada body Body-nya diberi kolom
        children: [ //didalam kolom di beri teks
          Text('A random idea:'),
          Text(appState.current.asLowerCase),//mengambil random teks dari appstate pada variabel WordPair current,
          //diubah menjadi huruf kecil semua , dan ditampilkan sebagai teks
                    ElevatedButton(
            onPressed: () {
              print('button pressed!');
                appState.getNext();  // ← This instead of print().
      },
            child: Text('Next'),
          ),
              
        ],
      ),
    );
  }
}