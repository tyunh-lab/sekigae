import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '席替え',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BorderRadiusGeometry? r;

  List<double> retsu = [];
  List<bool> isShown = [];

  List<int> seki = [];

  final audioPlayer = AudioPlayer();

  Future sekigae() async {
    seki.clear();
    int i = 0;
    while (i != 43) {
      isShown[i] = false;
      i++;
      seki.add(i);
    }
    seki.shuffle();

    //留学生考慮するとき
    if (considerOverseasStudent) {
      //留学生関係のコード
      List original = []; //移動される方たちの番号
      List edited = []; //引越される方達のindex

      original.add(seki[12]);
      original.add(seki[13]);
      original.add(seki[14]);
      original.add(seki[15]);
      original.add(seki[16]);

      edited.add(seki.indexOf(13));
      edited.add(seki.indexOf(23));
      edited.add(seki.indexOf(43));
      edited.add(seki.indexOf(39));
      edited.add(seki.indexOf(4));

      seki[12] = seki[edited[0]];
      seki[13] = seki[edited[1]];
      seki[14] = seki[edited[2]];
      seki[15] = seki[edited[3]];
      seki[16] = seki[edited[4]];

      seki[edited[0]] = original[0];
      seki[edited[1]] = original[1];
      seki[edited[2]] = original[2];
      seki[edited[3]] = original[3];
      seki[edited[4]] = original[4];
    }
    //ここまで

    setState(() {
      seki;
      isShown;
    });
    i = 0;
    await Future.delayed(const Duration(milliseconds: 300));
    await audioPlayer.play(AssetSource("SE114.mp3"));
    await Future.delayed(const Duration(milliseconds: 2900));
    await audioPlayer.stop();
    while (i != 12) {
      isShown[i] = true;
      i++;
    }
    setState(() {
      isShown;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    await audioPlayer.play(AssetSource("SE114.mp3"));
    await Future.delayed(const Duration(milliseconds: 2700));
    await audioPlayer.stop();
    while (i != 24) {
      isShown[i] = true;
      i++;
    }
    setState(() {
      isShown;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    await audioPlayer.play(AssetSource("SE114.mp3"));
    await Future.delayed(const Duration(milliseconds: 2600));
    await audioPlayer.stop();
    while (i != 36) {
      isShown[i] = true;
      i++;
    }
    setState(() {
      isShown;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    await audioPlayer.play(AssetSource("SE114.mp3"));
    await Future.delayed(const Duration(milliseconds: 2600));
    await audioPlayer.stop();
    while (i != 43) {
      isShown[i] = true;
      i++;
    }
    setState(() {
      isShown;
    });
  }

  @override
  void initState() {
    super.initState();
    int i = 0;
    while (i != 7) {
      retsu.add(0);
      i++;
    }
    i = 0;
    while (i != 43) {
      i++;
      seki.add(0);
      isShown.add(false);
    }
  }

  bool considerOverseasStudent = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(children: [
          const Spacer(),
          const Text('席替え'),
          const Spacer(),
          Switch(
              value: considerOverseasStudent,
              onChanged: (c) {
                setState(() {
                  considerOverseasStudent = c;
                });
              })
        ]),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: size.width, height: 16),
            Container(
              padding: const EdgeInsets.all(30),
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: const Center(
                child: Text(
                  '黒板',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.only(left: 440),
                child: Center(
                    child: SizedBox(
                        width: size.width,
                        height: size.height - 181,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  width: 90,
                                  height: 90,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder: (context, index2) {
                                        if (index == 0 && index2 == 0) {
                                          r = const BorderRadius.only(
                                              topLeft: Radius.circular(10));
                                        } else if (index == 0 && index2 == 5) {
                                          r = const BorderRadius.only(
                                              topRight: Radius.circular(10));
                                        } else if (index == 6 && index2 == 5) {
                                          r = const BorderRadius.only(
                                              bottomRight: Radius.circular(10));
                                        } else if (index == 6 && index2 == 0) {
                                          r = const BorderRadius.only(
                                              bottomLeft: Radius.circular(10));
                                        } else if (index == 7 && index2 == 0) {
                                          r = const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10));
                                        } else {
                                          r = BorderRadius.zero;
                                        }
                                        if (index == 7 && index2 == 0) {
                                          return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 90),
                                              child: Center(
                                                  child: Container(
                                                      margin: index2 == 2 ||
                                                              index2 == 4
                                                          ? const EdgeInsets
                                                              .only(left: 20)
                                                          : EdgeInsets.zero,
                                                      width: 90,
                                                      height: 90,
                                                      decoration: BoxDecoration(
                                                        borderRadius: r,
                                                        border: Border.all(
                                                            width: 1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${seki[index * 6 + index2] == 0 || isShown[index * 6 + index2] == false ? '' : seki[index * 6 + index2]}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 22),
                                                        ),
                                                      ))));
                                        } else if (index <= 6) {
                                          return Center(
                                              child: Container(
                                                  margin: index2 == 2 ||
                                                          index2 == 4
                                                      ? const EdgeInsets.only(
                                                          left: 20)
                                                      : EdgeInsets.zero,
                                                  width: 90,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    borderRadius: r,
                                                    border:
                                                        Border.all(width: 1),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${seki[index * 6 + index2] == 0 || isShown[index * 6 + index2] == false ? '' : seki[index * 6 + index2]}',
                                                      style: const TextStyle(
                                                          fontSize: 22),
                                                    ),
                                                  )));
                                        } else {
                                          return Container();
                                        }
                                      }));
                            })))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sekigae();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
