import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['name'];
            controller.cNpm.text = data['npm'];
            controller.cAlamat.text = data['alamat'];
            controller.cProdi.text = data['program_studi'];
            controller.cJK.text = data['jk'].toString();
            return Padding(
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
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNpm,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Npm Mahasiswa"),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cAlamat,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Alamat"),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cProdi,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Program Studi"),
                  ),
                   SizedBox(
                    height: 10,
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
                    onPressed: () => controller.updateProduct(
                      controller.cNama.text,
                      controller.cNpm.text,
                      controller.cAlamat.text,
                      controller.cProdi.text,
                      controller.cJK.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}