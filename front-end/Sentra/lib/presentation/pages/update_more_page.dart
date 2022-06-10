import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/common/style.dart';
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
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Rekomendasi',
            style: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading : const ButtonBack(),
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