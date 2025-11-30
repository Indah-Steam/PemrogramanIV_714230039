import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/contact-list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTS '),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            children: <Widget>[
              Center( 
                child: Image.asset(
                  'images/ulbi.jpg', 
                  width: 300, 
                  height: 120, 
                ),
              ),
              const SizedBox(height: 20),
              
              

              // 2. Teks Selamat Datang
              const Text(
                'Selamat Datang di ULBI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), 
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              // 3. Teks Deskripsi
              const Text(
                'Ini adalah home, kalian bebas berkreasi untuk membuat layout yang kalian inginkan.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Contact List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }
}