import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';


class NetworkImagePickerBody extends StatelessWidget {
  /// Here we define a property to
  /// require that we pass an ImageRepository
  /// object from our parent "chat_input" and
  /// grandparent "chat_page".

  NetworkImagePickerBody({Key? key}) : super(key: key);

  final ImageRepository _imageRepo = ImageRepository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GirlImage>>(
        future: _imageRepo.getNetworkImages(),
        builder: (BuildContext context, AsyncSnapshot<List<GirlImage>> snapshot) {
          if (snapshot.hasData) {
            /// Allows you to create a grid of
            /// widgets.
            return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: 150,
                      height: 150,
                      child: Image.network(snapshot.data![index].imageUrl));
                },
              /// Dictates space vertically and horizontally
              /// between each grid item.
              ///
              /// Takes an object of SliverGridDelegate
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
            );
          }

          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
