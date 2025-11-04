import 'package:flutter/material.dart';
import 'package:couldai_user_app/tasbih_model.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  _TasbihScreenState createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  final List<Tasbih> _tasbihList = [
    Tasbih(name: 'Istighfar'),
    Tasbih(name: 'Subhanallah'),
    Tasbih(name: 'Alhamdulillah'),
    Tasbih(name: 'Allahu Akbar'),
    Tasbih(name: 'La ilaha illallah'),
  ];
  late Tasbih _selectedTasbih;

  @override
  void initState() {
    super.initState();
    _selectedTasbih = _tasbihList[0];
  }

  void _incrementCounter() {
    setState(() {
      _selectedTasbih.count++;
    });
  }

  void _resetCounter() {
    setState(() {
      _selectedTasbih.count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbih Counter'),
        actions: [
          DropdownButton<Tasbih>(
            value: _selectedTasbih,
            onChanged: (Tasbih? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedTasbih = newValue;
                });
              }
            },
            items: _tasbihList.map<DropdownMenuItem<Tasbih>>((Tasbih value) {
              return DropdownMenuItem<Tasbih>(
                value: value,
                child: Text(value.name),
              );
            }).toList(),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: _incrementCounter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _selectedTasbih.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '${_selectedTasbih.count}',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 100),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
