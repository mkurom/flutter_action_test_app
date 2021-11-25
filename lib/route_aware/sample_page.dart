import 'package:flutter/material.dart';
import 'package:flutter_action_test_app/route_aware/route_aware_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => RouteAwarePage(),
                ),
              );
            },
            child: Text('Next RouteAwarePage'),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('sample'),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('戻る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
