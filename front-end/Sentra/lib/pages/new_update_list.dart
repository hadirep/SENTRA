import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/presentation/bloc/update/update_state.dart';
import 'package:sentra/presentation/bloc/update/update_event.dart';
import 'package:sentra/presentation/bloc/update/update_bloc.dart';
import 'package:sentra/presentation/widgets/new_update_card_list.dart';

class NewUpdateList extends StatefulWidget{
  static const routeName = '/new_update_list';

  const NewUpdateList({Key? key}) : super(key: key);

  @override
  _NewUpdateListState createState() => _NewUpdateListState();
}

class _NewUpdateListState extends State {
  @override
  void initState(){
    super.initState();
    context.read<UpdateBloc>().add(OnUpdateChanged());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<UpdateBloc, UpdateState>(
          builder: (context, state) {
            if (state is UpdateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UpdateHasData) {
              final result = state.result;
              return ListView.builder(itemBuilder: (context, index){
                final UpdateList =  result[index];
                return NewUpdateCard(UpdateList);
              },
                itemCount: result.length,
              );
            } else if (state is UpdateError){
              return Text(state.message);
            } else if (state is UpdateEmpty){
              return const Text('New Update is Not Found');
            } else {
              return const Text('Failed');
            }
          },
        ),
      ),
    );
  }
}



