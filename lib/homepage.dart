import 'package:flutter/material.dart';
import 'package:post_data/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = [];
  int start = 0;
  int end = 10;
  loadMore() async {
    start = end + 1;
    end += end;
    var data = await getPostData(start, end);
    setState(() {
      data.addAll(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getPostData(start, end).then((value) {
      setState(() {
        print("value: $value");
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Data',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(data[index]['id'].toString()),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index]['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(data[index]['body'])
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
