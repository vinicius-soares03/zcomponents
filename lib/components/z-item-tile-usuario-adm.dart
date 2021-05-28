import 'package:flutter/material.dart';
import 'package:z_components/components/z-nome-reduzido.dart';

class ZItemTileUsuarioAdm extends StatefulWidget {
  final String nomeUsuario;
  final String appsVinculados;
  final String email;
  final String status;
  final String quantidadeApps;
  Function onTap;

  ZItemTileUsuarioAdm(
      {this.nomeUsuario,
      this.appsVinculados,
      this.email,
      this.status,
      this.quantidadeApps,
      this.onTap});

  @override
  _ZItemTileUsuarioAdmState createState() => _ZItemTileUsuarioAdmState();
}

class _ZItemTileUsuarioAdmState extends State<ZItemTileUsuarioAdm> {
  Widget retornarNome() {
    if (widget.nomeUsuario == null) {
      return new Text(widget.nomeUsuario);
    } else {
      return new Text(
        widget.nomeUsuario,
        style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w600),
      );
    }
  }

  Widget retotnarAppVinculado() {
    if (widget.appsVinculados == null) {
      return new Text('');
    } else {
      if (widget.quantidadeApps == null || widget.quantidadeApps.isEmpty) {
        return new Text(
          widget.appsVinculados,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 12,
          ),
        );
      } else {
        return new Text(
          "[${widget.quantidadeApps}] " + widget.appsVinculados,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 12,
          ),
        );
      }
    }
  }

  Widget retornarEmail() {
    if (widget.email == null) {
      return Text('');
    } else {
      return Text(
        widget.email,
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 12,
        ),
      );
    }
  }

  Widget retornarStatus() {
    if (widget.status == null) {
      return Text('');
    } else {
      return Text(
        widget.status,
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 12,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.onTap,
      child: new IntrinsicHeight(
        child: new Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          child: Material(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(color: Theme.of(context).accentColor)),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Container(
                                margin: EdgeInsets.only(
                                    left: 9.0, bottom: 6.0, top: 6.0),
                                child: retornarNome()),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 15,
                              child: new Container(
                                  margin: EdgeInsets.only(
                                      left: 9.0,
                                      right: 0.0,
                                      bottom: 4.0,
                                      top: 6.0),
                                  child: new Text("Apps:")),
                            ),
                            Expanded(
                              flex: 35,
                              child: new Container(
                                margin: EdgeInsets.only(
                                  left: 4.0,
                                ),
                                child: retotnarAppVinculado(),
                              ),
                            ),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 15,
                              child: new Container(
                                  margin: EdgeInsets.only(
                                      left: 9.0,
                                      right: 0.0,
                                      bottom: 4.0,
                                      top: 6.0),
                                  child: new Text("E-mail:")),
                            ),
                            Expanded(
                              flex: 35,
                              child: new Container(
                                margin: EdgeInsets.only(
                                  left: 4.0,
                                ),
                                child: retornarEmail(),
                              ),
                            ),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 15,
                              child: new Container(
                                  margin: EdgeInsets.only(
                                      left: 9.0,
                                      right: 0.0,
                                      bottom: 4.0,
                                      top: 6.0),
                                  child: new Text("Status:")),
                            ),
                            Expanded(
                              flex: 35,
                              child: new Container(
                                margin: EdgeInsets.only(
                                  left: 4.0,
                                ),
                                child: retornarStatus(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
