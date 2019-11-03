import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';

class Sim extends StatefulWidget {  
  @override
  _SimState createState() => _SimState();
}

class _SimState extends State<Sim> {
  bool isRecording = false;
  LocalFileSystem localFileSystem;

  startRecording() async{
    await AudioRecorder.start(path: './sim.wav', audioOutputFormat: AudioOutputFormat.WAV);
    isRecording = await AudioRecorder.isRecording;
    setState((){});
  }

  stopRecording() async{
    Recording recording = await AudioRecorder.stop();
    isRecording = await AudioRecorder.isRecording;
    print("Path : ${recording.path},  Format : ${recording.audioOutputFormat},  Duration : ${recording.duration},  Extension : ${recording.extension},");
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simulation'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  child: IconButton(
                    iconSize: 50,
                    icon: isRecording? Icon(Icons.stop):Icon(Icons.fiber_manual_record, color: Colors.red,),
                    onPressed: isRecording? stopRecording: startRecording,
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}