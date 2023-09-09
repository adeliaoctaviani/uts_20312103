import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mahasiswa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Mahasiswa"),
            ),
            SizedBox(
              height:10,
            ),
            TextField(
            controller: controller.cNpm,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Npm Mahasiswa"),
            ),
            SizedBox(
              height:10,
            ),
            TextField(
            controller: controller.cAlamat,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Alamat"),
            ),
            SizedBox(
              height:10,
            ),
            TextField(
            controller: controller.cProdi,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Program Studi"),
            ),
            SizedBox(
              height:10,
            ),
            TextField(
            controller: controller.cJK,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Jenis Kelamin"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.cNama.text,
                controller.cNpm.text,
                controller.cAlamat.text,
                controller.cProdi.text,
                controller.cJK.text,
              ),
              child: Text("Simpan"),
            ),
          ],
        )
      )
    );
  }
}
