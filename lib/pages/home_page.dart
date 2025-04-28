import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String akun;
  const HomePage({super.key, required this.akun});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 18, left: 10, right: 10),
            width: double.infinity,
            color: Colors.deepOrange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              children: [
                Row(
                  spacing: 15,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/bob3.jpg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          widget.akun,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Colors.white),
                ),
              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(0),
                  width: double.infinity,
                  height: 150,
                  child: Image.asset(
                    'assets/images/ft2.jpeg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment(0.0, 0.1),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
