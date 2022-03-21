import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plug_in/provider/trash_can_provider.dart';
import 'package:plug_in/provider/util_provider.dart';
import 'package:plug_in/ui/component/plug_in_appbar.dart';
import 'package:plug_in/ui/component/plug_in_bottom_navigation_bar.dart';
import 'package:plug_in/ui/component/plug_in_container.dart';
import 'package:provider/provider.dart';

class TrashCanView extends StatelessWidget {
  TrashCanView({Key? key}) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashCanProvider>(
      builder: (context, trashCanProvider, child) => Scaffold(
        bottomNavigationBar: PlugInBottomNavigationBar(),
        appBar: PlugInAppBar(
          title: "TrashCan",
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              print("hihi");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                trashCanProvider.image == null ? _noImageView() : _imageView(),
              ],
            ),
          ),
        ),
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
              child: Text("Check"),
            ),
            color: Colors.blueGrey),
      ),
    );
  }

  Widget _applyBtn() {
    return Consumer<TrashCanProvider>(
      builder: (context, trashCanProvider, child) => GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const PlugInContainer(
            height: 50.0,
            child: Center(
              child: Text("Apply"),
            ),
            color: Colors.green),
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
                child: FloatingActionButton(
                  heroTag: 'gallery',
                  child: Icon(Icons.add_a_photo),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.gallery).then(
                      (path) => trashCanProvider.setImage(path),
                    );
                  },
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
                child: Image.file(
                  trashCanProvider.image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              trashCanProvider.checkComment,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
