import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/provider/add_art_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

import 'package:http/http.dart' as http;

class CreateArt extends StatefulWidget {
  static const routeName = '/create-art';
  const CreateArt({ Key? key }) : super(key: key);

  @override
  State<CreateArt> createState() => _CreateArtState();
}

class _CreateArtState extends State<CreateArt> {
  final snackbarKey = GlobalKey<ScaffoldState>();
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
  final _picker = ImagePicker();
  bool showSpinner = false ;

  dynamic stream ;
  dynamic length ;


  Future getImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery , imageQuality: 80);

    if(pickedFile!= null ){
      image = File(pickedFile.path);
      setState(() {
      });
    }else {
      print('no image selected');
    }
  }


  Future<void> uploadImage ()async{
    isLoading = true;
    setState(() {
      isLoading = true;
      showSpinner = true ;
    });
    var baseUrl = Uri.parse('https://sentra.dokternak.id/api/kesenians');

    stream  = http.ByteStream(image!.openRead());
    stream.cast();

    length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = http.MultipartRequest('POST', baseUrl);

    request.fields['name'] = _nameController.text ;
    request.fields['price'] = _descriptionController.text ;
    request.fields['category'] = _categoryController.text ;
    request.fields['community'] = _communityController.text ;
    request.fields['phone_number'] = _noHpController.text ;
    request.fields['email'] = _emailController.text ;
    request.fields['province'] = _provinceController.text ;
    request.fields['description'] = _descriptionController.text ;
    request.fields['is_facebook'] = _isFacebookController.text ;
    request.fields['is_instagram'] = _isInstagramController.text ;

    // var multiport = http.MultipartFile(
    //     'image',
    //     stream,
    //     length);
    
    var multiport = await http.MultipartFile.fromPath('image', image!.path);
    
    request.files.add(multiport);

    var response = await request.send() ;

    print(response.stream.toString());
    if(response.statusCode == 201){
      isLoading = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BusinessManagement()),
            (Route<dynamic> route) => false,
      );
      print('image uploaded');
    }else {
      print('failed');
      isLoading = true;
    }
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
          isLoading = false;
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
      stream,
      length,
    ).then((res) {
      if (res) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BusinessManagement()),
              (Route<dynamic> route) => false,
        );
        // Navigator.pushReplacementNamed(context, BusinessManagement.routeName);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //       builder: (BuildContext context) => const BusinessManagement()),).then((value) => setState(() {}));
      } else {
        /// ALERT EROR
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

  Widget _customButton(BuildContext context, Function() handle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: handle,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            : const Center(
          child: Text(
            "Laporkan",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only
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
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only
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
                                  uploadImage();
                                },
                                // onPressed: () {
                                //   setState(() {
                                //     _nameController.text.isEmpty ? _validateName = true : _validateName = false;
                                //     _descriptionController.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                                //     _communityController.text.isEmpty ? _validateCommunity = true : _validateCommunity = false;
                                //     _noHpController.text.isEmpty ? _validateNoHp = true : _validateNoHp = false;
                                //     _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                                //     _priceController.text.isEmpty ? _validatePrice = true : _validatePrice = false;
                                //     _provinceController.text.isEmpty ? _validateProvince = true : _validateProvince = false;
                                //   });
                                //   if(
                                //       _nameController.text.isNotEmpty &&
                                //       _descriptionController.text.isNotEmpty &&
                                //       _communityController.text.isNotEmpty &&
                                //       _noHpController.text.isNotEmpty &&
                                //       _emailController.text.isNotEmpty &&
                                //       _priceController.text.isNotEmpty &&
                                //       _provinceController.text.isNotEmpty
                                //   ) {
                                //     submit(context);
                                //   }
                                //
                                // },
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