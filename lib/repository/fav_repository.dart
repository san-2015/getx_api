import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FavRepository {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> getDeviceToken() async{
    return await _messaging.getToken();
  }

  Future<void> saveFav(bool val, String project_id) async{
    try{
      String? token= await getDeviceToken();
      if(token!=null){
        await _firestore.collection("favourites").doc(token).set({
          'fav': val,
          'updateAt': FieldValue.serverTimestamp(),
          'token':token,
          'project_id':project_id
        });
      }
    }
      catch(e){
      print('Error saving fav:$e');
      throw Exception("Error saving fav");

        }
  }
}
