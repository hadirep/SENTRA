import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/data/models/province_query_model.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/presentation/provider/detail_provider.dart';
import 'package:sentra/presentation/widgets/widget_province_detail.dart';

class ProvinceDetailPage extends StatefulWidget {
  static const routeName = '/province-detail-page';
  final ProvinceQuery provinceQuery;
  const ProvinceDetailPage({Key? key, required this.provinceQuery}) : super(key: key);

  @override
  State<ProvinceDetailPage> createState() => _ProvinceDetailPageState();
}

class _ProvinceDetailPageState extends State<ProvinceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Filter By Provience',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        leading : IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ChangeNotifierProvider<DetailProvider>(
          create: (_) => DetailProvider(
              detailApiService: ApiService(), id: widget.provinceQuery.id),
          child: Consumer<DetailProvider>(
            builder: (context, state, _) {
              if (state.detailState == ResultState.loading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              } else if (state.detailState == ResultState.hasData) {
                return WidgetProvinceDetail(
                  provinceDetail: state.detail.data,
                );
              } else if (state.detailState == ResultState.noData) {
                return Center(child: Text(state.message));
              } else if (state.detailState == ResultState.error) {
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
