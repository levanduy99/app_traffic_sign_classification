import 'dart:convert';
import 'dart:io';
import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;
  final picker = ImagePicker();
  var resultPredict;

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
      Uri.parse("http://192.168.1.6:5000/predict"),
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
    resultPredict = result;
    return resultPredict;
  }


  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Make a Choice!"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
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
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 3),
        ),
        child: Image.file(imageFile, width: 400.0, height: 400.0),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Sign Classification"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(onPressed: (){
                _showChoiceDialog(context);
              },child: Text("Select Image!"),),
              RaisedButton(onPressed: (){
                //write function
                doUpload(imageFile);
              }, child: Text("Predict"),),
              Center(
                child: Text("$resultPredict",
                  style: TextStyle(fontSize: 30, color: Colors.blue),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // handleThisResponse(StreamedResponse value ) async {
  //   var result = await value.stream.bytesToString();
  //   print(result);
  //   return result;
  // }
}

class NoImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/no-image-icon.png');
    Image image = Image(image: assetImage, width: 400.0, height: 400.0,);
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 3),
      ),
      child: image,);
  }
}

