import 'package:flutter/material.dart';

void main() => runApp(MyConvert());

class MyConvert extends StatefulWidget {
  MyConvert({Key key}) : super(key: key);

  @override
  _MyConvertState createState() => _MyConvertState();
}

class _MyConvertState extends State<MyConvert> {
  String _convertedMeasure;
  double _numberFrom;
  String _startMeasure;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  @override
  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );
  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convertidor de medidas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Convertidor de medidas'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'value',
                style: labelStyle,
              ),
              Spacer(),
              TextField(
                style: inputStyle,
                decoration: InputDecoration(
                  hintText: "Please insert the measure to be convert",
                ),
                onChanged: (text) {
                  var rv = double.tryParse(text);
                  if (rv != null) {
                    setState(() {
                      _numberFrom = rv;
                    });
                  }
                },
              ),
              Spacer(),
              Text(
                'From',
                style: labelStyle,
              ),
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value;
                  });
                },
                value: _startMeasure,
              ),
              Spacer(),
              Text(
                'To',
                style: labelStyle,
              ),
              DropdownButton(
                isExpanded: true,
                style: inputStyle,
                items: _measures.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: inputStyle,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _convertedMeasure = value;
                  });
                },
                value: _convertedMeasure,
              ),
              Spacer(
                flex: 2,
              ),
              
              Spacer(
                flex: 8,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  } 
  }
}
