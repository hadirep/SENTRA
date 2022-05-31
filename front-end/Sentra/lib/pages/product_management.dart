import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductManagement extends StatefulWidget {
  static const routeName = '/product_management';
  const ProductManagement({ Key? key }) : super(key: key);

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  final borderRadius = BorderRadius.circular(10);
  File? image;
  File? imageDocummentation;
  // File? selectImages;
  

  Future getImage() async{
    final ImagePicker _picker =ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {
    });
  }

    Future getImageDocummentation() async{
    final ImagePicker _picker =ImagePicker();
    final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
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
        print("No image is selected.");
    }
}catch (e) {
    print("error while picking file.");
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Container (child: Text('Edit', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ), 
        ),
        centerTitle: true,
        leading: 
        Padding(padding: const EdgeInsets.all(12.0),
        child: Container(child: Image.asset("images/logos.jpeg")
        ),  
        ), 
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(90),
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        image: DecorationImage(image: AssetImage('images/pencaksilat_pm_p.jpg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 6.0
                          )
                        ]
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(alignment: Alignment.topCenter,
                  child: Text("rentral", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 204, 203, 203),), ),),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(padding: EdgeInsets.all(22),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama Seni", 
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                      ),
                      Container(
                        height:  MediaQuery.of(context).size.height * 0.04,
                      child: TextField(
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                         borderRadius: BorderRadius.circular(10),
                       ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
                       borderRadius: BorderRadius.circular(10),
                     ),
                      labelStyle: TextStyle(color: Colors.red)
                     ),
                   ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Deskripsi", 
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                      ),
                      Container(
                        height:  MediaQuery.of(context).size.height * 0.04,
                      child: TextField(
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                         borderRadius: BorderRadius.circular(10),
                       ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
                       borderRadius: BorderRadius.circular(10),
                     ),
                      labelStyle: TextStyle(color: Colors.red)
                     ),
                   ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nomor Telepon", 
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                      ),
                      Container(
                        height:  MediaQuery.of(context).size.height * 0.04,
                      child: TextField(
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                         borderRadius: BorderRadius.circular(10),
                       ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
                       borderRadius: BorderRadius.circular(10),
                     ),
                      labelStyle: TextStyle(color: Colors.red)
                     ),
                   ),
                      ),
                      SizedBox(height: 10,),
                       Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Provinsi", 
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                      ),
                      Container(
                        height:  MediaQuery.of(context).size.height * 0.04,
                      child: TextField(
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Color.fromARGB(255, 234, 132, 0), width: 2.0),
                         borderRadius: BorderRadius.circular(10),
                       ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromARGB(255, 221, 221, 221), width: 2.0),
                       borderRadius: BorderRadius.circular(10),
                     ),
                      labelStyle: TextStyle(color: Colors.red)
                     ),
                   ),
                      ),
                      SizedBox(height: 10,),
                       Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Foto Seni", 
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                      ),
                      image != null? Container(
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.45,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,),
                        child: ClipRRect(
                          borderRadius: borderRadius,
                           child: Image.file(
                            image!, 
                            fit: BoxFit.cover,
                            ),
                        )) : 
                        Container(),
                      //     Container(
                      //   height:  MediaQuery.of(context).size.height * 0.18,
                      //   width: MediaQuery.of(context).size.height * 0.45,
                      //   child: Center(child: Text('Sampul Seni')),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     shape: BoxShape.rectangle,
                      //     border: Border.all(width: 4, color: Colors.grey),
                      //   ),
                      // ),
                      SizedBox(height: 5,),
                      GestureDetector(
            onTap: () async{
              await getImage();
            },
            child: new Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(5),
                  // margin: const EdgeInsets.only(left: 50.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Color.fromARGB(255, 221, 221, 221))),
                  child: Icon(
                    Icons.add_a_photo,
                    color: Color.fromARGB(255, 221, 221, 221), size: 15,
                  ),
                )),
          ),
          SizedBox(height: 10,),
                       Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Dokumentasi", 
                        textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,  color: Color.fromARGB(255, 234, 132, 0),),),
                      ),
          //MULTI IMAGE PICKER
          Container(
            // padding: EdgeInsets.all(10),
            child: Column(
              children: [

                // Divider(),
                // Text("dokumentasi terpilih: "),
                // Divider(),

                imagefiles != null?Wrap(
                     children: imagefiles!.map((imageone){
                        return Container(
                           child:Card( 
                              child: Container(
                                height:  MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.height * 0.138,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,),
                        child: ClipRRect(
                          borderRadius: borderRadius,
                            child: Image.file(File(imageone.path), 
                            fit: BoxFit.cover,),
                        ),
                              ),
                              
                           )
                        ); 
                     },).toList(), 
                  ):Container(), 
                  GestureDetector(
            onTap: () {
               openImages();
            },
            child: new Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Color.fromARGB(255, 221, 221, 221))),
                  child: Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 221, 221, 221), size: 15,
                  ),
                )),
          ),
                SizedBox(height: 20,),
                         Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Color.fromARGB(255, 234, 132, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                Icon(Icons.download_rounded, color: Colors.white,),
                                SizedBox(width: 5,),

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
          ),
                    ],
                  ),
                  )
                ],)
            ],
          ),
        )
        ),
    );
  }
}