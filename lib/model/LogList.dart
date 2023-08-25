class LogList
{
  LogList({
    this.status = '',
    this.date = '',
    this.time = '',
    this.msgType = '',
    this.ctrlMsg = '',
    this.ctrlDesc = '',
  });

  String status, date, time, msgType, ctrlMsg, ctrlDesc;

  factory LogList.fromJson(Map<String, dynamic> json) => LogList(
    status: json['status'],
    date: json['date'],
    time: json['time'],
    msgType: json['msgType'],
    ctrlMsg: json['ctrlMsg'],
    ctrlDesc: json['ctrlDesc'],
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'date': date,
    'time': time,
    'msgType': msgType,
    'ctrlMsg': ctrlMsg,
    'ctrlDesc': ctrlDesc,
  };
}