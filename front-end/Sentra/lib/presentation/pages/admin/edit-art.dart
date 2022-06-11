import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

class EditArt extends StatefulWidget {
  static const routeName = '/edit-art';
  const EditArt({ Key? key }) : super(key: key);

  @override
  State<EditArt> createState() => _EditArtState();
}

class _EditArtState extends State<EditArt> {
  ApiService apiService = ApiService();
  final borderRadius = BorderRadius.circular(10);
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _telpController = TextEditingController();
  final _instagramController = TextEditingController();
  final _facebookController = TextEditingController();
  final _provinceController = TextEditingController();

  File? image;
  File? imageDocummentation;

  Future getImage() async{
    final ImagePicker picker =ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {

    });
  }

  Future getImageDocummentation() async{
    final ImagePicker picker =ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    imageDocummentation = File(imagePicked!.path);
    setState(() {

    });
  }

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      if(pickedfiles != null){
        imagefiles = pickedfiles;
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
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
        title: const Text(
          'Ubah Data',
          style: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          height:  MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Deskripsi",
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
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                            controller: _telpController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Username Instagram",
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
                            controller: _instagramController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                        SizedBox(
                          height:  MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            controller: _facebookController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                                borderRadius: BorderRadius.circular(10),
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
                        const SizedBox(height: 10,),
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
                            imagefiles != null?Wrap(
                              children: imagefiles!.map((imageOne){
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
                                    borderRadius: BorderRadius.circular(10),
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
                            const SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              child: ElevatedButton(
                                onPressed: () {},
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
      ),
    );
  }
}