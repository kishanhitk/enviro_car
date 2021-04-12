import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:enviro_car/models/track.dart';

class TrackList {
  List<Track> tracks = [];
  TrackList({
    required this.tracks,
  });

  TrackList copyWith({
    List<Track>? tracks,
  }) {
    return TrackList(
      tracks: tracks ?? this.tracks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tracks': tracks.map((x) => x.toMap()).toList(),
    };
  }

  factory TrackList.fromMap(Map<String, dynamic> map) {
    return TrackList(
      tracks: List<Track>.from(map['tracks']?.map((x) => Track.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackList.fromJson(String source) =>
      TrackList.fromMap(json.decode(source));

  @override
  String toString() => 'TrackList(tracks: $tracks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackList && listEquals(other.tracks, tracks);
  }

  @override
  int get hashCode => tracks.hashCode;
}
