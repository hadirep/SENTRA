import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/presentation/bloc/arts/arts_bloc.dart';
import 'package:sentra/presentation/bloc/arts/arts_state.dart';
import 'package:sentra/presentation/bloc/arts/arts_event.dart';
import 'package:sentra/presentation/widgets/all_arts_card.dart';

class AllArtsList extends StatefulWidget{
  static const routeName = '/all_arts_list';

  const AllArtsList({Key? key}) : super(key: key);

  @override
  _AllArtsListState createState() => _AllArtsListState();
}

class _AllArtsListState extends State {
  @override
  void initState(){
    super.initState();
    context.read<ArtsBloc>().add(OnArtsChanged());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Arts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<ArtsBloc, ArtsState>(
          builder: (context, state) {
            if (state is ArtsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ArtsHasData) {
              final result = state.result;
              return ListView.builder(itemBuilder: (context, index){
                final ArtsList =  result[index];
                return AllArtsCard(ArtsList);
              },
                itemCount: result.length,
              );
            } else if (state is ArtsError){
              return Text(state.message);
            } else if (state is ArtsEmpty){
              return const Text('No Art is Not Found');
            } else {
              return const Text('Failed');
            }
          },
        ),
      ),
    );
  }
}



