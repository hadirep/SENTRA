import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/result_state.dart';
import 'package:common/style.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/provider/province_query_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/widget_province_query.dart';

class ProvinceQueryPage extends StatefulWidget {
  static const routeName = '/province-query-page';
  final ArtList queryList;
  const ProvinceQueryPage({Key? key, required this.queryList})
      : super(key: key);

  @override
  State<ProvinceQueryPage> createState() => _ProvinceQueryPageState();
}

class _ProvinceQueryPageState extends State<ProvinceQueryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.artProvince,
            style: const TextStyle(
              color: textPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const ButtonBack(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ChangeNotifierProvider<ProvinceQueryProvider>(
          create: (_) => ProvinceQueryProvider(
              queryApiService: ApiService(), query: widget.queryList.province!),
          child: Consumer<ProvinceQueryProvider>(
            builder: (context, state, _) {
              if (state.queryState == ResultState.loading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              } else if (state.queryState == ResultState.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.queryDetail.data.length,
                  itemBuilder: (context, index) {
                    var queryData = state.queryDetail.data[index];
                    return WidgetProvinceQuery(
                      provinceQuery: queryData,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.9),
                  ),
                );
              } else if (state.queryState == ResultState.noData) {
                return Center(child: Text(state.message));
              } else if (state.queryState == ResultState.error) {
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
