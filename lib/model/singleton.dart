class Singleton {

  static Singleton _instance;

  Singleton._internal();

  factory Singleton.getInstance() => _getInstance();

  static _getInstance() {
    if(_instance == null) {
      _instance = Singleton._internal();
    }
    return _instance;
  }

}