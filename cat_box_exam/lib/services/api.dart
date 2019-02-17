import 'dart:convert';
import 'package:cat_box_exam/models/cat.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CallApi {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseUser firebase_user;

  CallApi(FirebaseUser user) {
    this.firebase_user = user;
  }

  static Future<CallApi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    return CallApi(user);
  }

  static List<Cat> catListFromJson(String jsonData) {
    List<Cat> catList = [];
    json.decode(jsonData)['cats'].forEach((cat) => catList.add(_catObj(cat)));
    return catList;
  }

  static Cat _catObj(Map<String, dynamic> map) {
    return Cat(
      externalId: map['id'],
      name: map['name'],
      description: map['description'],
      avatarUrl: map['image_url'],
      location: map['location'],
      likeCounter: map['like_counter'],
      isAdopted: map['adopted'],
      pictures: List<String>.from(map['pictures']),
      cattributes: List<String>.from(map['cattributes']),
    );
  }
}
