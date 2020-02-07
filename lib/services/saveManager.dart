import 'package:shared_preferences/shared_preferences.dart';
class SaveManager{
  static SharedPreferences pref;

  static List<String> favorites;


  static String uid;

  static Map champions;

  SaveManager();

  static Future<void> init() async{
    pref = await SharedPreferences.getInstance();
  }

  static void _readFavorites(){
    favorites = pref.getStringList(uid) ?? List<String>();
  }

  static Future<void> removeAllFavorites() async{
    favorites.clear();
    await pref.setStringList(uid, favorites);
  }

  static void setUid(String userId){
    uid = userId;
    _readFavorites();
  }

  static Future<void> addFavorite(String id) async{
    favorites.add(id);
    await pref.setStringList(uid, favorites);
  }

  static Future<void> removeFavorite(String id) async{
    favorites.remove(id);
    await pref.setStringList(uid, favorites);
  }

  static bool readTheme(){
    return pref.getBool('isDark') ?? false;
  }

  static void writeTheme(bool isDark) async {
    await pref.setBool('isDark', isDark);
  }
}