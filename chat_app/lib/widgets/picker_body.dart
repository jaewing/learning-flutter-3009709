import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

class NetworkImagePickerBody extends StatelessWidget {

  /// Property in which we will pass the image returned
  /// by our onTap callback to our parent widget (chat_input).
  final Function(String) onImageSelected;
  NetworkImagePickerBody({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GirlImage>>(
        future: _imageRepo.getNetworkImages(),
        builder: (BuildContext context,
            AsyncSnapshot<List<GirlImage>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //TODO: Add a Gesture Detector to register clicks on each image
                /// We are going to add the ability to add the Image to chat
                /// message we want to send.
                /// We do this via wrapping our image with a GestureDetector widget.
                return GestureDetector(
                  /// Listens to any tap events and returns
                  /// a callback.
                  /// We provide a callback that will fetch the image
                  /// and send it back to our parent widget (chat_input)
                  /// so we can display it in the chat message widget.
                  ///
                  /// Important: passing image from child to parent widget
                  onTap: (){
                    onImageSelected(snapshot.data![index].imageUrl);

                  },
                    child: Image.network(snapshot.data![index].imageUrl)
                );
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
