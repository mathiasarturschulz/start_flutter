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

class Usuario {
  String nome = '';
  String cpf = '';
  String email = '';
}

class PageCadastro extends StatelessWidget {
  static const optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Usuario _usuario = new Usuario();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: this._formKey,
          child: Column(
            children: [
              // cadastro
              Text('Cadastro', style: optionStyle),
              // campo nome
              TextFormField(
                keyboardType: TextInputType.name,
                validator: (String value) {
                  print(value);
                  if (value.length == 0) {
                    return 'O campo de nome é obrigatório';
                  }
                  return null;
                },
                onSaved: (String value) {
                  this._usuario.nome = value;
                },
                decoration: InputDecoration(
                    hintText: 'Fulano da Silva',
                    labelText: 'Nome',
                ),
              ),
              // campo cpf
              TextFormField(
                keyboardType: TextInputType.text,
                validator: (String value) {
                  print(value);
                  if (value.length != 11) {
                    return 'O campo de CPF é obrigatório e deve possuir 11 caracteres';
                  }
                  return null;
                },
                onSaved: (String value) {
                  this._usuario.cpf = value;
                },
                decoration: InputDecoration(
                    hintText: 'xxxyyyzzzww',
                    labelText: 'CPF (Sem pontuação)',
                ),
              ),
              // campo email
              TextFormField(
                keyboardType: TextInputType.name,
                validator: (String value) {
                  print(value);
                  if (value.length == 0) {
                    return 'O campo de e-mail é obrigatório';
                  }
                  return null;
                },
                onSaved: (String value) {
                  this._usuario.email = value;
                },
                decoration: InputDecoration(
                    hintText: 'nome@servidor',
                    labelText: 'E-mail',
                ),
              ),
              // botão
              Padding(
                // padding: const EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.only(top: 16, left: 250),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print('=> Cadastro do usuário: ');
                      print('Nome: ${_usuario.nome}');
                      print('E-mail: ${_usuario.email}');
                      print('CPF: ${_usuario.cpf}');
                    }
                  },
                  child: Text('Gravar'),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
