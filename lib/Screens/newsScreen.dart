import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sports_x_admin/vars/controllers.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: newsImageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'News image'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: newsTextController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'News Text'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: imageSliderController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Slider Image'),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                     await FirebaseFirestore.instance.collection('News').add({
                        'News Image': newsImageController.text,
                        'News Text': newsTextController.text,
                      });
                    newsImageController.clear();
                    newsTextController.clear();
                    imageSliderController.clear();
                  },
                  child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
