import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyKalkulatorHomePage extends StatefulWidget {
  const MyKalkulatorHomePage({super.key});

  @override
  State<MyKalkulatorHomePage> createState() => _MyKalkulatorHomePageState();
}

class _MyKalkulatorHomePageState extends State<MyKalkulatorHomePage> {
  bool _isDarkMode = false;

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  double hasil = 0;
  
  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  Future<void> _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
        //backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: _isDarkMode ? Colors.red : Colors.blue,
        child: Column(
          children: [
            Container(
            margin: const EdgeInsets.only(right: 0, top:10),
            child: SwitchListTile(
              value: _isDarkMode,
              onChanged: (value) => _toggleTheme(),
            ),  
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: firstController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Angka 1',
              ),
             keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: secondController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Angka 2',
              ),
              keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                  // code execute on button press
                    double angka1 = double.parse(firstController.text);
                    double angka2 = double.parse(secondController.text);
                    setState(() {
                      hasil = angka1+angka2;
                    });                  
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: (){
                  // code execute on button press
                    double angka1 = double.parse(firstController.text);
                    double angka2 = double.parse(secondController.text);
                    setState(() {
                      hasil = angka1-angka2;
                    }); 
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: (){
                  // code execute on button press
                    double angka1 = double.parse(firstController.text);
                    double angka2 = double.parse(secondController.text);
                    setState(() {
                      hasil = angka1*angka2;
                    });
                  },
                  child: const Text('x'),
                ),
                ElevatedButton(
                  onPressed: (){
                  // code execute on button press
                    double angka1 = double.parse(firstController.text);
                    double angka2 = double.parse(secondController.text);
                    setState(() {
                      hasil = angka1/angka2;
                    }); 
                  },
                  child: const Text('/'),
                ),
              ],
            ),
             const SizedBox(
              height: 20,
            ),
            Text('Hasil : $hasil',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              background: Paint()
                ..strokeWidth = 25.0
                ..color = Colors.lightGreen
                ..style = PaintingStyle.stroke
                ..strokeJoin = StrokeJoin.round
              ),
            ),

          ],
        ),
      ),

    );
  }
}