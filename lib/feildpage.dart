import 'package:amirvendi/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Detailspage extends StatelessWidget {
  String from;
  String oldid;
  Detailspage({super.key,required this.from,required this.oldid,});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final formKey = GlobalKey<FormState>();

    var textEditingController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EMPLOYEE ',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'DETAILS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<Amirprovider>(builder: (context, value, child) {
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20),
                child: Container(
                  width: width / 1.1,
                  height: height / 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextField(

                      controller: value.employeenameController,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      decoration: InputDecoration(
                        hintText: "Employee Name....",
                        hintStyle: TextStyle(
                          fontSize: 19,
                          color: Colors.grey,
                        ),
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      'Phone',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.cyanAccent),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20),
                child: Container(
                  width: width / 1.1,
                  height: height / 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.number,
                      // maxLength: 10,
                      controller: value.employeephoneController,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      decoration: InputDecoration(
                        hintText: "Employee NO....",
                        hintStyle: TextStyle(
                          fontSize: 19,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              // Row(
              //
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              //       child: Text('Contract',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: Colors.pink),),
              //     ),
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 20),
              //
              //   child: Container(
              //     width: width / 1.1,
              //     height: height / 15,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.black,
              //     ),
              //     // child: Padding(
              //     //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
              //     //   child: TextFormField(
              //     //     controller: value.playerContractController,
              //     //     style: TextStyle(
              //     //       color: Colors.grey,
              //     //       fontSize: 20,
              //     //       fontWeight: FontWeight.w800,
              //     //     ),
              //     //     decoration: InputDecoration(
              //     //       hintText: "Contract Period...",
              //     //       hintStyle: TextStyle(
              //     //         fontSize: 19,
              //     //         color: Colors.grey,
              //     //       ),
              //     //       border: InputBorder.none,
              //     //     ),
              //     //   ),
              //     // ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Consumer<Amirprovider>(builder: (context, value, child) {
                  return ElevatedButton(
                      onPressed: () {
                        if(from=="NEW"){
                          value.addData(from,"");
                          value.getemployeeDetails();
                        }else{
                          value.addData(from,oldid);
                          value.getemployeeDetails();
                        }

                        formKey.currentState!.reset();
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.flight_land,
                        size: 30,
                        color: Colors.pinkAccent,
                      ));
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
