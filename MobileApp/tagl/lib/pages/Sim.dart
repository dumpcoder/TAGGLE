import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:tagl/utilities/AppColors.dart';
import 'package:tagl/utilities/FontStyles.dart';

import '../widgets/BlueButton.dart';

class Sim extends StatefulWidget {
  @override
  _SimState createState() => _SimState();
}

class _SimState extends State<Sim> {
  bool isRecording = false;
  LocalFileSystem localFileSystem;

  startRecording() async {
    await AudioRecorder.start(
        path: './sim.wav', audioOutputFormat: AudioOutputFormat.WAV);
    isRecording = await AudioRecorder.isRecording;
    setState(() {});
  }

  stopRecording() async {
    Recording recording = await AudioRecorder.stop();
    isRecording = await AudioRecorder.isRecording;
    print(
        "Path : ${recording.path},  Format : ${recording.audioOutputFormat},  Duration : ${recording.duration},  Extension : ${recording.extension},");
    setState(() {});
  }

  submitRecording() async{

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: AppColors.dashBoardGradiant,
                begin: Alignment(0, -1),
                end: Alignment(0, 1))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              alignment: Alignment(-1, 0),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 74,
              ),
            ),
            Text("1A. Samsung Galaxy S10", style: FontStyles.heading1),
            Container(
              height: 180,
              alignment: Alignment(0,0),
              child:
                    Icon(Icons.mic, size: 100, color: Colors.white),
            ),
            BlueButton(callback: submitRecording(), text: "Submit"),
        
            // Center(
            //   child: Container(
            //     child: IconButton(
            //       iconSize: 50,
            //       icon: isRecording
            //           ? Icon(Icons.stop)
            //           : Icon(
            //               Icons.fiber_manual_record,
            //               color: Colors.red,
            //             ),
            //       onPressed: isRecording ? stopRecording : startRecording,
                // ),
              // ),
            // )
          ],
        ),
      )),
    );
  }
}
