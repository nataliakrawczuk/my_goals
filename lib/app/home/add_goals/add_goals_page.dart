import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPageContent extends StatefulWidget {
  const AddPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  final Function onSave;

  @override
  State<AddPageContent> createState() => _AddPageContentState();
}

class _AddPageContentState extends State<AddPageContent> {
  var goalTitle = '';
  var goalContent = '';
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwe Twojego zadania',
            ),
            onChanged: (newValue) {
              setState(() {
                goalTitle = newValue;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj tresc Twojego zadania',
            ),
            onChanged: (newValue) {
              setState(() {
                goalContent = newValue;
              });
            },
          ),
        ),
        Slider(
          onChanged: (newValue) {
            setState(() {
              rating = newValue;
            });
          },
          value: rating,
          min: 1,
          max: 5,
          divisions: 4,
          label: rating.toString(),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: ElevatedButton(
            onPressed: goalTitle.isEmpty || goalContent.isEmpty
                ? null
                : () {
                    FirebaseFirestore.instance.collection('goals').add({
                      'title': goalTitle,
                      'goal': goalContent,
                      'rating': rating,
                    });
                    widget.onSave();
                  },
            child: const Text('Dodaj'),
          ),
        ),
      ],
    ));
  }
}
