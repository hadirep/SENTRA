// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/provider/add_art_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

class CreateArt extends StatefulWidget {
  static const routeName = '/create-art';
  const CreateArt({ Key? key }) : super(key: key);

  @override
  State<CreateArt> createState() => _CreateArtState();
}

class _CreateArtState extends State<CreateArt> {
  bool isLoading = false;

  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _descriptionController = TextEditingController(text: '');
  final TextEditingController _categoryController = TextEditingController(text: '');
  final TextEditingController _communityController = TextEditingController(text: '');
  final TextEditingController _noHpController = TextEditingController(text: '');
  final TextEditingController _emailController = TextEditingController(text: '');
  final TextEditingController _priceController = TextEditingController(text: '');
  final TextEditingController _isInstagramController = TextEditingController(text: '');
  final TextEditingController _isFacebookController = TextEditingController(text: '');
  final TextEditingController _provinceController = TextEditingController(text: '');

  final snackbarKey = GlobalKey<ScaffoldState>();

  late bool _validateName = false;
  late bool _validateDescription = false;
  late bool _validateCommunity = false;
  late bool _validateNoHp = false;
  late bool _validateEmail = false;
  late bool _validatePrice = false;
  late bool _validateProvince = false;


  final borderRadius = BorderRadius.circular(10);
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

  void submit(BuildContext context) {
    isLoading = true;
    Provider.of<AddArtProvider>(context, listen: false).storeArt(
        _nameController.text,
        _priceController.text,
        _categoryController.text,
        _communityController.text,
        _noHpController.text,
        _emailController.text,
        _provinceController.text,
        _descriptionController.text,
        _isFacebookController.text,
        _isInstagramController.text,
    ).then((res) {
      if (res) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const BusinessManagement()),).then((value) => setState(() {}));
        // Navigator.pushReplacement(context, BusinessManagement.routeName);
      } else {
        /// ALERT error
        var snackbar = const SnackBar(content: Text('Ops: Error. Hubungi Admin'));
        snackbarKey.currentState?.showSnackBar(snackbar);
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: snackbarKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
        title: const Text(
          'Tambah Data',
          style: TextStyle(
            color: Color(0xff2d4b94),
            fontWeight: FontWeight.bold),
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
                  // Container(
                  //   alignment: Alignment.topCenter,
                  //   child: Container(
                  //     height: MediaQuery.of(context).size.height * 0.14,
                  //     width:  MediaQuery.of(context).size.height * 0.14,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       border: Border.all(width: 4, color: Colors.white),
                  //       image: const DecorationImage(image: AssetImage('images/pencaksilat_pm_p.jpg'),
                  //         fit: BoxFit.fill,
                  //       ),
                  //       boxShadow: const [
                  //         BoxShadow(
                  //           color: Colors.grey,
                  //           offset: Offset(1.0, 5.0),
                  //           blurRadius: 6.0,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Container(alignment: Alignment.topCenter,
                  //   child: const Text("rentral",
                  //     style: TextStyle(
                  //       fontSize: 22, fontWeight: FontWeight.w800,
                  //       color: Color.fromARGB(255, 204, 203, 203),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Padding(padding: const EdgeInsets.all(22),
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
                            keyboardType: TextInputType.text,
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
                              errorText: _validateName ? 'Nama Harus Di Isi.' : null,
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
                            keyboardType: TextInputType.multiline,
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
                              errorText: _validateDescription ? 'Deskripsi Harus Di Isi.' : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Organisasi",
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
                            keyboardType: TextInputType.text,
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
                              errorText: _validateCommunity ? 'Organisasi Harus Di Isi.' : null,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Harga Sewa Seni",
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
                            keyboardType: TextInputType.number,
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
                              errorText: _validatePrice ? 'Harga Sewa Harus Di Isi.' : null,
                            ),
                          ),
                        ),
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
                          height:  MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
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
                              errorText: _validateEmail ? 'Email Harus Di Isi.' : null,
                            ),
                          ),
                        ),
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
                            keyboardType: TextInputType.text,
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
                          height:  MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            controller: _noHpController,
                            keyboardType: TextInputType.phone,
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
                              errorText: _validateNoHp ? 'Nomer WA Harus Di Isi.' : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                            controller: _isInstagramController,
                            keyboardType: TextInputType.text,
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
                            controller: _isFacebookController,
                            keyboardType: TextInputType.text,
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
                          height:  MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            controller: _provinceController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 234, 132, 0), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Input Provinsi',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 221, 221, 221), width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: const TextStyle(color: Colors.red),
                              errorText: _validateProvince ? 'Provinsi Harus Di Isi.' : null,
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
                            textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                        ),
                        //MULTI IMAGE PICKER
                        Column(
                          children: [
                            imagefiles != null?Wrap(
                              children: imagefiles!.map((imageone){
                                return Card(
                                  child: Container(
                                    height:  MediaQuery.of(context).size.height * 0.1,
                                    width: MediaQuery.of(context).size.height * 0.138,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(color: const Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,),
                                    child: ClipRRect(
                                      borderRadius: borderRadius,
                                      child: Image.file(File(imageone.path),
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
                                      border: Border.all(width: 3, color: const Color.fromARGB(255, 221, 221, 221))),
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
                                onPressed: () {
                                  // setState(() {
                                  //   _nameController.text.isEmpty ? _validateName = true : _validateName = false;
                                  //   _descriptionController.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                                  //   _communityController.text.isEmpty ? _validateCommunity = true : _validateCommunity = false;
                                  //   _noHpController.text.isEmpty ? _validateNoHp = true : _validateNoHp = false;
                                  //   _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                                  //   _priceController.text.isEmpty ? _validatePrice = true : _validatePrice = false;
                                  //   _provinceController.text.isEmpty ? _validateProvince = true : _validateProvince = false;
                                  // });
                                  submit(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromARGB(255, 234, 132, 0),
                                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),)
                                    : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.save, color: Colors.white,),
                                    SizedBox(width: 5),
                                    Text(
                                      'Save',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),
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