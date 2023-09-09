import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;
  late TextEditingController cProdi;
  late TextEditingController cJK;


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String nama, String harga) async {
    CollectionReference mahasiswa= firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "name" : nama,
        "npm" : npm,
        "alamat" : alamat,
        "prodi" : program_studi,
        "jk" : jk,
    });
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil menyimpan data produk",
      onConfirm: (){
        cNama.clear();
        cNpm.clear();
        cAlamat.clear();
        cProdi.clear();
        cJK.clear();
        Get.back();
        Get.back();
        textConfirm: "OK";      }
    );
  }catch (e){

    }

  }
  
  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    cProdi = TextEditingController();
    cJK = TextEditingController();

    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNpm.clear();
    cAlamat.clear();
    cProdi.clear();
    cJK.clear();
    super.onClose();
  }
}