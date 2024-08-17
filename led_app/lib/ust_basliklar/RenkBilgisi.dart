import 'package:flutter/material.dart';

class RenkBilgisi extends StatefulWidget {
  const RenkBilgisi({super.key});

  @override
  State<RenkBilgisi> createState() => _RenkBilgisiState();
}

class _RenkBilgisiState extends State<RenkBilgisi> {
  double _currentSliderValue = 5;
  double _currentSliderValue1 = 10;
  double _currentSliderValue2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Slider(
            thumbColor: Colors.blue,
            activeColor: Colors.brown,
            inactiveColor: Colors.brown[300],
            value: _currentSliderValue,
            max: 100,
            divisions: 20,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Slider(
            thumbColor: Colors.green,
            activeColor: Colors.black,
            inactiveColor: Colors.black54,
            value: _currentSliderValue1,
            max: 100,
            divisions: 10,
            label: _currentSliderValue1.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue1 = value;
              });
            },
          ),
          Slider(
            thumbColor: Colors.black,
            activeColor: Colors.red,
            inactiveColor: Colors.red[300],
            value: _currentSliderValue2,
            max: 100,
            divisions: 100,
            label: _currentSliderValue2.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue2 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
