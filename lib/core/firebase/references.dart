import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fi = FirebaseFirestore.instance;

//FR - firestore reference

final quizePaperFR = fi.collection('kuis-ku');
final leaderBoardFR = fi.collection('leaderboard');

CollectionReference<Map<String, dynamic>> getleaderBoard(
        {required String paperId}) =>
    leaderBoardFR.doc(paperId).collection('scores');

DocumentReference questionsFR(
        {required String paperId, required String questionsId}) =>
    quizePaperFR.doc(paperId).collection('questions').doc(questionsId);

//Reference get firebaseStorage => FirebaseStorage.instanceFor(bucket: 'gs://fire-base-chat-cc3e9.appspot.com').ref();
Reference get firebaseStorage => FirebaseStorage.instance.ref();
