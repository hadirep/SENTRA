import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/detail_docummentation_model.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/provider/detail_provider.dart';
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

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final communityController = TextEditingController();
  final categoryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final provinceController = TextEditingController();
  final descriptionController = TextEditingController();
  final isFacebookController = TextEditingController();
  final isInstagramController = TextEditingController();

  late String? imageUri ;
  late String idArt;

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    communityController.dispose();
    categoryController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    provinceController.dispose();
    descriptionController.dispose();
    isFacebookController.dispose();
    isInstagramController.dispose();
    super.dispose();
  }

  File? _oneImage;
  final ImagePicker _picker = ImagePicker();
  File? multiImage;


  Future getImage() async{
    var image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _oneImage = image as File?;
    });
  }

  Future getImageDocumentation() async{
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    multiImage = File(imagePicked!.path);
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
    if (args[0]!.isNotEmpty) {
      idArt = args[0]!;
    }
    if (args[1]!.isNotEmpty) {
      nameController.text = args[1]!;
    }
    if (args[2]!.isNotEmpty) {
      priceController.text = args[2]!;
    }
    if (args[3]!.isNotEmpty) {
      communityController.text = args[3]!;
    }
    if (args[4]!.isNotEmpty) {
      categoryController.text = args[4]!;
    }
    if (args[5]!.isNotEmpty) {
      phoneNumberController.text = args[5]!;
    }
    if (args[6]!.isNotEmpty) {
      emailController.text = args[6]!;
    }
    if (args[7]!.isNotEmpty) {
      provinceController.text = args[7]!;
    }
    if (args[8]!.isNotEmpty) {
      descriptionController.text = args[8]!;
    }
    if (args[9]!.isNotEmpty) {
      isFacebookController.text = args[9]!;
    }
    if (args[10]!.isNotEmpty) {
      isInstagramController.text = args[10]!;
    }
    if (args[11]!.isNotEmpty) {
      imageUri = args[11]!;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.editData,
          style: const TextStyle(
            color: Color.fromARGB(255, 45, 74, 148),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
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
                        child: Text(
                          AppLocalizations.of(context)!.artName,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          cursorColor: Colors.blue,
                          controller: nameController,
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

                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artPrice,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: priceController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artOrganization,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: communityController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artCategory,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: categoryController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artPhone,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneNumberController,
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
                        child: Text(
                          AppLocalizations.of(context)!.artEmail,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artProvince,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: provinceController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artDescription,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      TextFormField(
                        minLines: 1,
                        maxLines: 5,
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artFacebook,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: isFacebookController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Username Instagram",
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          controller: isInstagramController,
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context)!.artImage,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      Container(
                       height:  MediaQuery.of(context).size.height * 0.18,
                       width: MediaQuery.of(context).size.height * 0.45,
                       padding: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,
                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(12),
                         child: CachedNetworkImage(
                           imageUrl: '$baseImageArt${imageUri}',
                           width: 80,
                           placeholder: (context, url) => const Center(
                             child: CircularProgressIndicator(),
                           ),
                           errorWidget: (context, url, error) => const Icon(Icons.error),
                         ),
                       ),
                     ),
                     // imageUri != null? Container(
                     //    height:  MediaQuery.of(context).size.height * 0.18,
                     //    width: MediaQuery.of(context).size.height * 0.45,
                     //    padding: const EdgeInsets.all(5),
                     //    decoration: BoxDecoration(
                     //      color: const Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,
                     //    ),
                     //    child: ClipRRect(
                     //      borderRadius: BorderRadius.circular(12),
                     //      child: CachedNetworkImage(
                     //        imageUrl: '$baseImageArt${imageUri}',
                     //        width: 80,
                     //        placeholder: (context, url) => const Center(
                     //          child: CircularProgressIndicator(),
                     //        ),
                     //        errorWidget: (context, url, error) => const Icon(Icons.error),
                     //      ),
                     //    ),
                     //  ) : Container(),
                      _oneImage != null? Container(
                        height:  MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.45,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 221, 221), borderRadius: borderRadius,
                        ),
                        child: ClipRRect(
                          borderRadius: borderRadius,
                          child: Image.file(
                            _oneImage!,
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
                        child: Text(
                          AppLocalizations.of(context)!.artDocumentation,
                          style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 234, 132, 0),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(padding: const EdgeInsets.only(left: 3)),
                          MultiProvider(
                            providers: [
                              ChangeNotifierProvider<DetailProvider>(
                                create: (_) => DetailProvider(detailApiService: ApiService(), id: idArt),
                              ),
                            ],
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width,
                              child: Consumer<DetailProvider>(
                                builder: (context, state, _) {
                                  if (state.detailState == ResultState.loading) {
                                    return const Center(child: CircularProgressIndicator());
                                  } else if (state.detailState == ResultState.hasData) {
                                    return Center(
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Container(padding: const EdgeInsets.only(left: 3)),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.12,
                                                width: MediaQuery.of(context).size.width,
                                                child:
                                                SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    children: state.detail.data.documKesenians
                                                        .map((category) => Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                              builder: (BuildContext context) => AlertDialog(
                                                                  backgroundColor: const Color.fromARGB(0, 93, 93, 93),
                                                                  insetPadding: const EdgeInsets.all(2),
                                                                  title: SizedBox(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: Hero(tag: state.detail.data.documKesenians, child: CachedNetworkImage(imageUrl: '$baseImageDocArt${category.documentation}',)),
                                                                  )), context: context);
                                                        },
                                                        child: Container(
                                                          width: 140,
                                                          decoration: BoxDecoration( boxShadow: const [
                                                            BoxShadow(
                                                                color: Color.fromARGB(185, 158, 158, 158),
                                                                offset: Offset(2.0, 2.0),
                                                                blurRadius: 2.0
                                                            )
                                                          ],
                                                              border: Border.all(width: 3, color: Colors.white), borderRadius: BorderRadius.circular(12) ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10),
                                                            child:
                                                            FittedBox(
                                                              fit:
                                                              BoxFit.fill,
                                                              child: CachedNetworkImage(
                                                                imageUrl: '$baseImageDocArt${category.documentation}',
                                                                width: 140,
                                                                placeholder: (context, url) => const Center(
                                                                  child: CircularProgressIndicator(),
                                                                ),
                                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )).toList(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  } else if (state.detailState == ResultState.error) {
                                    return Center(child: Text(state.message));
                                  } else if (state.detailState == ResultState.noData){
                                    return Center(child: Text(state.message));
                                  } else if (state.detailState == ResultState.error) {
                                    return const Center(child: Text('error'));
                                  } else {
                                    return const Center(child:  Text(''));
                                  }
                                },
                              )
                            ),
                          ),
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
                                  nameController.text, priceController.text, communityController.text,
                                  categoryController.text, phoneNumberController.text, emailController.text,
                                  provinceController.text, descriptionController.text,
                                  isFacebookController.text.toString(), isInstagramController.text.toString(),
                                );

                                if (response){
                                  const snackbar = SnackBar(content: Text('Edit Data Berhasil'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
                                children: [
                                  const Icon(Icons.download_rounded, color: Colors.white),
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
    );
  }
}