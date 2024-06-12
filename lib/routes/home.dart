import 'package:datetime_tutorial/routes/new_birthday.dart';
import 'package:datetime_tutorial/models/birthday_record.dart';
import 'package:datetime_tutorial/utils/format_date.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BirthdayRecord> birthdays = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Birthdays',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: birthdays.length,
          itemBuilder: (BuildContext context, int index) {
            BirthdayRecord birthdayRecord = birthdays[index];
            return ListTile(
              title: Text(birthdayRecord.name),
              subtitle: Text(formatDate(birthdayRecord.birthday)),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          BirthdayRecord? birthdayRecord = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewBirthday(),
            ),
          );

          if (birthdayRecord != null) {
            setState(() {
              birthdays.add(birthdayRecord);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
