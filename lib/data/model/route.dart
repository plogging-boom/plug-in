class PlugInRoute {
  String _imageUrl;
  double _distance;
  String _ploggingDate;
  String _createdDate;
  String _backgrounColor;
  String _middleColor;
  String? _rid;

  PlugInRoute(
      {String? rid,
      String? id,
      required String imageUrl,
      required double distance,
      required String ploggingDate,
      required String createdDate,
      required String backgroundColor,
      required String middleColor})
      : _rid = rid,
        _imageUrl = imageUrl,
        _distance = distance,
        _ploggingDate = ploggingDate,
        _createdDate = createdDate,
        _backgrounColor = backgroundColor,
        _middleColor = middleColor;

  get rid => _rid;
  get imageUrl => _imageUrl;
  get distance => _distance;
  get backgroundColor => _backgrounColor;
  get middleColor => _middleColor;
  get ploggingDate => _ploggingDate;
  get createdDate => _createdDate;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'imageUrl': _imageUrl,
      'distance': _distance,
      'ploggingDate': _ploggingDate,
      'createdDate': _createdDate,
      'backgroundColor': _backgrounColor,
      'middleColor': _middleColor,
    };
    if (_rid != null) map['rid'] = _rid;
    return map;
  }

  factory PlugInRoute.fromMap(Map<String, dynamic> map, String id) {
    return PlugInRoute(
        rid: id,
        imageUrl: map['imageUrl'] as String,
        distance: map['distance'] as double,
        ploggingDate: map['ploggingDate'] as String,
        createdDate: map['createdDate'] as String,
        backgroundColor: map['backgroundColor'] as String,
        middleColor: map['middleColor'] as String);
  }
}

class Memo {
  String? _id;
  late String _value;

  String get value => _value;
  String get id => _id!;

  set value(String value) {
    _value = value;
  }

  Memo({String? id, required String value}) {
    _id = id;
    _value = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "memo": _value,
    };
    return map;
  }

  factory Memo.fromMap(Map<String, dynamic> map, String id) {
    return Memo(
      id: id,
      value: map["memo"],
    );
  }
}
