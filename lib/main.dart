import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini/consts.dart';
import 'package:gemini/pages/home_page.dart';


void main() {
  Gemini.init(
    apiKey: geminiApiKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  // Inisialisasi variabel untuk menyimpan informasi versi
  String _version = 'Loading...';
  String _appName = 'My App'; // Nama default

  // ... di dalam class _AboutAppScreenState

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  // Fungsi asinkron untuk mengambil info package
  Future<void> _initPackageInfo() async {
    var PackageInfo;
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
      _appName = info.appName;
    });
  }
  
// ... (Lanjut ke Langkah 4)

// ... di dalam class _AboutAppScreenState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(
        children: <Widget>[
          // --- Implementasi AboutListTile ---
          AboutListTile(
            icon: const Icon(Icons.info_outline),
            applicationIcon: const FlutterLogo(), // Ganti dengan widget Logo Aplikasi Anda
            applicationName: _appName,
            applicationVersion: _version,

            // *** INFORMASI COPYRIGHT PENTING DI SINI ***
            applicationLegalese: 
                'Irgi Alyansa Perdana-23552011210 © 2025 - ${DateTime.now().year} .',

            // Konten tambahan yang muncul di dalam dialog
            aboutBoxChildren: const [
              SizedBox(height: 20),
              Text(
                'Aplikasi ini adalah contoh implementasi chatting menggunakan Gemini API dan Dash Chat 2.',
                style: TextStyle(fontSize: 14),
              ),
              // Anda bisa menambahkan TextButton untuk Tautan Kebijakan Privasi di sini
            ],
          ),
          const Divider(),
          // ... Item atau Widget lainnya
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
   
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
