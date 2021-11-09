// ignore: file_names
import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  const MyIcon({
    Key? key,
    required this.topval,
    required this.leftval,
    required this.name,
    required this.label,
    required this.link,
  }) : super(key: key);

  final double topval;
  final double leftval;
  final IconData name;
  final String label;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * topval,
        left: leftval,
        child: Container(
          width: 95,
          height: 95,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: Colors.orange[600],
              shape: BoxShape.circle),
          child: FloatingActionButton.large(
            heroTag: label,
            onPressed: () {
              Navigator.pushNamed(context, link);
            },
            backgroundColor: Colors.orange[600],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(name),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
