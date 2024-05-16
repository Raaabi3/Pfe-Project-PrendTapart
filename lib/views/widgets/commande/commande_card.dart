import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:menu_digitale_tablette/helpers/providers/Commandes.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Color borderColor;
  final Color titleColor;
  final int cardIndex;

  const CustomCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.borderColor,
    required this.titleColor,
    required this.cardIndex,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color borderColor = Colors.grey;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    Commandes comprovider = Provider.of<Commandes>(context);
    if (comprovider.card != widget.cardIndex) {
      borderColor = Colors.grey;
      isSelected = false;
    }

    return Container(
      width: 21.180555555555554.w,
      height: 14.219791666666664.h,
      child: Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isSelected ? borderColor : Colors.grey, width: 1.dp),
            borderRadius: BorderRadius.circular(5.dp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    1.25.w, 1.7708333333333333.h, 1.25.w, 0),
                child: Row(
                  children: [
                    Container(
                      width: 4.375.w,
                      height: 1.6666666666666667.h,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: widget.titleColor,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 4.375.w,
                      height: 1.6666666666666667.h,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          comprovider.countproduct(widget.title).toString() +
                              "Produit ",
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 128, 121, 121),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    1.25.w, 1.0416666666666665.h, 1.25.w, 0),
                child: Container(
                  height: 4.270833333333333.h,
                  width: 16.73611111111111.w,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(widget.subtitle,
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color.fromARGB(255, 128, 121, 121),
                        )),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 16.23402777777778.w,
                  height: 3.4124999999999996.h,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          color:
                              Color.fromRGBO(229, 231, 235, 1), // border color
                          width: 1, // border thickness
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (widget.title == "En attente") {
                        comprovider.setcard(0);
                        comprovider.checkstatus(widget.title)
                            ? setState(() {})
                            : null;

                        setState(() {
                          borderColor = widget.borderColor;
                          isSelected = true;
                        });
                      } else if (widget.title == "En cours") {
                        comprovider.setcard(1);
                        comprovider.checkstatus(widget.title)
                            ? setState(() {})
                            : null;

                        setState(() {
                          borderColor = widget.borderColor;
                          isSelected = true;
                        });
                      } else if (widget.title == "Terminé") {
                        comprovider.setcard(2);
                        comprovider.checkstatus(widget.title)
                            ? setState(() {})
                            : null;

                        setState(() {
                          borderColor = widget.borderColor;
                          isSelected = true;
                        });
                      }
                    },
                    child: Text(
                      'Ouvrir',
                      style: TextStyle(
                          color: Color.fromRGBO(17, 24, 39, 1), fontSize: 1.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
