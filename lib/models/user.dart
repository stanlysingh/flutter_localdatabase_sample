class User {
  String mfullname;
  String mfirstname;
  String mstorename;
  String mbusinesstype;
  String mstore;
  String mlicensenumber;
  String maddress;
  String mnumber;
  String mmail;
  String mpassword;
  String mconfirmpass;
  String mpayment;

  User();

  /*User(
      this.mfullname,
      this.mfirstname,
      this.mstorename,
      this.mbusinesstype,
      this.mstore,
      this.mlicensenum,
      this.maddress,
      this.mnumber,
      this.mmail,
      this.mpassword,
      this.mconfirmpass,
      this.mpayment,
      this.mflaglogged);*/

  User.map(dynamic obj) {
    this.mfullname = obj['fullname'];
    this.mfirstname = obj['firstname'];
    this.mstorename = obj['storename'];
    this.mbusinesstype = obj['businesstype'];
    this.mstore = obj['store'];
    this.mlicensenumber = obj['licensenumber'];
    this.maddress = obj['address'];
    this.mnumber = obj['number'];
    this.mmail = obj['mail'];
    this.mpassword = obj['password'];
    this.mconfirmpass = obj['confirmpass'];
    this.mpayment = obj['payment'];
  }

  String get fullname => mfullname;
  String get firstname => mfirstname;
  String get storename => mstorename;
  String get businesstype => mbusinesstype;
  String get store => mstore;
  String get licensenumber => mlicensenumber;
  String get address => maddress;
  String get number => mnumber;
  String get mail => mmail;
  String get password => mpassword;
  String get confirmpass => mconfirmpass;
  String get payment => mpayment;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["fullname"] = mfullname;
    map["firstname"] = mfirstname;
    map["storename"] = mstorename;
    map["businesstype"] = mbusinesstype;
    map["store"] = mstore;
    map["licensenumber"] = mlicensenumber;
    map["address"] = maddress;
    map["number"] = mnumber;
    map["mail"] = mmail;
    map["password"] = mpassword;
    map["confirmpass"] = mconfirmpass;
    map["payment"] = mpayment;
    return map;
  }
}
