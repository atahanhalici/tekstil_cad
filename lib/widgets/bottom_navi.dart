import 'package:flutter/material.dart';

class BottomNavigationBars extends StatelessWidget {
  const BottomNavigationBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width - 50,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.dehaze),
                  Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  Icon(Icons.person)
                ],
              ),
            ),
          ),
          Container(
            height: 65,
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            // child: Icon(Icons.home),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 80) / 2,
            child: const SizedBox(
                height: 65,
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
