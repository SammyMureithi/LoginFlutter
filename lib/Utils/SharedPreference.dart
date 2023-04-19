import 'package:shared_preferences/shared_preferences.dart';

class AppConstanst {
  /**
   *  {ok: true, status: success, message: Successfully logged in., user: {id: 1,
   *  name: Kenya Seed1, username: mm, phone: 0712345678, 
   * email: e@m.com, verified: false, role: null},
   *  accessToken: 32|lWUAtcBB6KevYW0wrfVaTHhygK6sBznDCmctvkQ3}
   */

  Future<int?> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("id");
  }

  Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  Future<String?> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("phone");
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  Future<String?> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("role");
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("accessToken");
  }
}
