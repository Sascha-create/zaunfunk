import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zaunfunk/features/authentication/models/zf_club.dart';
import 'package:zaunfunk/features/authentication/screens/create_member_profile_screen.dart';
import '../../../shared/config/colors.dart';

class JoinClubScreen extends StatelessWidget {
  const JoinClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clubs = FirebaseFirestore.instance
        .collection('clubs')
        .orderBy('clubName')
        .snapshots();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                style: Theme.of(context).textTheme.headlineMedium,
                'Verein wählen'),
            StreamBuilder(
              stream: clubs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((document) {
                        Map<String, dynamic> doc = document.data();
                        ZfClub club = ZfClub(
                            clubId: doc['clubId'],
                            clubName: doc['clubName'],
                            location: doc['location'],
                            street: doc['street']);
                        return Card(
                          color: lightBeige,
                          child: ListTile(
                            leading: Image.asset(
                                'assets/images/splash_screen_logo.png'),
                            title: Text(club.clubName),
                            subtitle: Text(club.location),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateMemberProfileScreen(
                                              chosenClub: club)));
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: gardenGreen,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
