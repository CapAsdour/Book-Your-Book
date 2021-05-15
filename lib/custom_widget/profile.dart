import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _dpFile = null;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: _dpFile == null
                ? NetworkImage(
                'https://k2partnering.com/wp-content/uploads/2016/05/Person.jpg')
                : FileImage(_dpFile),
            radius: 100,
          ),
          FloatingActionButton(
            onPressed: showModal,
            child: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      
    );
  }

  void changeDP(ImageSource imgSrc) async {
    final pickedFile = await ImagePicker().getImage(source: imgSrc);

    setState(() {
      if (pickedFile != null) {
        _dpFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void showModal() {
    showModalBottomSheet(
        context: context,
        builder: (build) {
          return Container(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber[900],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(2, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.amber[900],
                                size: 50,
                              ),
                              Text(
                                'Camera',
                                style: TextStyle(
                                  color: Colors.amber[900],
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            changeDP(ImageSource.camera);
                            Navigator.pop(build);
                          }),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.amber[900],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(2, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.amber[900],
                                size: 50,
                              ),
                              Text(
                                'Gallery',
                                style: TextStyle(
                                  color: Colors.amber[900],
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            changeDP(ImageSource.gallery);
                            Navigator.pop(build);
                          }),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}