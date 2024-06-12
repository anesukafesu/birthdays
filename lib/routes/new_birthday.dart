import 'package:datetime_tutorial/models/birthday_record.dart';
import 'package:datetime_tutorial/utils/format_date.dart';
import 'package:flutter/material.dart';

class NewBirthday extends StatefulWidget {
  const NewBirthday({super.key});

  @override
  State<NewBirthday> createState() => _NewBirthdayState();
}

class _NewBirthdayState extends State<NewBirthday> {
  String _name = '';
  DateTime _birthday = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'New Birthday',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDate(_birthday),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1800),
                      lastDate: DateTime(3000),
                      currentDate: _birthday,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _birthday = pickedDate;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.date_range,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  BirthdayRecord(name: _name, birthday: _birthday),
                );
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
