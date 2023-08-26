import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService
{
  final String baseURL = "http://3.1.62.165:8080/api/v1/";
  String userID = "0";
  int userGoupID = 0;

  Future<http.Response> getLoginDetails(Map<String, String> body) async  {
    return await http.post(Uri.parse("${baseURL}signin1"), body: body);
  }

  Future<http.Response> getUserGroupList() async  {
    final prefs = await SharedPreferences.getInstance();
    userID = (prefs.getString('userId') ?? "0");
    return await http.get(Uri.parse("${baseURL}controller/user/$userID/cluster"));
  }

  Future<http.Response> getControllerDetails(int ctrID) async  {
    final prefs = await SharedPreferences.getInstance();
    userID = (prefs.getString('userId') ?? "0");
    return await http.get(Uri.parse("${baseURL}user/$userID/cluster/$ctrID/controller"));
  }

  Future<http.Response> getLogs(String ftDate) async  {
    final prefs = await SharedPreferences.getInstance();
    userID = (prefs.getString('userId') ?? "0");
    userGoupID = (prefs.getInt('userDeviceId') ?? 0);
    return await http.get(Uri.parse("${baseURL}user/$userID/subuser/0/controller/$userGoupID/report?fromDate=%27$ftDate%27&toDate=%27$ftDate%27&type=sendrevmsg"));
  }

  Future<http.Response> getZonsList(int prgNo) async  {
    final prefs = await SharedPreferences.getInstance();
    userID = (prefs.getString('userId') ?? "0");
    userGoupID = (prefs.getInt('userDeviceId') ?? 0);
    return await http.get(Uri.parse("${baseURL}user/$userID/subuser/0/controller/$userGoupID/zoneset/$prgNo"));
  }


}
