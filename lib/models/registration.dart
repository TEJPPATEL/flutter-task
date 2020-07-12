class Registration {
  int _id;
  String _name;
  String _address;
  String _state;
  String _country;
  String _hobby;
  String _dob;
  String _image;

  Registration(this._name, this._address, this._state, this._country,
      this._hobby, this._dob, this._image);

  Registration.withId(this._id , this._name, this._address, this._state, this._country,
      this._hobby, this._dob, this._image);


  int getId() => _id;
  String get name => _name;
  String get address => _address;
  String get state=> _state;
  String get country => _country;
  String get hobby => _hobby;
  String get dob=> _dob;
  String get image => _image;

  set name(String newName) {
  _name = newName;
  }
  set address(String newAddress) {
  _address = newAddress;
  }
  set state(String newState) {
  _state =newState;
  }

  set country(String newCountry) {
    _country = newCountry;
  }

  set hobby(String newHobby){
    _hobby = newHobby;
  }

  set dob(String newDob)
  {
    _dob = newDob;
  }

  set image(String newImg)
  {
    _image = newImg;
  }

  Map<String,dynamic> toMap(){
    var map = Map<String , dynamic>();
    // if (id != null) {
      map['id'] = _id;
    // }
    // map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map["state"] = _state;
    map["country"] = _country; 
    map["hobby"] = _hobby;
    map["dob"] = _dob;
    map["image"] = _image;
    return map;
  }

  Registration.fromObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._address = map['address'];
    this._state = map['state'];
    this._country = map['country'];
    this._hobby = map['hobby'];
    this._dob = map['dob'];
    this._image = map['image'];
  }


}
