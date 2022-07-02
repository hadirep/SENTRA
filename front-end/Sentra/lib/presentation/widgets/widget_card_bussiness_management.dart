// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/constants.dart';
import 'package:common/style.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/pages/admin/edit_art.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';

class ArtCardBusiness extends StatefulWidget {
  final ArtList artList;

  const ArtCardBusiness({Key? key, required this.artList}) : super(key: key);

  @override
  State<ArtCardBusiness> createState() => _ArtCardBusinessState();
}

class _ArtCardBusinessState extends State<ArtCardBusiness> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context, DetailSellerProduct.routeName, arguments: widget.artList,
            );
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all( width: 2, color: secondaryColor),
                borderRadius: BorderRadius.circular(8),
                color: bgSecondColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 20,
                        child: VerticalDivider(
                          color: secondaryColor,
                          thickness: 3,
                          width: 10,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 80,
                        margin: const EdgeInsets.only(right: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: '$baseImageArt${widget.artList.image}',
                            width: 80,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.artList.name!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[800],
                              ),
                            ),
                            Padding(padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                widget.artList.province!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(right: 4.0),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: buttonPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(8),
                  ),
                ),
                child: IconButton(
                  iconSize: 16,
                  icon: const Icon(Icons.edit, color: Colors.white),
                  tooltip: AppLocalizations.of(context)!.editData,
                  onPressed: () {
                    Navigator.of(context).pushNamed
                      (EditArt.routeName,
                      arguments: [
                        widget.artList.id,
                        widget.artList.name,
                        widget.artList.price,
                        widget.artList.community,
                        widget.artList.category,
                        widget.artList.phoneNumber,
                        widget.artList.email,
                        widget.artList.province,
                        widget.artList.description,
                        widget.artList.isFacebook.toString(),
                        widget.artList.isInstagram.toString(),
                        widget.artList.image,
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: buttonPrimaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(8),
                  ),
                ),
                child: IconButton(
                  iconSize: 16,
                  icon: const Icon(Icons.delete, color: Colors.white),
                  tooltip: AppLocalizations.of(context)!.deleteData,
                  onPressed: () async {
                    final dialog = AlertDialog(
                      title: Text(AppLocalizations.of(context)!.warning),
                      content: Text(AppLocalizations.of(context)!.confirmDelete),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(AppLocalizations.of(context)!.no),
                        ),
                        TextButton(
                          onPressed: () async {
                            bool response = await apiService.deleteArtList(widget.artList.id);
                            if(response){
                              if (response) {
                                const snackbar = SnackBar(content: Text('Hapus Data Berhasil'));
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                Navigator.pop(context);
                                if (kDebugMode) {
                                  print("Seni berhasil dihapus");
                                }
                              }
                            } else{
                              if (response) {
                                if (kDebugMode) {
                                  const snackbar = SnackBar(content: Text('Hapus Data Gagal'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                  print("Seni gagal dihapus");
                                }
                              }
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.deleteData),
                        ),
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (context) => dialog,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}