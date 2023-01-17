import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sports_x_admin/vars/controllers.dart';

class NowMatchScreen extends StatefulWidget {
  const NowMatchScreen({super.key});

  @override
  State<NowMatchScreen> createState() => _NowMatchScreenState();
}

class _NowMatchScreenState extends State<NowMatchScreen> {
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
                  controller: nowTeamOneName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Team One Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nowTeamTwoName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Team Two Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nowTeamOneLogo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Team One Logo'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nowTeamTwoLogo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Team Two Logo'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nowTeamOneScore,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Team One Score'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nowTeamTwoScore,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Team Two Score'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nowStatus,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Status'),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (nowTeamOneName == '' && nowTeamTwoName == '') {
                      await FirebaseFirestore.instance
                          .collection('NowPlaying')
                          .doc('csDzyNL8XkS9xbrUYJoK')
                          .update({});
                    } else {
                      await FirebaseFirestore.instance
                          .collection('NowPlaying')
                          .doc('csDzyNL8XkS9xbrUYJoK')
                          .update({
                        'Team one name': nowTeamOneName.text,
                        'Team two name': nowTeamTwoName.text,
                        'Team one logo': nowTeamOneLogo.text,
                        'Team two logo': nowTeamTwoLogo.text,
                        'Team one score': nowTeamOneScore.text,
                        'Team two score': nowTeamTwoScore.text,
                        'Time': nowStatus.text,
                      });
                      nowTeamOneName.clear();
                      nowTeamTwoName.clear();
                      nowTeamOneLogo.clear();
                      nowTeamTwoLogo.clear();
                      nowTeamOneScore.clear();
                      nowTeamTwoScore.clear();
                      nowStatus.clear();
                    }
                  },
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
