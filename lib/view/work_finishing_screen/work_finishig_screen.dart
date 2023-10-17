import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodusterworkerapp/common/const.dart';
import 'package:nodusterworkerapp/functions/image_fun.dart';

class WorkFinishScreen extends StatefulWidget {
  const WorkFinishScreen({super.key});

  @override
  State<WorkFinishScreen> createState() => _WorkFinishScreenState();
}

class _WorkFinishScreenState extends State<WorkFinishScreen> {
  String? imagurl;
  // = 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagurl == null
                ? SizedBox(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(imagurl.toString()),
                            fit: BoxFit.cover)),
                  ),
            k20height,
            ElevatedButton(
                onPressed: () {
                  setState(() async {
                    final imageurl = await Images.getimage(ImageSource.camera);
                    //image.add(imageurl.toString());
                    setState(() {});
                    imagurl = imageurl!;
                    log(imageurl.toString());
                  });
                },
                child: Text('Take image')),
            k20height,
            ElevatedButton(
                onPressed: () {
                  //  Get.to(page);
                },
                child: Text('Upload image and Finish work')),
          ],
        ),
      ),
    );
  }
}
