import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;
  late TextEditingController cProdi;
  late TextEditingController cJK;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String npm, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc(id);
    try {
      await productById.update({
        "name": nama,
        "npm": npm,
        "alamat": alamat,
        "prodi": program_studi,
        "jk": jk,
      });

       Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data Produk.",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();
          cProdi.clear();
          cJK.clear();
          Get.back();
          Get.back();
        },  
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa",
      );
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cHarga = TextEditingController();
    super.onInit();
  }

  @override
  void onClosed() {
    cNama.dispose();
    cHarga.dispose();
    super.onClose();
  }
}