import 'package:flutter/material.dart';

class InteraksiPage extends StatefulWidget {
  const InteraksiPage({super.key});

  @override
  State<InteraksiPage> createState() => _InteraksiPageState();
}

class _InteraksiPageState extends State<InteraksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Interaksi Halaman"),
        // ),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Data ini telah dihapus"),
                  duration: const Duration(seconds: 5),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: const Text("Snackbar"),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Warning"),
                  content:
                      const Text("Device Anda in vulnurable state.\nPercaya?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Alert Dialog"),
          ),
          ElevatedButton(
            onPressed: () async {
              String? pilihan = await showDialog(
                context: context,
                builder: (context) => const SimpleDialog(
                  title: Text("Pili metode pembayaran"),
                  children: [
                    SimpleDialogOption(
                      child: ListTile(
                        leading: Icon(Icons.crop_free),
                        title: Text("QRIS"),
                        subtitle: Text("QRIS"),
                      ),
                    ),
                    SimpleDialogOption(
                      child: ListTile(
                        leading: Icon(Icons.account_balance),
                        title: Text("Transfer Bank"),
                        subtitle: Text("BCA, Mandiri, etc"),
                      ),
                    ),
                    SimpleDialogOption(
                      child: ListTile(
                        leading: Icon(Icons.credit_card),
                        title: Text("Kartu Debit/Kredit"),
                        subtitle: Text("Debit/Kredit"),
                      ),
                    ),
                  ],
                ),
              );
              print(pilihan);
            },
            child: const Text("Simple Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2.0)),
                        ),
                      ),
                      const Text("Data"),
                      ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: const Text("Data 1"),
                        onTap: () {
                          Navigator.pop(context, "Data 1");
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: const Text("Data 2"),
                        onTap: () {
                          Navigator.pop(context, "Data 2");
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text("Bottom Sheet"),
          ),
        ],
      ),
    ));
  }
}
