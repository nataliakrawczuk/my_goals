import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonePageContent extends StatelessWidget {
  const DonePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('goals').snapshots(),
        builder: (context, snapshot) {
          return const Center(child: Text('trzy'));
        });
  }
}