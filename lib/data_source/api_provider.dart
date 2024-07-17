import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_test/model/create_model.dart';
import 'package:new_test/model/employ_model.dart';

class ApiProvider{
  Future<EmployeeDataModel?>fetchdata() async{
    try{
      String getData = 'https://dummy.restapiexample.com/api/v1/employees';
      var url = Uri.parse(getData);
      http.Response response = await http.get(url);
      if(response.statusCode == 200){
        print(response.body);
        return EmployeeDataModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('failed to error');
      }
    }

catch(e){
      print(e);
}
  }


}