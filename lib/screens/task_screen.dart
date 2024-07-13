import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/utility/card_design.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todoey_flutter/screens/task_add.dart';

class TaskScreen extends StatefulWidget {
  static const String id = 'TaskScreen';
  const TaskScreen({super.key});
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<bool> isChecked = [false, false, false, false, false, false, false];
  double opacityValue = 0.5;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF344FA1),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF344FA1),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            FontAwesomeIcons.bars,
            color: Color(0xFFD0D4E0),
            size: 30,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            splashRadius: 28,
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Color(0xFFD0D4E0),
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 10),
            child: IconButton(
              splashRadius: 28,
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_month_rounded,
                color: Color(0xFFD0D4E0),
                size: 35,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD103FC),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, TaskAdd.id);
        },
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            child: Text(
              "What's up, Arham!",
              textAlign: TextAlign.center,
              style: kHeadingStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 37),
            child: Text(
              'Categories',
              textAlign: TextAlign.left,
              style: kCardTextStyle.copyWith(
                fontSize: 22,
                color: Color(0xFFD0D4E0),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  h: 150,
                  w: 200,
                  card: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Business',
                          style: kCardTextStyle,
                        ),
                        Text(
                          '40 Tasks',
                          textAlign: TextAlign.left,
                          style: kCardTextStyle.copyWith(
                            fontSize: 18,
                            color: kCardTextColor,
                          ),
                        ),
                        LinearPercentIndicator(
                          width: 150,
                          lineHeight: 4.0,
                          percent: 0.8,
                          progressColor: Color(0xFFD103FC),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 37, top: 40),
            child: Text(
              "Today's Tasks",
              textAlign: TextAlign.left,
              style: kCardTextStyle.copyWith(
                fontSize: 22,
                color: Color(0xFFD0D4E0),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Opacity(
                  opacity: isChecked[index] ? opacityValue : 1.0,
                  child: ItemCard(
                    h: 80,
                    w: 400,
                    card: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 18, 0),
                            child: RoundCheckBox(
                              onTap: (selected) {
                                setState(() {
                                  isChecked[index] = !isChecked[index];
                                });
                              },
                              border: Border.all(
                                width: 2,
                                color: Color(0xFFD103FC),
                              ),
                              size: 30,
                              isChecked: isChecked[index],
                              checkedWidget:
                                  Icon(Icons.check, color: Colors.white),
                              checkedColor: Color(0xFFD103FC),
                              animationDuration: Duration(
                                milliseconds: 700,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Do your homework today',
                              textAlign: TextAlign.left,
                              style: kCardTextStyle.copyWith(
                                decoration: isChecked[index]
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontSize: 18,
                                color: const Color(0xFFBBC2D8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
