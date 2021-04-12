import 'package:enviro_car/view/my_tracks_page/widgets/track_list_tile.dart';
import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/models/track.dart';
import 'package:enviro_car/models/track_list.dart';
import 'package:enviro_car/services/tracks/track_services.dart';
import 'package:flutter/material.dart';

class MyTrackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kThemeBlueColor,
        title: SizedBox(
          height: 30,
          child: Image.asset(
            'assets/img_envirocar_logo_white.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: TrackServices().getAllTracks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                TrackList trackList = snapshot.data;
                return ListView.builder(
                    itemCount: trackList.tracks.length,
                    itemBuilder: (c, i) {
                      final Track track = trackList.tracks[i];
                      return TrackListTile(track: track);
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
