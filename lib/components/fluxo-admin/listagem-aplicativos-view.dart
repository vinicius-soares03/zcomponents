

import 'package:flutter/src/widgets/framework.dart';
import 'package:z_components/api/conta/i-conta-service.dart';
import 'package:z_components/api/contas/contas-service.dart';
import 'package:z_components/api/contas/i-contas-service.dart';
import 'package:z_components/components/filtro/filter-expression.dart';
import 'package:z_components/components/fluxo-admin/listagem-aplicativos.dart';
import 'package:z_components/components/utils/novo_token.dart';
import 'package:z_components/i-view.dart';
import 'package:z_components/view-model/app-view-model.dart';

class ListagemAplicativosView extends IView<ListagemAplicativos>{
  ListagemAplicativosView(State<ListagemAplicativos> state) : super(state);

  IContasService contasService;
  List<AppViewModel> listaModulos = [];
  SearchOptions searchOptions = new SearchOptions();

  bool icons2 = true;

  @override
  Future<void> afterBuild() {
    // TODO: implement afterBuild
    throw UnimplementedError();
  }

  @override
  Future<void> initView() async{
    contasService = new ContasService(NovoToken.newToken);
    await buscarAplicativos(searchOptions);
  }

  Future<void> buscarAplicativos (SearchOptions searchOptions)async{
    var res = await contasService.listarAplicativos(searchOptions,state.widget.moduloContaViewModel.idModulo);
    if(res !=null){
      state.setState(() {
        listaModulos = res;
      });
    }

  }
}