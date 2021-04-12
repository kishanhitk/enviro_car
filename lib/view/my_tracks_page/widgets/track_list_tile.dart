import 'package:enviro_car/consts/colors.dart';
import 'package:enviro_car/models/track.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrackListTile extends StatefulWidget {
  TrackListTile({
    Key? key,
    required this.track,
  }) : super(key: key);

  final Track track;

  @override
  _TrackListTileState createState() => _TrackListTileState();
}

class _TrackListTileState extends State<TrackListTile> {
  late Duration duration = widget.track.end.difference(widget.track.begin);

  late String durationString = duration.inHours.toString() +
      ":" +
      duration.inMinutes.toString() +
      ":" +
      duration.inSeconds.toString();

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  final f = DateFormat('dd-MMM-yyyy').add_jm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15,
      ),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: 250,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                color: kThemeBlueColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Track ${f.format(widget.track.begin)}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: kGrey,
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            _printDuration(duration),
                            style:
                                TextStyle(color: kThemeBlueColor, fontSize: 25),
                          ),
                          Text("Duration")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${widget.track.length.truncate().toString()} km",
                            style:
                                TextStyle(color: kThemeBlueColor, fontSize: 25),
                          ),
                          Text("Distance")
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
