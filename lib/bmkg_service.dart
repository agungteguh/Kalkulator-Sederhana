import 'dart:convert';
import 'package:http/http.dart' as http;
import 'gempa_model.dart';

class BMKGService {
  final String url =
      'https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json';

  Future<Gempa> fetchGempa() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      return Gempa.fromString(
        jsonDecode(response.body)["Infogempa"]["gempa"]['Tanggal'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Jam'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['DateTime'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Coordinates'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Lintang'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Bujur'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Magnitude'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Kedalaman'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Wilayah'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Potensi'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Dirasakan'] as String,
        jsonDecode(response.body)["Infogempa"]["gempa"]['Shakemap'] as String,
      );
    } else {
      throw Exception('Gagal memuat data gempa');
    }
  }
}