class ResCallAcceptModel {
  String? channel;
  String? token;
  String? name;
  String? othername;
  var id;
  var otherUserId;
  var appid;
  var appsign;

  ResCallAcceptModel({this.channel, this.token, this.name, this.othername, this.id, this.otherUserId, this.appid, this.appsign});

  ResCallAcceptModel.fromJson(Map<String, dynamic> json) {
    channel = json['channel'];
    token = json['token'];
    name = json['name'];
    othername = json['othername'];
    id = json['id'];
    appid = json['appid'];
    appsign = json['appsign'];
    otherUserId = json['otherUserId'];
  }

  Map<String, dynamic> toJson() => {
        'channel': channel,
        'token': token,
        'name': name,
        'name': name,
        'othername': othername,
        'id': id,
        'otherUserId': otherUserId,
        'appid': appid,
        'appsign': appsign,
      };
}
