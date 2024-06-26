import 'package:flutter/material.dart';
import '../text_styles.dart';
import '../../services/trans_service.dart';

class History extends StatelessWidget {
  final TransactionService transactionService = TransactionService();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: AppBar(
              title: Text('History', style: settingsHeader),
            ),
          ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.08829465,
          left: MediaQuery.of(context).size.width * 0.01302083,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.03784057,
            width: MediaQuery.of(context).size.width * 0.16276042,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Warning'), icon: Icon(Icons.warning_amber, color: Colors.red, size: 30,),
                            content: Text('This Action Cannot Be Undone. Are You Sure You Want To Clear All Transaction History?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  transactionService.clearAllTransactions();
                                  Navigator.of(context).pop();
                                },
                                child: Text('I\'m Sure', style: TextStyle(color: Colors.red),),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel', style: TextStyle(color: Colors.black),),
                              ),
                            ],
                          );
                        },
                      );
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              ),
              child: Text('Clear All Transaction History', 
                          style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.00976562, fontFamily: 'Hind Kochi', fontWeight: FontWeight.w500, height: 0,)
                          ),
            ),
          ),
        ),
        Positioned(
                    left: MediaQuery.of(context).size.width * 0.4,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height,
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
      ],
    );
  }
}