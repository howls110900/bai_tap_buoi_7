import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'info.dart';

class AlertDialogExampleApp extends StatefulWidget {
  const AlertDialogExampleApp({super.key});

  @override
  State<AlertDialogExampleApp> createState() => _AlertDialogExampleAppState();
}

class _AlertDialogExampleAppState extends State<AlertDialogExampleApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Users List')),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        for (int i = 0; i < listUsers.length / 2; i++) {
                          dynamic abc = listUsers[i];
                          listUsers[i] = listUsers[listUsers.length - i - 1];
                          listUsers[listUsers.length - i - 1] = abc;
                        } //thuật toán tham khảo "https://laptrinhtudau.com/dao-nguoc-chuoi-trong-c/?fbclid=IwAR1P74N8zpoHWETzKM5dyfdvDsDJttABZ_Sdn_X0J2ymd2BITmsNnEBWYTQ"
                        // for(var item in listUsers.reversed){
                        // print(item.getInfo());}
                      });
                    },
                    child: const Text('Reversed List'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        listUsers.shuffle();
                      });
                    },
                    child: const Text('Shuffle List'),
                  ),
                ],
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: itemCount(listUsers),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          listUsers.removeAt(index);
                        });
                      },
                      child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: const BoxDecoration(
                            //color: Colors.yellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.0) //
                                    ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors
                                  .white, //change background color of button
                              backgroundColor: Colors.greenAccent,
                            ),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('User Details'),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ${listUsers[index].name} \nAge: ${listUsers[index].age}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Close'),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name: ${listUsers[index].name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    'Age: ${listUsers[index].age}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
