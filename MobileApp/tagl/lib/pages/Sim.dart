import 'dart:io';
import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tagl/pages/Evaluation.dart';
import 'package:tagl/utilities/AppColors.dart';
import 'package:tagl/utilities/FontStyles.dart';
import '../widgets/BlueButton.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter_uploader/flutter_uploader.dart';

class Sim extends StatefulWidget {
  @override
  _SimState createState() => _SimState();
}

class _SimState extends State<Sim> {
  bool isRecording = false;
  LocalFileSystem localFileSystem;
  Recording recording = Recording();
  File defaultAudioFile;
  String tempFilename = "audioFile.wav";

  startRecording() async {
    await AudioRecorder.start(
        path: './recording.wav', audioOutputFormat: AudioOutputFormat.WAV);
    isRecording = await AudioRecorder.isRecording;
    setState(() {});
  }

  stopRecording() async {
    recording = await AudioRecorder.stop();
    Directory directory = await getApplicationDocumentsDirectory();

    isRecording = await AudioRecorder.isRecording;
    print(
        "Path : ${recording.path},  Format : ${recording.audioOutputFormat},  Duration : ${recording.duration},  Extension : ${recording.extension},");

    setState(() {});
  }

  // submitRecording() async {
  //   if (recording == null) {
  //     return;
  //   } else if (isRecording) {
  //     stopRecording();
  //   }

  //   // print("aklsjdfhkasjfhkl");

  //   // final directory = await getApplicationDocumentsDirectory();

  //   // String recordingPath = recording.path.split("/")[1];

  //   // // print(directory.path);

  //   // File localFile = File('${directory.path}/$recordingPath');

  //   // print(localFile);

  //   // Read the file.

  //   File rf = localFile;

  //   var url = "http://tomas3torres.com:5000/wav-to-flac";

  //   http.MultipartFile multipartFile = http.MockMultipartFile("test.xlsx", new FileInputStream(new File("/home/admin/test.xlsx")));

  //   var stream = new http.ByteStream(DelegatingStream.typed(rf.openRead()));
  //   var length = await rf.length();
  //   var request = new http.MultipartRequest("POST", Uri.parse(url));
  //   var multipartFile = new http.MultipartFile(

  //   );
  //   request.files.add(multipartFile);
  //   request.send().then((response) async {
  //     String responseString = await response.stream.bytesToString();
  //     print(responseString);

  //     // Map<String, dynamic> responseJSON = jsonDecode(responseString);
  //     // String submission = responseJSON['submission'];

  //     print("THINGYYY");

  //     print(rf.path);
  //   });
  // }

  submitRecording() async {
    String url = "http://tomas3torres.com:5000/wav-to-flac";

    final uploader = FlutterUploader();

    final taskId = await uploader.enqueue(
        url: "your upload link", //required: url to upload to
        files: [
          FileItem(filename: "wavFile", savedDir: "savedDir", fieldname: "file")
        ], // required: list of files that you want to upload
        method: UploadMethod.POST, // HTTP method  (POST or PUT or PATCH)
        headers: {"apikey": "api_123456", "userkey": "userkey_123456"},
        data: {"name": "john"}, // any data you want to send in upload request
        showNotification:
            false, // send local notification (android only) for upload status
        tag: "upload 1"); // unique tag for upload task
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    alignment: Alignment(-1, 0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 74,
                      color: Colors.white,
                    )),
                Text("1A. Samsung Galaxy S10", style: FontStyles.heading1),
                Container(
                  height: 180,
                  alignment: Alignment(0, 0),
                  child: Icon(Icons.mic, size: 100, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: BlueButton(callback: submitRecording, text: "Submit"),
                ),
              ],
            ),

            Container(
              width: 1.0 / 0.0,
              height: 124,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28))),
              child: GestureDetector(
                onTap: isRecording ? stopRecording : startRecording,
                child: Center(
                  child: isRecording
                      ? Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 4)),
                          child: Center(
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 4)),
                            ),
                          ),
                        ),
                ),
              ),
            ),

            // Center(
            //   child: Container(
            // child: IconButton(
            //   iconSize: 50,
            //   icon: isRecording
            //       ? Icon(Icons.stop)
            //       : Icon(
            //           Icons.fiber_manual_record,
            //           color: Colors.red,
            //         ),
            //   onPressed: isRecording ? stopRecording : startRecording,
            // ),
            // ),
            // )
          ],
        ),
      )),
    );
  }
}
