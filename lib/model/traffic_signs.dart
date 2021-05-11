import 'package:flutter/material.dart';

class TrafficSigns {
  String title;
  String description;
  String imageUrl;

  TrafficSigns(
    {@required this.title,
    @required this.description,
    @required this.imageUrl});
}

List<TrafficSigns> trafficSignsList = [
  TrafficSigns(title: "Tốc độ tối đa cho phép 20km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
      "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
      "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://images-eu.ssl-images-amazon.com/images/I/61Dl9EnISzL.__AC_SX300_SY300_QL70_ML2_.jpg"),
  TrafficSigns(title: "Tốc độ tối đa cho phép 30km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Italian_traffic_signal_-_maximum_speed_limit_30_km_per_h.png"),
  TrafficSigns(title: "Tốc độ tối đa cho phép 50km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/61Eas1VfZYL._AC_SL1500_.jpg"),
  TrafficSigns(title: "Tốc độ tối đa cho phép 60km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/61VvIggG%2B3L._AC_SL1500_.jpg"),
  TrafficSigns(title: "Tốc độ tối đa cho phép 70km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://media.istockphoto.com/photos/deutsches-verkehrszeichen-geschwindigkeitsbegrenzung-70-kmh-picture-id1002295454?k=6&m=1002295454&s=170667a&w=0&h=v697mR652STDxJnj7c7fJPL0EphoZHyZuBcqAv9sHZk="),
  TrafficSigns(title: "Tốc độ tối đa cho phép 80km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/c/cd/Australian_Speed_Limit_80_FINAL.png"),
  TrafficSigns(title: "Tốc độ tối đa cho phép 100km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://nelsonsigns.co.nz/wp-content/uploads/2015/06/speed-limit-100kmh.jpg"),
  TrafficSigns(title: "Tốc độ tối đa cho phép 120km/h",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. " +
          "Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối " +
          "đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://www.pdsigns.ie/contentFiles/productImages/Large/RUS_039.jpg"),
];