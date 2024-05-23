import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ujian_learningx/app/widgets/home/add_dialog.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Koleksiku Punyaku',
          style: GoogleFonts.nunito(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://via.placeholder.com/150'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Jam Tangan AC",
                                style: GoogleFonts.nunito(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              '(2015)',
                              style: GoogleFonts.nunito(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Text(
                          'Harga Rp. 2.000.000',
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.green[700]),
                        ),
                        const SizedBox(height: 10),
                        const Expanded(
                          child: Text(
                            'Jam tangan ini sangatlah mahal dan iconik, karena jam tangan ini tidak dijual di tempat umum melainkan di jual ditempat-tempat khusus dan hanya orang-orang tertentu yang pantas untuk mendapatkannya karena jam ini tergolong ke dalam jam atau barang yang lama dan antik, oleh karena itu harganya juga sangatlah terbilang mahal.',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Menampilkan Dialog Pop Up yang didalamnya berisi (TextFormField Foto, Nama barang, Harga, Tahun Beli, dan Deskripsi).
          //Jika ada yang kosong, muncul pesan yang menunjukkan bahwa semua kolom harus diisi
          //Jika tidak ada yang kosong, muncul pesan yang menunjukkan bahwa data yang diinputkan sudah benar
          Get.dialog(
            const AddDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
