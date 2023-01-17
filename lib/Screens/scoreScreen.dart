import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sports_x_admin/vars/controllers.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
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
                controller: teamOneNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Team one name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: teamTwoNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Team two name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: teamOneLogoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Team one logo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: teamTwoLogoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Team two logo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: timeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Time'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nextMatchAmORPm,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'am OR pm'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('Score')
                      .doc('YmtxF4hBrAOuZRchfP7n')
                      .update({
                    'Team One Name': teamOneNameController.text,
                    'Team Two Name': teamTwoNameController.text,
                    'Team One Logo': teamOneLogoController.text,
                    'Team Two Logo': teamTwoLogoController.text,
                    'Time': timeController.text,
                    'am Or Pm': nextMatchAmORPm.text
                  });
                  teamOneNameController.clear();
                  teamTwoNameController.clear();
                  teamOneLogoController.clear();
                  teamTwoLogoController.clear();
                  timeController.clear();
                },
                child: Text("Save"))
          ],
        ),
      ),
    ));
  }
}
