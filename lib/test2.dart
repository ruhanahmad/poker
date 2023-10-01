// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firestore Array Deletion',
//       home: FirestoreArrayDeletion(),
//     );
//   }
// }

// class FirestoreArrayDeletion extends StatefulWidget {
//   @override
//   _FirestoreArrayDeletionState createState() => _FirestoreArrayDeletionState();
// }

// class _FirestoreArrayDeletionState extends State<FirestoreArrayDeletion> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController _indexController = TextEditingController();
//   List<dynamic> dataArray = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromFirestore();
//   }

//   Future<void> fetchDataFromFirestore() async {
//     try {
//       DocumentSnapshot documentSnapshot =
//           await _firestore.collection('your_collection_name').doc('your_document_id').get();

//       if (documentSnapshot.exists) {
//         setState(() {
//           dataArray = List.from(documentSnapshot.get('your_array_field_name'));
//         });
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }

//   Future<void> deleteElementAtFirestore(int index) async {
//     if (index >= 0 && index < dataArray.length) {
//       dataArray.removeAt(index);

//       try {
//         await _firestore.collection('your_collection_name').doc('your_document_id').update({
//           'your_array_field_name': dataArray,
//         });
//         print('Element at index $index deleted successfully.');
//       } catch (e) {
//         print('Error deleting element: $e');
//       }
//     } else {
//       print('Invalid index');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firestore Array Deletion'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Data Array: $dataArray'),
//             TextFormField(
//               controller: _indexController,
//               decoration: InputDecoration(labelText: 'Index to Delete'),
//             ),
//             SizedBox(height: 20),
//             RaisedButton(
//               onPressed: () {
//                 int index = int.tryParse(_indexController.text);
//                 if (index != null) {
//                   deleteElementAtFirestore(index);
//                 } else {
//                   print('Invalid index format');
//                 }
//               },
//               child: Text('Delete Element at Index'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
