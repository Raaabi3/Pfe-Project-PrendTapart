import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<String> languages = [];
  int selectedLanguageIndex = -1;

  Future<void> _fetchLanguages() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      languages = ["francais", "anglais", "arabe", "espangnol", "italien"];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9),
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.mode_night,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width:50),
                  Row(
                    children: [
                      Text("TABLE",style: TextStyle(
                        color: Colors.white,
                        fontFamily: "poppins",
                        fontSize: 21,
                        fontWeight: FontWeight.w500,)),
                         Text("10",style: TextStyle(
                        color: Colors.white,
                        fontFamily: "poppins",
                        fontSize: 36,
                        fontWeight: FontWeight.w500,))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ), 
              Image.asset(
                "assets/images/foodeatupservice.png",
                width: 503,
                height: 240,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: languages.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final String language = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLanguageIndex = index;
                        });
                        print('Selected language: $language');
                      },
                      child: Text(language),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                        backgroundColor: selectedLanguageIndex == index
                            ? Colors.red
                            : Colors.transparent,
                        foregroundColor: Colors.white,
                        side: BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                            style: selectedLanguageIndex == index
                                ? BorderStyle.solid
                                : BorderStyle.none),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(32), 
                        ),
                        minimumSize: Size(218, 70),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Sélectionner votre langue",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "poppins",
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 100),
              Text(
                "Privacy Policy | Terms of service\n© 2024 All rights Reserved.",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}