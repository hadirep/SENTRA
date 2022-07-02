import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/result_state.dart';
import 'package:sentra/presentation/provider/update_list_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/widget_art_update_page.dart';

class UpdateMorePage extends StatefulWidget {
  static const routeName = '/update-more-page';
  const UpdateMorePage({Key? key}) : super(key: key);
  @override
  State<UpdateMorePage> createState() => _UpdateMorePageState();
}
class _UpdateMorePageState extends State<UpdateMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.artRecommendation,
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
      body: Consumer<UpdateListProvider>(
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
                return WidgetUpdateMore(
                  updateList: listData,
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