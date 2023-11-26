class ResCallRequestModel {
  var id;
  var appid;
  var appsign;
  String? channel;
  String? token;
  String? name;
  String? othername;

  ResCallRequestModel({this.id, this.channel, this.token, this.name, this.othername, this.appid, this.appsign});

  ResCallRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channel = json['channel'];
    token = json['token'];
    name = json['name'];
    othername = json['othername'];
    appid = json['appid'];
    appsign = json['appsign'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'channel': channel,
        'token': token,
        'name': name,
        'othername': othername,
        'appid': appid,
        'appsign': appsign,
      };
}
