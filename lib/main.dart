import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// Widget principal da aplicação
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Start(),
    );
  }
}

class Start extends StatefulWidget {
  Start({Key key}) : super(key: key);
  _Start createState() => _Start();
}

class _Start extends State {
  // variavel que controla a página atual
  var _currentPage = 0;
  // lista de páginas
  static const optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var _pages = [
    PageCadastro(),
    Text('Pagina 2 - Informações', style: optionStyle),
    Text('Pagina 3 - Sobre', style: optionStyle),
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vacinação COVID-19'),
        ),
        body: Center(child: _pages.elementAt(_currentPage)),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline), 
                  label: 'Cadastro',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assessment_outlined),
                  label: 'Informações',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_ind_rounded),
                  label: 'Sobre'
              ),
            ],
            currentIndex: _currentPage,
            fixedColor: Colors.purple,
            onTap: (int inIndex) {
              setState(() {
                _currentPage = inIndex;
              });
            }),
      ),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class PageCadastro extends StatelessWidget {
  static const optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Pagina 1 - Cadastro', style: optionStyle),
          Divider(),
          Text('Texto 01'),
          Divider(),
          Text('Texto 02'),
          Divider(),
        ],
      )
    );
  }
}
