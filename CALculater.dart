import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
//import './flutter_screen/first_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "my simple interest calculater app",
    home: SIForm(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ["Rupees", "Dollers", "Pounds", "euros", "others"];
  var _currentItemSelected = "";

  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principleController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String displayResult = "";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("simple interest calculater"),
      ),
      body: Form(
        key: _formKey,
        //margin: EdgeInsets.all(10.0),
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: textStyle,
                      validator: (String value) {
                        if (value.isEmpty)
                          return "please enter principle amount";
                      },
                      controller: principleController,
                      decoration: InputDecoration(
                          labelText: "principle",
                          hintText: "enter principle",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 15.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: textStyle,
                      validator: (String value) {
                        if (value.isEmpty) return "please enter interest";
                      },
                      controller: roiController,
                      decoration: InputDecoration(
                          labelText: "Rate of interest",
                          hintText: "In percentage",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 15.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.phone,
                          style: textStyle,

                          controller: termController,
                              validator: (String value) {
                                if (value.isEmpty)
                                  return "please enter year";
                                else if(int.parse(termController.text) !=int)

                                return "enter valid year";
                              },
                          decoration: InputDecoration(
                              labelText: "Term",
                              hintText: "In year",
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontSize: 15.0,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                        Container(
                          width: 20.0,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: textStyle,
                              ),
                            );
                          }).toList(),
                          value: _currentItemSelected,
                          onChanged: (String newValueSelected) {
                            setState(() {
                              this._currentItemSelected = newValueSelected;
                            });
                          },
                        )),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              "Calculate",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  this.displayResult = _totalReturn();
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              "Reset",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    this.displayResult,
                    style: textStyle,
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/money.png");
    Image image = Image(
      image: assetImage,
      width: 110.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(40.0),
    );
  }

  String _totalReturn() {
    double principle = double.parse(principleController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalPrinciple = principle + (principle * roi * term) / 100.0;
    String result =
        "After $term year, your investment will be $totalPrinciple $_currentItemSelected ";
    return result;
  }

  void _reset() {
    principleController.text = "";
    roiController.text = "";
    termController.text = "";
    displayResult = "";
    _currentItemSelected = _currencies[0];
  }
}
