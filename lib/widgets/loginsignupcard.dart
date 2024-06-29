import 'package:flutter/material.dart';

class LoginSignupCard extends StatefulWidget {
  final String image, title, description;

  const LoginSignupCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<LoginSignupCard> createState() => _LoginSignupCardState();
}

class _LoginSignupCardState extends State<LoginSignupCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      height: orientation == Orientation.portrait ? size.height * 0.50 : size.height * 0.30,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Image.asset(
                fit: BoxFit.contain,
                widget.image,
                height: orientation == Orientation.portrait ? size.height * 0.3 : size.height * 0.15,
              ),
            ),
            Column(
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: orientation == Orientation.portrait ? 25 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: orientation == Orientation.portrait ? 15 : 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
