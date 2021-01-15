import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keekz_app/constants/Constantcolors.dart';
import 'package:keekz_app/services/authentication.dart';
import 'package:provider/provider.dart';

class LandingService with ChangeNotifier {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  ConstantColors constantColors = ConstantColors();
  Widget passwordLessSignIn(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("allUsers").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return new ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                  return ListTile(
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: constantColors.whiteColor,
                        ),
                        onPressed: () {}),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(documentSnapshot.data()["userimage"]),
                    ),
                    subtitle: Text(
                      documentSnapshot.data()["useremail"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: constantColors.stateGrey),
                    ),
                    title: Text(
                      documentSnapshot.data()["username"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: constantColors.stateGrey),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ));
  }

  logInSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantColors.blueGreyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: constantColors.whiteColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: "Enter Name...",
                        hintStyle: TextStyle(
                            color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        hintText: "Enter eMail...",
                        hintStyle: TextStyle(
                            color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userPasswordController,
                    decoration: InputDecoration(
                        hintText: "Enter password...",
                        hintStyle: TextStyle(
                            color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: constantColors.stateBlue,
                  child: Icon(
                    Icons.check,
                    color: constantColors.whiteColor,
                  ),
                  onPressed: () {
                    if (userEmailController.text.isNotEmpty) {
                      Provider.of<Authentication>(context, listen: false)
                          .logIntoAccount(userEmailController.text,
                              userPasswordController.text);
                    } else {
                      warningText(context, "Fill all the data");
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  signInSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: constantColors.whiteColor,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: constantColors.transperant,
                  radius: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: "Enter Name...",
                        hintStyle: TextStyle(
                            color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userEmailController,
                    decoration: InputDecoration(
                        hintText: "Enter eMail...",
                        hintStyle: TextStyle(
                            color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userPasswordController,
                    decoration: InputDecoration(
                        hintText: "Enter password...",
                        hintStyle: TextStyle(
                            color: constantColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    style: TextStyle(
                        color: constantColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: constantColors.stateBlue,
                  child: Icon(
                    Icons.check,
                    color: constantColors.whiteColor,
                  ),
                  onPressed: () {
                    if (userEmailController.text.isNotEmpty) {
                      Provider.of<Authentication>(context, listen: false)
                          .createAccount(userEmailController.text,
                              userPasswordController.text);
                    } else {
                      warningText(context, "Fill all the data");
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  warningText(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: BorderRadius.circular(15)),
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  warning,
                  style: TextStyle(
                      color: constantColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ));
        });
  }
}
