import 'dart:convert';


class WeatherAlertDto {
  final String senderName;
  final String event;
  final int start;
  final int end;
  final String description;
   WeatherAlertDto({
    required this.senderName,
    required this.event,
    required this.start,
    required this.end,
    required this.description,
   });

  WeatherAlertDto copyWith({
    String? senderName,
    String? event,
    int? start,
    int? end,
    String? description,
   }) {
    return WeatherAlertDto(
      senderName: senderName ?? this.senderName,
      event: event ?? this.event,
      start: start ?? this.start,
      end: end ?? this.end,
      description: description ?? this.description,
     );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender_name': senderName,
      'event': event,
      'start': start,
      'end': end,
      'description': description,
     };
  }

  factory WeatherAlertDto.fromMap(Map<String, dynamic> map) {
    return WeatherAlertDto(
      senderName: map['sender_name'] as String,
      event: map['event'] as String,
      start: map['start'] as int,
      end: map['end'] as int,
      description: map['description'] as String,
     );
  }

  String toJson() => json.encode(toMap());

  factory WeatherAlertDto.fromJson(String source) => WeatherAlertDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherAlertDto(senderName: $senderName, event: $event, start: $start, end: $end, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WeatherAlertDto &&
      other.senderName == senderName &&
      other.event == event &&
      other.start == start &&
      other.end == end &&
      other.description == description;
  }

  @override
  int get hashCode {
    return senderName.hashCode ^
      event.hashCode ^
      start.hashCode ^
      end.hashCode ^
      description.hashCode;
  }
}
