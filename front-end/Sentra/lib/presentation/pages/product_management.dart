import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductManagement extends StatefulWidget {
  static const routeName = '/product-management';
  const ProductManagement({ Key? key }) : super(key: key);

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
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
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Edit',
          style: TextStyle(
            color: Color.fromARGB(255, 45, 74, 148),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: 
        Padding(padding: const EdgeInsets.all(12.0),
        child: Image.asset("images/logos.jpeg"),
        ), 
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.14,
                      width:  MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        image: const DecorationImage(image: AssetImage('images/pencaksilat_pm_p.jpg'),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(alignment: Alignment.topCenter,
                    child: const Text("rentral", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 204, 203, 203),), ),),
                  const SizedBox(
                    height: 10,
                  ),
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
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
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
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
                            decoration: BoxDecoration(color: const Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,),
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
                                  border: Border.all(width: 3, color: const Color.fromARGB(255, 221, 221, 221))),
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
                              child: RaisedButton(
                                onPressed: () {},
                                color: const Color.fromARGB(255, 234, 132, 0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.download_rounded, color: Colors.white,),
                                    SizedBox(width: 5),
                                    Text(
                                      'Upload',
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