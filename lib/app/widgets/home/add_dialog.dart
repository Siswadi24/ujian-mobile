import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ujian_learningx/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddDialog extends StatelessWidget {
  const AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Add Data'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Menambahkan Container untuk menampung form input berupa foto.
            GetBuilder<HomeController>(
              builder: (_) => Row(
                children: [
                  controller.images.value.path != ""
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(controller.images.value.path),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            await controller.getImages(true);
                            controller.update();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add_a_photo),
                          ),
                        ),
                  const SizedBox(width: 15),
                  controller.images.value.path != ""
                      ? IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            controller.images.value = XFile("");
                            controller.update();
                          },
                        )
                      : const Text('Pilih Foto'),
                ],
              ),
            ),
            const TextField(
              // controller: controller.namaBarangController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            const TextField(
              // controller: controller.hargaController,
              decoration: InputDecoration(labelText: 'Harga'),
            ),
            const TextField(
              // controller: controller.tahunBeliController,
              decoration: InputDecoration(labelText: 'Tahun Beli'),
            ),
            TextFormField(
              // controller: controller.deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
              maxLines: 5,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // controller.addData();
              Get.back();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
