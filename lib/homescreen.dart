import 'package:amirvendi/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feildpage.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Amirprovider provider = Provider.of<Amirprovider>(context, listen: true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getemployeeDetails();
    });
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<Amirprovider>(builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Onk veendii!! ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "CRUD ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 22),
                  child: Container(
                    height: height / 5,
                    width: width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent,
                          Colors.lightBlueAccent,
                          Colors.pinkAccent,
                          Colors.blueAccent,
                          Colors.pinkAccent,
                          Colors.blueAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name     : ' + value.employelist[index].name,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Text(
                                            'Are u Sure ??',
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          actions: [
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    value.playersDelete(
                                                        value
                                                            .employelist[index].id,
                                                        context);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 80,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(10),
                                                          color: Colors.black45,
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color:
                                                                  Colors.white),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.yellow,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: [
                                Text(
                                  'TEAM   :' + value.employelist[index].phone,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: value.employelist.length,
            )
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detailspage(),
            ),
          );
        },
        backgroundColor: Colors.tealAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
