import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(
                      "hey, selena",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ])
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 27,
                          ),
                        ),
                      ),
                      Text(
                        "\$5 194 382",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 65,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Transfer",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFF2B33A),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 65,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Request",
                          style:
                              TextStyle(color: Color(0xFFFAFAFA), fontSize: 18),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 31, 31, 31),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
