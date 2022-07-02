import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/presentation/provider/search_art_provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String queries = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchArtProvider>(
      builder: (context, state, _) {
        return SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    onChanged: (String query) {
                      debugPrint('data: $query');
                      if (query.isNotEmpty) {
                        _controller.clear();
                        setState(() {
                          queries = query;
                        });
                        state.fetchSearchArt(query);
                      } else {
                        _controller.clear();
                      }
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(
                        Icons.search, color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.orange),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                      hintText: AppLocalizations.of(context)?.searchHere,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
