import 'package:easydiagno/screens/AppHome/ClinicPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClinicHome extends StatefulWidget {
  ClinicHome({super.key});

  @override
  State<ClinicHome> createState() => _ClinicHomeState();
}

class _ClinicHomeState extends State<ClinicHome> {
  String? categoryInitial;

  List<String> categoryList = [
    'Anesthesiology',
    'Dermatology',
    'Emergency Medicine',
    'Endocrinology',
    'Neurology',
    'General Physician',
    'Gynecology',
    'Ophthalmology',
    'Orthopedics',
    'Otolaryngology',
    'Pediatrics',
    'Psychiatry',
    'Surgery',
    'Urology',
  ];
  List hospital_names = [
    "Baby Memorial Hospital (BMH)",
    "Kozhikode Medical College",
    "National Hospital",
    "Metro International cardiac care Hospital"
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: height / 17,
                    child: CupertinoSearchTextField(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //Open the filter dropdown when the filter button is pressed
                    showFilterDropdown();
                  },
                  icon: Icon(Icons.filter_list),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
              "Hospitals",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: height / 50,
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return ClinicPage();
                          }));
                        },
                        child: Row(
                          children: [
                            Container(
                              child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/bg.jpg')),
                              color: Colors.black,
                              height: height / 5.5,
                              width: width / 2.5,
                            ),
                            Expanded(
                              child: Container(
                                // color: Colors.amber,
                                height: height / 5.5,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          hospital_names[index],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: hospital_names.length),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget filterDropdown() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Row(
          children: [
            DropdownButton(
              hint: Text("Select Category"),
              value: categoryInitial,
              items: categoryList.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  categoryInitial = value.toString();
                });
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        );
      },
    );
  }

  //Show the filter dropdown
  void showFilterDropdown() {
    // Dialog box used to display the dropdown
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.only(bottom: 300),
          content: filterDropdown(),
        );
      },
    );
  }
}
