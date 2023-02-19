import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GoalsPageContent extends StatelessWidget {
  const GoalsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('goals')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Cos poszlo nie tak'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Ladowanie');
          }

          final documents = snapshot.data!.docs;
          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(document['title']),
                      Text(document['goal']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            document['rating'].toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        });
  }
}
