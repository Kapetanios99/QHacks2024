import 'dart:convert';

import 'package:http/http.dart' as http;
 
 

class PythonReturnData {
  final String result;

  const PythonReturnData({
    required this.result
  });

  factory PythonReturnData.fromJson(Map<String, dynamic> json){
    return switch (json) {
      {
      'result' : String result,
    } => 
      PythonReturnData(result: result,),
      _ => throw const FormatException('Failed to load python data'),
    }; 
  }



}

Future<PythonReturnData> fetchData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:5000'));

  if (response.statusCode == 200){
    return PythonReturnData.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load python data');
  }
}