import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/presentation/provider/province_list_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/widget_province_more.dart';

class ProvinceMorePage extends StatefulWidget {
  static const routeName = '/province_more_page';
  const ProvinceMorePage({Key? key}) : super(key: key);
  @override
  State<ProvinceMorePage> createState() => _ProvinceMorePageState();
}
class _ProvinceMorePageState extends State<ProvinceMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.artProvince,
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
      body: Consumer<ProvinceListProvider>(
        builder: (context, state, _) {
          if (state.listState == ResultState.loading) {
            return const Center(child: CircularProgressIndicator(color: Colors.red));
          } else if (state.listState == ResultState.hasData) {
            return GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.list.data.length,
              itemBuilder: (context, index) {
                var listData = state.list.data[index];
                return WidgetProvinceMore(
                  provinceList: listData,
                );
              },
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.9),
              ),
            );
          } else if (state.listState == ResultState.noData) {
            return Center(child: Text(state.message));
          } else if (state.listState == ResultState.error) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}