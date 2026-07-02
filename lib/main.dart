import 'package:cakrawala_app/belajar_state/page.dart';
import 'package:cakrawala_app/detail_product/page.dart';
import 'package:cakrawala_app/email_list/page.dart';
import 'package:cakrawala_app/interaksi_halaman/page.dart';
import 'package:cakrawala_app/login/page.dart';
import 'package:cakrawala_app/product_list/page.dart';
import 'package:cakrawala_app/profile/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Flutter',
      initialRoute: '/login',
      routes: {
        '/': (context) => const HalamanUtama(),
        '/belajar-state': (context) => const BelajarState(),
        '/products': (context) => ProductList(),
        '/profile': (context) => const ProfilePage(),
        '/detail-product': (context) => const DetailProduct(),
        '/login': (context) => const LoginPage(),
        '/mail': (context) => const EmailList(),
        '/interaksi': (context) => const InteraksiPage()
      },
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  var _selectedIndex = 0;

  final List<Widget> _pages = [
    ProductList(),
    const BelajarState(),
    const ProfilePage(),
  ];

  final List<String> _titleList = ["Product List", "Belajar State", "Profile"];

  Drawer get customDrawer => Drawer(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const ListTile(
              title: Text("Beranda"),
            ),
            const ListTile(
              title: Text("Profile"),
            ),
            ListTile(
              title: const Text("Belajar Interaksi"),
              onTap: () {
                Navigator.of(context).pushNamed("/interaksi");
              },
            ),
            const Divider(),
            const ListTile(
              title: Text("Logout"),
            ),
          ],
        ),
      );

  get emailAction => IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/mail');
      },
      icon: const Icon(Icons.email));
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titleList[_selectedIndex]),
        actions: [_selectedIndex != 2 ? emailAction : const SizedBox.shrink()],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          elevation: 0,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.4),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag_rounded),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet_rounded),
              label: 'State',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
      drawer: customDrawer,
    );
  }
}
