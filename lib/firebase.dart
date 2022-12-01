import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/module/transaction.dart';

import 'module/moma_user.dart';

class DatabaseManager {
  static CollectionReference usersList = FirebaseFirestore.instance.collection("Users");
  static CollectionReference transactionsListFirestore;

  static Future<void> userSetup(String email) async {
    MomaUser appUser = MomaUser(email);
    FirebaseAuth auth = FirebaseAuth.instance;
    appUser.uid = auth.currentUser.uid.toString();

    final docUser = usersList.doc(appUser.uid);

    docUser.set(appUser.toJson());

    return;
  }

  static Future<MomaUser> readUserInfo(String email) async {
    MomaUser appUser = MomaUser(email);
    FirebaseAuth auth = FirebaseAuth.instance;
    appUser.uid = auth.currentUser.uid.toString();

    appUser = await DatabaseManager.readUserFromFirestore(appUser.uid);

    transactionsListFirestore = usersList.doc(appUser.uid).collection('transactions');
    //appUser.transactions = (await readTransactions()).cast<MomaTransaction>();
    appUser.transactions = await readTransactionsFromFirestore(appUser);

    return appUser;
  }

  static Future<void> updateProperty (MomaUser appUser) async {
    final docUser = usersList.doc(appUser.uid);
    docUser.update({
      'max transaction id': appUser.MAX_ID,
      'current money': appUser.currentMoney,
      'total income': appUser.totalIncome,
      'total outcome': appUser.totalOutcome,
    });
  }

  static Future<void> addTransaction (MomaTransaction momaTransaction) async {
    transactionsListFirestore.doc('${momaTransaction.index}').set(momaTransaction.toJson());
  }

  static Future<void> removeTransaction (index) async {
    transactionsListFirestore.doc('$index').delete();
  }

  static Future<List<MomaTransaction>> readTransactionsFromFirestore(MomaUser appUser) async {
    List<MomaTransaction> newList = [];

    for (int i= 0 ; i< appUser.MAX_ID;i++){
      final docTransaction = transactionsListFirestore.doc('$i');
      final snapshot = await docTransaction.get();

      if (snapshot.exists) {
        newList.add(MomaTransaction.fromJson(snapshot.data()));
      }
    }

    return newList;
  }

  static Future<List<Iterable<MomaTransaction>>> readTransactions() {
    return transactionsListFirestore
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => MomaTransaction.fromJson(doc.data()))).toList();

  }

  static Future<MomaUser> readUserFromFirestore(String uid) async {
    final docUser = usersList.doc(uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return MomaUser.fromJson(snapshot.data());
    } else {
      return null;
    }
  }
}
