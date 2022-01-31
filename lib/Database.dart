import 'dart:convert';
import 'package:e3/Models/classFile.dart';
import 'package:http/http.dart' as http;
import 'package:'
    'shared_preferences/shared_preferences.dart';

import 'Util.dart';

class Database {
  static String baseURL = "https://chocolata.in/";
  static Map<String, String> header = {"Content-Type": "application/json"};

  Database._();

  static late SharedPreferences pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static httpPost(String url, dynamic body) async {
    var res;
    if (body != null)
      res = await Future.any([
        http.post(Uri.parse(url), headers: header, body: body),
        Future.delayed(Duration(seconds: 5))
      ]);
    else
      res = await Future.any([
        http.post(Uri.parse(url), headers: header),
        Future.delayed(Duration(seconds: 5))
      ]);
    if (res == null) {
      Util.toast("Server Not Responding!");
      return "{}";
    } else if (res.statusCode == 200) return res.body;
  }

  static httpGet(String url) async {
    var res = await Future.any([
      http.get(Uri.parse(url), headers: header),
      Future.delayed(Duration(seconds: 5))
    ]);
    if (res == null) {
      Util.toast("Server Not Responding!");
      return "{}";
    }
    if (res.statusCode == 200) {
      return res.body;
    }
  }

  static Future<List<GenreDetails>> GetGenreList() async {
    List<GenreDetails> list = [];
    //TODO
    //${pref.getString(
    //             "masterId")}
    var data = await httpGet(baseURL + "video/getdropdownlistdata");
    data = jsonDecode(data);

    if (data["success"] == true && data["genreList"] is List)
      (data["genreList"] as List).forEach((s) {
        list.add(GenreDetails.fromJson(s));
      });
    return list;
  }

  static Future<List<VideoDetails>> GetVideos() async {
    List<VideoDetails> list = [];
    //TODO
    //${pref.getString(
    //             "masterId")}
    var data = await httpGet(baseURL + "video/GetAllVideos");
    data = jsonDecode(data);

    if (data["success"] == true && data["videodetails"] is List)
      (data["videodetails"] as List).forEach((s) {
        list.add(VideoDetails.fromJson(s));
      });
    return list;
  }

  static Future<List<VideoDetails>> GetSpecificVideo(int videoId) async {
    List<VideoDetails> list = [];

    var data = await httpPost(baseURL + "video/GetUniqueVideoDetails",
        jsonEncode({"videoId": videoId}));
    print(data);
    data = jsonDecode(data);
    if (data["success"] == true && data["videodetails"] is List)
      (data["videodetails"] as List).forEach((s) {
        list.add(VideoDetails.fromJson(s));
      });
    return list;
  }

  static Future<List<CasteDetails>> GetSpecificVideoCasting(int videoId) async {
    List<CasteDetails> list = [];

    var data = await httpPost(baseURL + "video/GetUniqueVideoDetails",
        jsonEncode({"videoId": videoId}));
    print(data);
    data = jsonDecode(data);
    if (data["success"] == true && data["castdetails"] is List)
      (data["castdetails"] as List).forEach((s) {
        list.add(CasteDetails.fromJson(s));
      });
    return list;
  }
}
