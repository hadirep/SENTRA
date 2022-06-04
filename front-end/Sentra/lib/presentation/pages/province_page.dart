import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/models/art_provience.dart';
import 'package:sentra/presentation/provider/province_provider.dart';
import 'package:sentra/presentation/widgets/province_card_grid.dart';

class ProvincePage extends StatefulWidget {
  static const routeName = '/province_page';
  final ArtProvince artProvince;
  const ProvincePage({Key? key, required this.artProvince}) : super(key: key);

  @override
  State<ProvincePage> createState() => _ProvincePageState();
}

class _ProvincePageState extends State<ProvincePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Filter By Provience',
            style: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        leading : IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ChangeNotifierProvider<ProvinceProvider>(
          create: (_) => ProvinceProvider(
              provinceApiService: ApiService(), query: widget.artProvince.province),
          child: Consumer<ProvinceProvider>(
            builder: (context, state, _) {
              if (state.provinceState == ResultState.loading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              } else if (state.provinceState == ResultState.hasData) {
                return ProvinceCardGrid(
                  artProvince: state.detail.data,
                );
              } else if (state.provinceState == ResultState.noData) {
                return Center(child: Text(state.message));
              } else if (state.provinceState == ResultState.error) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text(''));
              }
            },
          ),
        ),
      ),
    );
  }
}
