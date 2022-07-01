// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
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

  late final bool _validateName = false;
  late final bool _validateDescription = false;
  late final bool _validateCommunity = false;
  late final bool _validateNoHp = false;
  late final bool _validateEmail = false;
  late final bool _validatePrice = false;
  late final bool _validateProvince = false;

  final borderRadius = BorderRadius.circular(10);
  File? image;
  List<XFile>? imageDocumentation;
  final _picker = ImagePicker();
  final ImagePicker imgPicker = ImagePicker();
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
      const snackbar = SnackBar(content: Text('no image selected'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  openImages() async {
    try {
      var pickedFiles = await imgPicker.pickMultiImage();
      if(pickedFiles != null){
        imageDocumentation = pickedFiles;
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

  Future<void> uploadImage ()async{
    isLoading = true;
    setState(() {
      isLoading = true;
      showSpinner = true ;
    });

    var baseUrl = Uri.parse('https://sentra.dokternak.id/api/kesenians');
    var request = http.MultipartRequest('POST', baseUrl);

    request.fields['name'] = _nameController.text ;
    request.fields['price'] = _priceController.text ;
    request.fields['category'] = _categoryController.text ;
    request.fields['community'] = _communityController.text ;
    request.fields['phone_number'] = _noHpController.text ;
    request.fields['email'] = _emailController.text ;
    request.fields['province'] = _provinceController.text ;
    request.fields['description'] = _descriptionController.text ;
    request.fields['is_facebook'] = _isFacebookController.text ;
    request.fields['is_instagram'] = _isInstagramController.text ;
    
    

    for(int i = 0; i < imageDocumentation!.length; i++){
      var multiPortDocumentation = await http.MultipartFile.fromPath('documentation[]', imageDocumentation![i].path);
      request.files.add(multiPortDocumentation);
    }

    var response = await request.send() ;
    if(response.statusCode == 201){
      const snackbar = SnackBar(content: Text('Tambah Data Berhasil'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      isLoading = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BusinessManagement()),
            (Route<dynamic> route) => false,
      );
    }else {
      isLoading = true;
      const snackbar = SnackBar(content: Text('Tambah Data Gagal!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
      key: snackbarKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BusinessManagement()),
                  (Route<dynamic> route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: secondaryColor,),
        ),
        title: Text(
          AppLocalizations.of(context)!.addData,
          style: const TextStyle(
            color: Color(0xff2d4b94),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artName,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                              errorText: _validateName ? AppLocalizations.of(context)!.validateName : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artDescription,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 234, 132, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height:  MediaQuery.of(context).size.height * 0.1,
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
                              errorText: _validateDescription ? AppLocalizations.of(context)!.validateDescription : null,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artPrice,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                              errorText: _validatePrice ? AppLocalizations.of(context)!.validatePrice : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artOrganization,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                              errorText: _validateCommunity ? AppLocalizations.of(context)!.validateOrganization : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artEmail,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 234, 132, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
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
                              errorText: _validateEmail ? AppLocalizations.of(context)!.validateEmail : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artCategory,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                          child: Text(
                            AppLocalizations.of(context)!.artPhone,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                              errorText: _validateNoHp ? AppLocalizations.of(context)!.validatePhone : null,
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
                          child: Text(
                            AppLocalizations.of(context)!.artFacebook,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 234, 132, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
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
                          child: Text(
                            AppLocalizations.of(context)!.artProvince,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                              errorText: _validateProvince ? AppLocalizations.of(context)!.validateProvince : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.artImage,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
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
                          child: Text(
                            AppLocalizations.of(context)!.artDocumentation,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 234, 132, 0),
                            ),
                          ),
                        ),
                        //MULTI IMAGE PICKER
                        Column(
                          children: [
                            imageDocumentation != null?Wrap(
                              children: imageDocumentation!.map((imageone){
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
                                onPressed: () {
                                  uploadImage();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: const Color.fromARGB(255, 234, 132, 0),
                                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                                ),
                                child: isLoading
                                    ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),)
                                    : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.save, color: Colors.white),
                                    const SizedBox(width: 5),
                                    Text(
                                      AppLocalizations.of(context)!.artSave,
                                      style: const TextStyle(
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
  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _communityController.dispose();
    _categoryController.dispose();
    _noHpController.dispose();
    _emailController.dispose();
    _provinceController.dispose();
    _descriptionController.dispose();
    _isFacebookController.dispose();
    _isInstagramController.dispose();
    super.dispose();
  }
}

