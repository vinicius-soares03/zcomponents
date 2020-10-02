import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:z_components/components/z-sequencia/sequencia.dart';
import 'package:z_components/styles/main-style.dart';

class ZSequenciaCalendario extends StatefulWidget {
  final String primeiroDiaEscala;
  final String escala;

  ZSequenciaCalendario(
      {@required this.primeiroDiaEscala, @required this.escala});

  @override
  State<StatefulWidget> createState() => _ZSequenciaCalendarioState();
}

class _ZSequenciaCalendarioState extends State<ZSequenciaCalendario> {
  Sequencia _sequencia;

  var _calendarController = new CalendarController();

  @override
  void initState() {
    _sequencia = new Sequencia(
        primeiroDiaEscala: widget.primeiroDiaEscala, escala: widget.escala);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        new TableCalendar(
          headerStyle: new HeaderStyle(
              formatButtonVisible: false, centerHeaderTitle: true),
          locale: "pt-BR",
          calendarController: _calendarController,
          headerVisible: false,
          builders: new CalendarBuilders(
            dayBuilder: _buildDay,
            dowWeekdayBuilder: _buildWeekDay,
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Divider(
            height: 4,
            color: const Color(0xFFCCCCCC),
          ),
        ),
        new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                width: 10,
                height: 10,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: MainStyle.get(context).primaryColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              new Text(
                "DIA ATUAL",
                style: new TextStyle(fontSize: 10),
              ),
              new Container(
                width: 10,
                height: 10,
                decoration: new BoxDecoration(
                    color: MainStyle.get(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              new Text("DIAS T (TRABALHO)",
                  style: new TextStyle(fontSize: 10)),
              new Container(
                width: 10,
                height: 10,
                decoration: new BoxDecoration(
                    color: const Color(0xFFE6E6E6),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              new Text("DIAS F (FOLGA)", style: new TextStyle(fontSize: 10))
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDay(
      BuildContext context, DateTime date, List<dynamic> dayBuilder) {
    var touf = _sequencia.calcularSeDiaTouF(date);

    BoxDecoration boxDecoration;
    Color corDoDia;
    Color corPreenchimento;

    bool diaIgualAHoje = _checarSeDiaIgualAHoje(date);
    bool diaDesseMes = _checarSeDiaDesseMes(date);

    if (diaIgualAHoje) {
      corDoDia = MainStyle.get(context).primaryColor;
      corPreenchimento = Colors.white;
      boxDecoration = new BoxDecoration(
          color: corPreenchimento,
          border: new Border.all(
              color: MainStyle.get(context).primaryColor, width: 4));
    } else {
      if (diaDesseMes) {
        corDoDia = _definirCorDoDia(touf);
        corPreenchimento = _definirCorDePreenchimento(touf);
        boxDecoration = new BoxDecoration(
          color: corPreenchimento,
        );
      } else {
        corDoDia = const Color(0xFFCCCCCC);
        corPreenchimento = Colors.transparent;
        boxDecoration = new BoxDecoration(
          color: corPreenchimento,
        );
      }
    }

    return new Column(
      children: [
        new Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(4.0),
          decoration: boxDecoration,
          child: new Text(
            "${date.day}",
            style: new TextStyle(color: corDoDia, fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Widget _buildWeekDay(BuildContext context, String weekDay) {
    return new Container(
      padding: const EdgeInsets.all(4.0),
      child: new Text(
        weekDay.toUpperCase(),
        textAlign: TextAlign.center,
        style: new TextStyle(color: const Color(0xFF707070), fontSize: 14.0),
      ),
    );
  }

  Color _definirCorDoDia(String touf) {
    switch (touf) {
      case "T":
        return Colors.white;
      case "F":
        return const Color(0xFF707070);
      default:
        return Colors.black;
    }
  }

  Color _definirCorDePreenchimento(String touf) {
    switch (touf) {
      case "T":
        return MainStyle.get(context).primaryColor;
      case "F":
        return const Color(0xFFE6E6E6);
      default:
        return Colors.white;
    }
  }

  bool _checarSeDiaIgualAHoje(DateTime date) {
    return date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;
  }

  bool _checarSeDiaDesseMes(DateTime date) {
    return date.year == DateTime.now().year &&
        date.month == DateTime.now().month;
  }
}