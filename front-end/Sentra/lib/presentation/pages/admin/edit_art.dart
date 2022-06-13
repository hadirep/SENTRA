import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

class EditArt extends StatefulWidget {
  static const routeName = '/edit-art';
  const EditArt({Key? key}) : super(key: key);

  @override
  State<EditArt> createState() => _EditArtState();
}

class _EditArtState extends State<EditArt> {
  ApiService apiService = ApiService();
  final borderRadius = BorderRadius.circular(10);

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _communityController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _provinceController = TextEditingController();
  final _isFacebookController = TextEditingController();
  final _isInstagramController = TextEditingController();

  File? image;
  File? imageDocummentation;

  Future getImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {

    });
  }

  Future getImageDocumentation() async{
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    imageDocummentation = File(imagePicked!.path);
    setState(() {

    });
  }

  final ImagePicker imgPicker = ImagePicker();
  List<XFile>? imageFiles;

  openImages() async {
    try {
      var pickedFiles = await imgPicker.pickMultiImage();
      if(pickedFiles != null){
        imageFiles = pickedFiles;
        setState(() {
        });
      }else{
        if (kDebugMode) {
          print("No image is selected.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("error while picking file.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as
    List<String?>;
    if (args[1]!.isNotEmpty) {
      _nameController.text = args[1]!;
    }
    if (args[2]!.isNotEmpty) {
      _priceController.text = args[2]!;
    }
    if (args[3]!.isNotEmpty) {
      _categoryController.text = args[3]!;
    }
    if (args[4]!.isNotEmpty) {
      _communityController.text = args[4]!;
    }
    if (args[5]!.isNotEmpty) {
      _phoneNumberController.text = args[5]!;
    }
    if (args[6]!.isNotEmpty) {
      _emailController.text = args[6]!;
    }
    if (args[7]!.isNotEmpty) {
      _provinceController.text = args[7]!;
    }
    if (args[8]!.isNotEmpty) {
      _isFacebookController.text = args[8]!;
    }
    if (args[9]!.isNotEmpty) {
      _isInstagramController.text = args[9]!;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
        title: const Text(
          'Ubah Data',
          style: TextStyle(
            color: textPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 22, left: 22),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Nama Seni",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Harga",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:  MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _priceController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Kategori",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:  MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _categoryController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Komunitas",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:  MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _communityController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Nomor Telepon",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Email",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Provinsi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _provinceController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Akun Facebook",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _isFacebookController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Akun Instagram",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: _isInstagramController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                              ),
                              borderRadius: borderRadius,
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Foto Seni",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      image != null? Container(
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.45,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,
                        ),
                        child: ClipRRect(
                          borderRadius: borderRadius,
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ) : Container(),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () async{
                          await getImage();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            // margin: const EdgeInsets.only(left: 50.0),
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              border: Border.all(
                                width: 3, color: const Color.fromARGB(255, 221, 221, 221),
                              ),
                            ),
                            child: const Icon(
                              Icons.add_a_photo,
                              color: Color.fromARGB(255, 221, 221, 221), size: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Dokumentasi",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          imageFiles != null?Wrap(
                            children: imageFiles!.map((imageOne){
                              return Card(
                                child: Container(
                                  height:  MediaQuery.of(context).size.height * 0.1,
                                  width: MediaQuery.of(context).size.height * 0.138,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 221, 221, 221),
                                    borderRadius: borderRadius,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: borderRadius,
                                    child: Image.file(File(imageOne.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }, ).toList(),
                          ) : Container(),
                          GestureDetector(
                            onTap: () {
                              openImages();
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  border: Border.all(
                                    width: 3, color: const Color.fromARGB(255, 221, 221, 221),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 221, 221, 221), size: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: ElevatedButton(
                              onPressed: () async {
                                bool response =
                                await apiService.putArtList(args[0]!,
                                  _nameController.text, _priceController.text,
                                  _categoryController.text, _communityController.text,
                                  _phoneNumberController.text, _emailController.text,
                                  _provinceController.text, _isFacebookController.text.toString(),
                                  _isInstagramController.text.toString(),
                                );

                                if (response){
                                  Navigator.pushNamed(context, BusinessManagement.routeName);
                                } else {
                                  if (kDebugMode) {
                                    print('Gagal merubah data');
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 234, 132, 0),
                                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.download_rounded, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text(
                                    'Upload',
                                    style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}