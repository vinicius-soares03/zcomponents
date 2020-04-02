import 'package:flutter/material.dart';
import 'package:z_components/components/utils/dialog-utils.dart';
import 'package:z_components/styles/main-style.dart';

class ZInputGeneric extends StatefulWidget {
  final Key key;
  String hintText;
  String textMask;
  String titulo;
  bool comMascara;
  TextInputType tipoTeclado;
  FocusNode inputPadraoFocus;
  ValueChanged<String> onChange;

  var controllerInputPadrao = new TextEditingController();
  FocusNode proximoFocus;

  ZInputGeneric({
    this.key,
    this.hintText: "",
    this.onChange,
    this.tipoTeclado: TextInputType.text,
    this.comMascara:false,
    @required this.titulo,
    this.textMask,
    @required this.inputPadraoFocus,
    @required this.controllerInputPadrao,
    this.proximoFocus,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ZInputGenericState();
}

class _ZInputGenericState extends State<ZInputGeneric> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainStyle.styleTextInput(
        context,
        "${widget.titulo}:",
        widget.tipoTeclado,
        () {
          FocusScope.of(context).requestFocus(widget.inputPadraoFocus);
        },
        widget.inputPadraoFocus,
        widget.controllerInputPadrao,
        widget.proximoFocus,
        (text) {
          if (widget.onChange != null) widget.onChange(text);
        },
        widget.comMascara,
        textMask: "${widget.textMask}",
        hintText: "${widget.hintText}");
  }

}