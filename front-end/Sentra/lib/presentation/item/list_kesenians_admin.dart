import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/presentation/provider/art_list_provider.dart';
import 'package:sentra/presentation/widgets/widget_card_bussiness_management.dart';


class ItemKeseniansAdmin extends StatelessWidget{
  const ItemKeseniansAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<ArtListProvider>(
      builder: (context, state, _) {
        if (state.listState == ResultState.loading) {
          return const Center(child: CircularProgressIndicator(color: Colors.red));
        } else if (state.listState == ResultState.hasData) {
          return SizedBox(
            height: 190,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.list.data.length,
              itemBuilder: (context, index) {
                var listData = state.list.data[index];
                return ArtCardBusiness(
                  artList: listData,
                );
              },
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
    );    //
  }
}