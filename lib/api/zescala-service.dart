import 'package:z_components/api/service.dart';
import 'package:z_components/interface/i-zescala-service.dart';
import 'package:z_components/settings/api-settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:z_components/view-model/EscalaViewModel.dart';

class ZEscalaService extends Service implements IZEscalaService {
  String _URL = "${ApiSettings.ENDPOINT}/zponto";

  final String token;

  ZEscalaService(this.token) : super(token);

  @override
  Future<List<EscalaViewModel>> listarEscalas() async {
    try {
      var url = "$_URL/listar-escalas";

      var response = await http.get(url, headers: await headers);

      var l = ((json.decode(response.body) as List)
              .map((i) => new EscalaViewModel.fromJson(i)))
          .toList();

      return l;
    } catch (e) {
      return null;
    }
  }
}