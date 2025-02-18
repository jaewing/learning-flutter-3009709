import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

class NetworkImagePickerBody extends StatelessWidget {
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

                return GestureDetector(
                    onTap: () {
                      onImageSelected(snapshot.data![index].imageUrl);
                    },
                    child: Image.network(snapshot.data![index].imageUrl));
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
            );
          }

          /// Here we handle exceptions we might encounter
          /// while trying to choose an image to add to
          /// our text messages.
          else if(snapshot.hasError){
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('This is the error: ${snapshot.error}'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
