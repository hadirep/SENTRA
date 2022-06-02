import 'package:flutter/material.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/domain/entities/art.dart';

class UpdateListPage extends StatelessWidget {
  final List<Art> listUpdate;

  const UpdateListPage(this.listUpdate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
        ),
        itemCount: listUpdate.length,
        itemBuilder: (context, index) {
          var newUpdate = listUpdate[index];
          return InkWell(
            onTap: () {
              // Menuju detail page new update
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Card(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        '$BASE_IMAGE_KESENIAN_URL${newUpdate.image}', height: 200, fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        newUpdate.name, textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}