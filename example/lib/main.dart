import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:z_components/components/z-alert-dialog.dart';
import 'package:z_components/components/z-cadastro-usuario.dart';
import 'package:z_components/components/z-collection-item.dart';
import 'package:z_components/components/z-float-button.dart';
import 'package:z_components/components/z-item-tile.dart';
import 'package:z_components/components/z-pin-senha.dart';
import 'package:z_components/config/z-button-type.dart';
import 'package:z_components/config/z-platform.dart';
import 'package:z_components/config/z-mask.dart';
import 'package:z_components/config/z-dialog.dart';
import 'package:z_components/components/z-size.dart';
import 'package:z_components/components/z_switch.dart';
import 'package:z_components/components/z_picker.dart';
import 'package:z_components/components/z_tabbar.dart';
import 'package:z_components/components/z_button.dart';
import 'package:z_components/components/z_loading.dart';
import 'package:z_components/components/z-baseline.dart';
import 'package:z_components/components/z_navigationbar.dart';
import 'package:z_components/components/z_text_field.dart';
import 'package:z_components/components/z-collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:z_components/config/z-tipo-senha.dart';
import 'package:z_components/config/z-tipos-baseline.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool value = false;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff2BBAB4),
        accentColor: const Color(0xff2BBAB4),
        splashColor: const Color(0xff2BBAB4),
      ),
      home: ChangeNotifierProvider<AppSwitch>(
          builder: (_) => AppSwitch(), child: Home()),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate, // if it's a RTL language
      ],
      supportedLocales: [
        if (Platform.isIOS) const Locale('en', 'US'),
        if (Platform.isAndroid) const Locale('pt', 'BR'),
      ],
    );
  }
}

class Home extends StatelessWidget {
  bool value = false;
  int index = 0;

  var _key = new GlobalKey<ZCollectioState>();
  var _key2 = new GlobalKey<ZCollectioState>();

  @override
  Widget build(BuildContext context) {
    final appSwitch = Provider.of<AppSwitch>(context);

    return
     Scaffold(
      floatingActionButton: ZFloatButton(
        onPressed: () {},
      ),
      appBar: new ZNavigationBar(
        //middle: IOS
        middle: new Text(
          "ZComponets",
          style: new TextStyle(color: Colors.white),
        ),
        //title: ANDROID
        title: new Text(
          "ZComponets",
          style: new TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Column(children: <Widget>[
            new ZCollection(
              key: _key,
              titulo: "Cargos",
              lista: ["Vigilante Condutor de Animais", "Analista de Departamento Pessoal", "Assistente de Tecnico de Seguranca do Trabalho", "Coordenador de Seguranca do Trabalho", "Encarregado de Manutencao de Areas Verdes","Assistente de TI","Auxiliar Mecanico de Refrigeracao", "Coordenador de Departamento Pessoal","Coordenador de Relacionamento com Cliente", "Diretor de Desenvolvimento de Negocios", "Gerente de Desemvolvimento de Ngocios", "Gerente de Relacionamnto com Cliente", "Lider de Monitoramento de Sistmemas Eletronicos", "Meio Oficial de Manutencao Eletrica", "Secretaria - Analista", "Secretaria de Analista"].map(
                      (x) => new ZCollectionItem(chave: x, titulo: x, valor: x))
                  .toList(),
              onChange: (item) {
                if(_key.currentState.itemSelecionado != null)
                  print(_key.currentState.itemSelecionado.valor);
              },
            ),

            new ZBaseLine(
              zTipos: ZTipoBaseline.isNomeCompleto,
              context: context,
            ),
            new ZBaseLine(
              zTipos: ZTipoBaseline.isCPF,
              context: context,
            ),
            new ZBaseLine(
              zTipos: ZTipoBaseline.isCelular,
              context: context,
            ),
            new ZBaseLine(
              zTipos: ZTipoBaseline.isEmail,
              context: context,
            ),
            new ZBaseLine(
              zTipos: ZTipoBaseline.isDataNascimento,
              context: context,
            ),
            new ZPinSenha(context: context,numeroQuadrados: 4,zTipos: ZTipoSenha.isSenha,),
            new ZPinSenha(context: context,numeroQuadrados: 4,zTipos: ZTipoSenha.isRepetirSenha,)
            ,new ZItemTile(textoTitulo: "Bento Raimundo da Mata ag rg G wrgWRAER HGAER H tshssth ",textoDois: "Sede - Fernando ltda.",textoTres: "Sede - Fernando ltda.",
            textoQuatro: "5x2",textoCinco: "(seg-sex)",textoSeis: "08:00-17:48",textoSete: "1:00",textoCodigo: "012345",status: true,
            ),
           // new ZItemTile(),
            new Container(height: 80.0,)
          ]),
        ],
      ),
      bottomNavigationBar: ZtabBar(
        backgroundColor: Colors.teal,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        onTap: (index) => this.index = index,
        currentIndex: 0,
        iconSize: 16,
        inactiveColor: Colors.red,
        activeColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        // currentIndex: _selectedIndex,
      ),
    );

  }
}

class AppSwitch with ChangeNotifier {
  AppSwitch();

  bool _value = false;
  String _text = "";

  set value(bool text) {
    _value = text;
    notifyListeners();
  }

  bool get value => _value;

  set text(String text) {
    _text = text;
    notifyListeners();
  }

  String get text => _text;
}
