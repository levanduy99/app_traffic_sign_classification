import 'package:flutter/material.dart';

class TrafficSigns {
  final id;
  final String title;
  final String description;
  final String imageUrl;

  TrafficSigns({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl});
}

final trafficSignsList = <TrafficSigns>[
  TrafficSigns(
      id: 0,
      title: "Tốc độ tối đa cho phép (20km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://images-eu.ssl-images-amazon.com/images/I/61Dl9EnISzL.__AC_SX300_SY300_QL70_ML2_.jpg"),
  TrafficSigns(
      id: 1,
      title: "Tốc độ tối đa cho phép (30km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Italian_traffic_signal_-_maximum_speed_limit_30_km_per_h.png"),
  TrafficSigns(
      id: 2,
      title: "Tốc độ tối đa cho phép (50km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/61Eas1VfZYL._AC_SL1500_.jpg"),
  TrafficSigns(
      id: 3,
      title: "Tốc độ tối đa cho phép (60km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://images-na.ssl-images-amazon.com/images/I/61VvIggG%2B3L._AC_SL1500_.jpg"),
  TrafficSigns(
      id: 4,
      title: "Tốc độ tối đa cho phép (70km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://ae01.alicdn.com/kf/HTB1KHHHXhD1gK0jSZFyq6AiOVXaj/CK2662-16-16-Cm-Gi-i-H-n-T-c-70Km-M-t-Gi-Ng.jpg_q50.jpg"),
  TrafficSigns(
      id: 5,
      title: "Tốc độ tối đa cho phép (80km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/c/cd/Australian_Speed_Limit_80_FINAL.png"),
  TrafficSigns(
      id: 6,
      title: "Hạn chế tốc độ tối đa (80km/h)",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 7,
      title: "Tốc độ tối đa cho phép (100km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVYRWPAM7jbTZiPgOGsZN2_r_XTHYB7kT_RcfjDKQdazpk9lpZECOhEIqOBKN6NHuRTpY&usqp=CAU"),
  TrafficSigns(
      id: 8,
      title: "Tốc độ tối đa cho phép (120km/h)",
      description: "Để báo tốc độ tối đa cho phép các xe cơ giới chạy. Biển báo có hiệu lực cấm các loại xe cơ giới chạy với tốc độ tối đa vượt quá giá trị số ghi trên biển trừ các xe được ưu tiên theo quy định",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8UycZXrJ40UNXsQv09VXmprKv0CcrsuIzP5wf8q7SCvo0G8bjuKNCU3iYElAv_F9876g&usqp=CAU"),
  TrafficSigns(
      id: 9,
      title: "Cấm vượt",
      description: "Để báo cấm các loại xe cơ giới vượt nhau. Biển báo có hiệu lực cấm tất cả các loại xe cơ giới vượt nhau (kể cả xe được ưu tiên theo quy định).",
      imageUrl: "https://www.signs-tdc.com/thumb_product/2297/456/500/0/sf_b25.jpg"),
  TrafficSigns(
      id: 10,
      title: "Cấm phương tiện quá có trọng lượng 3.5 tấn",
      description: "",
      imageUrl: "https://c8.alamy.com/comp/HTA043/norwegian-regulatory-road-sign-no-vehicles-over-35-tons-HTA043.jpg"),
  TrafficSigns(
      id: 11,
      title: "Giao nhau với đường không ưu tiên",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 12,
      title: "Đường ưu tiên",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 13,
      title: "Nhường đường",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 14,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 15,
      title: "Cấm phương tiện",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 16,
      title: "Cấm phương tiện trên 3.5 tấn",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 17,
      title: "Cấm đi ngược chiều",
      description: "Để báo đường cấm các loại xe (cơ giới và thô sơ) đi vào theo chiều đặt biển, trừ các xe được ưu tiên theo quy định. Người đi bộ được phép đi trên vỉa hè hoặc lề đường bên phải.",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Road-sign-no-entry.svg/600px-Road-sign-no-entry.svg.png"),
  TrafficSigns(
      id: 17,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
  TrafficSigns(
      id: 6,
      title: "Stop",
      description: "",
      imageUrl: ""),
];