import 'package:classify_traffic_sign/app_screens/traffic_sign_details.dart';
import 'package:classify_traffic_sign/model/traffic_signs.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './top_bar.dart';
import './traffic_signs_list.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;
  final picker = ImagePicker();
  var resultPredict="No Answer";
  var showResult = "";

  _openGallery(BuildContext context) async{
    var picture = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async{
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  //upload image
  doUpload(File image) async{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://192.168.1.8:5000/predict"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'file',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: "filename",
        contentType: MediaType('image', 'png'),
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    request.send().then((value) => {
      handleThisResponse(value)
    });
  }

  handleThisResponse(StreamedResponse value ) async {
    var result = await value.stream.bytesToString();
    this.setState(() {
      resultPredict = result;
    });
  }

  //format result to show
  _formatResult(){
    if(resultPredict.length > 25){
      return showResult = resultPredict.substring(0,23)+"...";
    }
    return resultPredict;
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a Choice!",
          style: TextStyle(fontSize: 25, color: Colors.black),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.collections_sharp,
                      color: Colors.blueAccent,
                    ),
                  ),
                  GestureDetector(
                    child: Text("Gallery",
                      style: TextStyle(fontSize: 20, color: Colors.black),),
                    onTap: (){
                      _openGallery(context);
                    },
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.blueAccent,
                    ),
                  ),
                  GestureDetector(
                    child: Text("Camera",
                      style: TextStyle(fontSize: 20, color: Colors.black),),
                    onTap: (){
                      _openCamera(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _decideImageView(){
    if(imageFile == null){
      return NoImageAsset();
    } else{
      //return Image.file(imageFile, width: 400.0, height: 400.0);
      return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.black12, width: 5),
        ),
        child: Image.file(imageFile, width: 350.0, height: 350.0),);
    }
  }

  _decidePushScreen(){
    for(int i = 0; i < trafficSignsList.length; i++){
      if(resultPredict.toLowerCase() == trafficSignsList[i].title.toLowerCase()){
        return TrafficSignDetails(trafficSignsList[i]);
        }
    }
    return TrafficSignsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Sign Classification"),
      ),
      body:  Stack(
          children: <Widget>[
            Container(
              child: TopBar(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _decideImageView(),
               Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     Center(
                       child: IconButton(
                         onPressed: () {
                           _showChoiceDialog(context);
                         },
                         splashColor: Colors.cyan,
                         color: Colors.blue,
                         icon: Icon(
                           Icons.add_photo_alternate,
                         ),
                         iconSize: 70.0,
                         tooltip: "Add a photo",
                       ),
                     ),
                     Center(
                       child: IconButton(
                         onPressed: () {
                           doUpload(imageFile);
                         },
                         splashColor: Colors.cyan,
                         color: Colors.blue,
                         icon: Icon(
                           Icons.batch_prediction_outlined,
                         ),
                         iconSize: 70.0,
                         tooltip: "Predict Image",
                       ),
                     ),
                     Center(
                       child: IconButton(
                         onPressed: () {
                           Navigator.of(context)
                               .push(
                             MaterialPageRoute(
                                 builder: (context) => TrafficSignsList()
                             )
                           );
                         },
                         splashColor: Colors.cyan,
                         color: Colors.blue,
                         icon: Icon(
                           Icons.library_books,
                         ),
                         iconSize: 70.0,
                         tooltip: "More Information",
                       ),
                     )
                   ],
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Center(
                      child: Expanded(
                        child: Text(_formatResult(),
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                              MaterialPageRoute(
                                  builder: (context) => _decidePushScreen()
                              )
                          );
                        },
                        splashColor: Colors.cyan,
                        color: Colors.black,
                        icon: Icon(
                          Icons.search,
                        ),
                        iconSize: 50.0,
                        tooltip: "Search Traffic Sign",
                      ),
                    )
                  ],
                )
              ],
            )
          ]
        ),
      );
  }
}

class NoImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/no-image-icon.png');
    Image image = Image(image: assetImage, width: 350.0, height: 350.0,);
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.black12, width: 5),
      ),
      child: image,);
  }
}

