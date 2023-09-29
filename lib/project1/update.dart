import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class updatedonor extends StatefulWidget {
  const updatedonor({super.key});

  @override
  State<updatedonor> createState() => _updatedonorState();
}

class _updatedonorState extends State<updatedonor> {
  final bloodGroops = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  TextEditingController donorname = TextEditingController();
  TextEditingController donornumber = TextEditingController();

  void updatedonor(docid) {
    final data = {
      'name': donorname.text,
      'number': donornumber.text,
      'group': selectedGroup
    };
    donor.doc(docid).update(data).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    donorname.text = args['name'];
    donornumber.text = args['number'];
    selectedGroup = args['group'];
    final docid = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Donors"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: donorname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Donor Name")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: donornumber,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Mobile Number")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                  value: selectedGroup,
                  decoration:
                      InputDecoration(label: Text("Select Blood Group")),
                  items: bloodGroops
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    selectedGroup = val as String?;
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  updatedonor(docid);
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text(
                  "Update",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
