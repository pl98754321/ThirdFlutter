import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_firstprogram/Route/CardPopupRout.dart';
import 'package:real_firstprogram/provider/people_provider.dart';
import 'package:real_firstprogram/provider/people_type.dart';

//This is skeleton for Formscreen popup
class Formscreen extends StatefulWidget {
  const Formscreen({Key? key}) : super(key: key);

  @override
  _FormscreenState createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: "formherotag2",
            child: SingleChildScrollView(
              child: Material(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: _Formtextfill(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// subset of FormScreen, it contain TextFormFeild and button.
class _Formtextfill extends StatefulWidget {
  const _Formtextfill({Key? key}) : super(key: key);

  @override
  __FormtextfillState createState() => __FormtextfillState();
}

class __FormtextfillState extends State<_Formtextfill> {
  InputDecoration _decorational(String labelText) => InputDecoration(
        focusedBorder: InputBorder.none,
        focusColor: Colors.black,
        hintText: labelText,
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
      );

  TextEditingController controllorTitle = TextEditingController();
  TextEditingController controllorSubtitle = TextEditingController();
  TextEditingController controllorIconId = TextEditingController();
  TextEditingController controllorDate = TextEditingController();
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllorTitle,
          decoration: _decorational("title"),
          style: TextStyle(color: Colors.black),
          validator: (str) {
            if (str?.isEmpty ?? true) {
              return "FillTitle";
            }
            return null;
          },
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          controller: controllorSubtitle,
          decoration: _decorational("subtitle"),
          validator: (str) {
            if (str?.isEmpty ?? true) {
              return "FillSubtitle";
            }
            return null;
          },
        ),
        // TextFormField(
        //   keyboardType: TextInputType.number,
        //   controller: controllorIconId,
        //   decoration: _decorational("IconID"),
        //   validator: (str) {
        //     if (str?.isEmpty ?? true) {
        //       return "FillId";
        //     }
        //     return null;
        //   },
        // ),
        //
        // TextButton(
        //   onPressed: () {
        //     DatePicker.showDatePicker(context,
        //         showTitleActions: true,
        //         minTime: DateTime(2018, 3, 5),
        //         maxTime: DateTime(2019, 6, 7), onChanged: (date) {
        //       print('change $date');
        //       setState(
        //         () {
        //           _date = date;
        //         },
        //       );
        //     }, onConfirm: (date) {
        //       setState(() {
        //         _date = date;
        //       });
        //     }, currentTime: DateTime.now(), locale: LocaleType.zh);
        //   },
        //   child: Text(
        //     _date.toString(),
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                    print("add");
                    TranPeopleProvider provider =
                        Provider.of<TranPeopleProvider>(context, listen: false);
                    provider.addTo(
                      People(
                          title: controllorTitle.text,
                          subtitle: controllorSubtitle.text,
                          icon_id: 0, //int.parse(controllorIconId.text),
                          date: _date),
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "submit",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        )
      ],
    );
  }
}

/// Botton for homepage
class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CardPopupRoute(
            builder: (BuildContext context) {
              return Formscreen();
            },
          ),
        );
      },
      child: Hero(
        tag: "formherotag2",
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Material(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
