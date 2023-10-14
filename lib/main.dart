import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculate your Interest',
    home: Iform(),
    theme: ThemeData(
      primaryColor: Colors.indigo,
      brightness: Brightness.dark,

    ),
  ));
}

class Iform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Iform();
  }
}

class _Iform extends State<Iform> {
  var _currencies = ['Ruppes', 'Dollars', 'Pounds'];
  final double _minimumPadding = 5.0;

  String? _selectedCurrency;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest Calculator'),
      ),
      body: Container(
          margin: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(

            children: <Widget>[
              getImageAssets(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: textStyle,
                  decoration: InputDecoration(
                      label: const Text('Principal'),
                      hintText: "Enter Principal e.g 12000",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: textStyle,
                  decoration: InputDecoration(
                      label: const Text('Rate of Interest'),
                      hintText: 'In Percent',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: textStyle,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text('Select currenci', style: textStyle,),
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _selectedCurrency,
                        // value: 'Rupees',

                        onChanged: (String? newValueSelected) {
                          // Your code to execute, when a menu item is selected from dropdown
                          setState(() {
                            _selectedCurrency = newValueSelected;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).toggleableActiveColor,
                          backgroundColor: Colors.grey,
                          textStyle: const TextStyle(
                            color: Colors.black
                          )
                        ),
                        child: const Text('Calculate',textScaleFactor: 1.5,),
                        onPressed: () {},
                      ),
                    ),
                    Container(width: _minimumPadding *5 ,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Reset',style: textStyle,textScaleFactor: 1.5,),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(_minimumPadding*2,),
              child: Text('Todo Test',style: textStyle,),)
            ],
          )),
    );
  }

//fun for images
  Widget getImageAssets() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }
}
