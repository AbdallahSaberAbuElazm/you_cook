import 'package:flutter/material.dart';

class MergeImges extends StatelessWidget {
  final String backgroundImage;
  final String imageUrl;
  final String optionText;
  final String descriptionText;
  const MergeImges(
      {super.key,
      required this.backgroundImage,
      required this.imageUrl,
      required this.optionText,
      required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    shadowIcon(Icons.arrow_back_ios),
                    shadowText(optionText, context)
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, -MediaQuery.of(context).size.height / 100),
                  child: Text(
                    descriptionText,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.8,
                  // width: MediaQuery.of(context).size.width / ,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  Widget shadowIcon(IconData icon) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 3.0,
          top: 1.0,
          child: Icon(
            icon,
            color: const Color.fromARGB(31, 62, 61, 61),
            size: 33,
          ),
        ),
        Icon(
          icon,
          color: Colors.white,
          size: 33,
        ),
      ],
    );
  }

  Widget shadowText(String text, BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 3.0,
          top: 1.0,
          child: Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(31, 62, 61, 61),
                fontSize: 38,
                fontFamily: 'NotoKufiArabic',
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
