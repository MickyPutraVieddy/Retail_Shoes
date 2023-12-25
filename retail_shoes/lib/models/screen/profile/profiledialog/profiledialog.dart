import 'dart:async';

import 'package:flutter/material.dart';
import 'package:retail_shoes/models/colour/colour.dart';

// ignore: camel_case_types
class profileDialog extends StatefulWidget {
  const profileDialog({super.key});

  @override
  State<profileDialog> createState() => _profileDialogState();
}

// ignore: camel_case_types
class _profileDialogState extends State<profileDialog> {
// timer
  late Timer timer;

  // int duration
  int selectedindex = 0;

  bool canDismiss = false; // ini variabel untuk mengontrol penutupan dialog.

// membuat void initstate hanya di panggil  1 kali
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 6),
      (timer) {
        setState(() {
          selectedindex++; // ini perlu agar menambah gambar
          if (selectedindex == gambar.length) {
            selectedindex = 0;
            // Aktifkan kembali kemampuan penutupan setelah waktu tertentu.
            canDismiss = true;
            timer
                .cancel(); // ini untuk menghentikan timer ketika kondisi pengecekan terpenuhi
            // Tutup dialog setelah timer berhenti.
            Navigator.of(context).pop();
          } else {}
        });
      },
    );
    super.initState();
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  final List<String> gambar = [
    "lib/models/Image/splash/splashimage.png",
    "lib/models/Image/splash/splashimage.png"
  ];
  @override
  Widget build(BuildContext context) {
    // di dialog ini ketika mempunyai yaitu gambar sama text yang akan popup
    return AbsorbPointer(
      absorbing: !canDismiss,
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.ease,
              // kenapa kita set nya 0
              // biar image sebelumnya akan cepat berubah ke gambar yang di select
              reverseDuration: Duration(milliseconds: 0),
              // ini buat animated switchernya menggunakan transisation builder
              // jadi di sini kita me return rotation transation imagenya
              // akan rotate sesuai image
              transitionBuilder: (child, animation) {
                // Menentukan warna berdasarkan apakah rotasi sudah selesai atau masih berlangsung
                Color color =
                    canDismiss ? Colors.green : Color(hexcolour("#6C5ECF"));
                // ini buat pengecekan jika loading selesai warna gambar berubah menggnakan colorfiltered
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.modulate),
                  child: RotationTransition(
                    turns: animation,
                    child: child,
                  ),
                );
              },
              // ini buat list imagenya, edit image di sini
              child: Image(
                key: UniqueKey(),
                image: AssetImage(gambar[selectedindex]),
                width: 78,
                height: 78,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Loading",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
