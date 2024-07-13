import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import '../constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

const double _kItemExtent = 32.0;

const List<String> _taskList = <String>[
  'Business',
  'Home',
  'School',
  'Sports',
  'Friends',
  'Project',
];

class TaskAdd extends StatefulWidget {
  static const String id = 'Apple';
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  String category = "Business";
  int _selectedFruit = 0;
  DateTime date = DateTime.now();
  String formattedDate = '';
  DateTime? _chosenDateTime;
  String time = '';

  late TextEditingController _TEC;
  @override
  void initState() {
    _TEC = TextEditingController();
    formattedDate = DateFormat.E().format(date) +
        ' ' +
        DateFormat.d().format(date) +
        ' ' +
        DateFormat.MMM().format(date);
    time = DateFormat.jm().format(date);
    super.initState();
  }

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                            formattedDate =
                                DateFormat.E().format(_chosenDateTime!) +
                                    ' ' +
                                    DateFormat.d().format(_chosenDateTime!) +
                                    ' ' +
                                    DateFormat.MMM().format(_chosenDateTime!);
                            time = DateFormat.jm().format(_chosenDateTime!);
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

// This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 250,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF7D80AA), width: 1),
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(10.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  size: 32.0,
                  color: Color(0xFF7D80AA),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: AutoSizeTextField(
              cursorWidth: 1.5,
              showCursor: true,
              cursorColor: Color(0xFF7D80AA),
              maxLines: null,
              controller: _TEC,
              minWidth: 150,
              decoration: InputDecoration(
                hintText: 'New Task',
                hintStyle: kHeadingStyle2.copyWith(
                  color: Color(0xFF7D80AA),
                ),
              ),
              fullwidth: false,
              minFontSize: 24,
              style: kHeadingStyle2.copyWith(
                color: Color(0xFF373B5E),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _showDatePicker(context),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.calendar_month_rounded,
                        size: 24.0,
                        color: Color(0xFF7D80AA),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Date',
                                style: kHeadingStyle2.copyWith(fontSize: 12),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 12,
                                color: Color(0xFF7D80AA),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                time,
                                style: kHeadingStyle2.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            formattedDate,
                            style: kHeadingStyle2.copyWith(
                              fontSize: 16,
                              color: Color(0xFF7D80AA),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              FloatingActionButton.extended(
                label: Text(
                  category,
                  style: kHeadingStyle2.copyWith(
                    fontSize: 16,
                    color: Color(0xFF7D80AA),
                  ),
                ), // <-- Te
                backgroundColor: Colors.white,
                icon: const Icon(
                  Icons.label_outline_rounded,
                  size: 24.0,
                  color: Color(0xFF7D80AA),
                ),
                onPressed: () => _showDialog(
                  Column(
                    children: [
                      Expanded(
                        child: CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          onSelectedItemChanged: (int selectedItem) {
                            setState(() {
                              _selectedFruit = selectedItem;
                              category = _taskList[_selectedFruit];
                            });
                          },
                          children: List<Widget>.generate(_taskList.length,
                              (int index) {
                            return Center(
                              child: Text(
                                _taskList[index],
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }),
                        ),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                    label: Text(
                      'Add Task',
                      style: kHeadingStyle2.copyWith(
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    backgroundColor: Color(0xFF24A0ED),
                    icon: const Icon(
                      Icons.add,
                      size: 24.0,
                      color: Color(0xFFFFFFFF),
                    ),
                    onPressed: null),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
