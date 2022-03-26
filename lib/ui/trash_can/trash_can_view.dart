import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plug_in/provider/trash_can_provider.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:plug_in/ui/component/plug_in_appbar.dart';
import 'package:plug_in/ui/component/plug_in_bottom_navigation_bar.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:provider/provider.dart';

import '../../provider/google_map_provider.dart';

class TrashCanView extends StatelessWidget {
  TrashCanView({Key? key}) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashCanProvider>(
      builder: (context, trashCanProvider, child) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          trashCanProvider.image == null ? _noImageView() : _imageView(),
        ],
      ),
    );
  }

  Widget _checkBtn() {
    return Consumer<TrashCanProvider>(
      builder: (context, trashCanProvider, child) => GestureDetector(
        onTap: () {
          trashCanProvider.toggleBtn();
          trashCanProvider.check();
        },
        child: const PlugInContainer(
            height: 50.0,
            child: Center(
              child: Text(
                "Check",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            color: Colors.blueGrey),
      ),
    );
  }

  Widget _applyBtn() {
    return Consumer<GoogleMapProvider>(
      builder: (context, googleMapProvider, child) =>
          Consumer<TrashCanProvider>(
        builder: (context, trashCanProvider, child) => GestureDetector(
          onTap: () {
            googleMapProvider.addMarker(35.13308851535174, 129.09695020869225,
                BitmapDescriptor.defaultMarker);
            Navigator.pop(context);
          },
          child: const PlugInContainer(
              height: 50.0,
              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              color: Colors.green),
        ),
      ),
    );
  }

  Widget _noImageView() {
    return Consumer<TrashCanProvider>(
      builder: (context, trashCanProvider, child) => PlugInContainer(
        color: Colors.grey.shade400,
        height: 400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: GestureDetector(
                  onTap: () {
                    getImage(ImageSource.gallery).then(
                      (path) => trashCanProvider.setImage(path),
                    );
                  },
                  child: PlugInContainer(
                    height: 60.0,
                    width: 60.0,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    color: Colors.black45,
                  ),
                ),
              ),
              const Text(
                "No image selected.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageView() {
    return Consumer<TrashCanProvider>(
      builder: (context, trashCanProvider, child) => Container(
        child: Column(
          children: [
            PlugInContainer(
              height: 400.0,
              color: Colors.black45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  "images/trash.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              trashCanProvider.checkComment,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trashCanProvider.btn ? _applyBtn() : _checkBtn(),
          ],
        ),
      ),
    );
  }

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    return image!.path;
  }
}
