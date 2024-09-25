import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haksul/components.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar("오시는 길"),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 350,
                height: 350,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(37.5945328, 127.0548501),
                    zoom: 16,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId("경희고등학교"),
                      position: LatLng(37.5945328, 127.0548501),
                      infoWindow: InfoWindow(title: "경희고등학교"),
                    ),
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "서울특별시 동대문구 경희대로 26 경희고등학교",
                style: TextStyle(
                  fontFamily: "NanumSquare",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "지하철 이용시",
                    style: TextStyle(
                      fontFamily: "NanumSquare",
                      fontSize: 25,
                    ),
                  ),
                  Table(
                    border: TableBorder.all(width: 2),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(100),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      routeTableRow(
                          by: "지하철 1호선",
                          route:
                              "경의중앙선 회기역 1번 출구 하차 → 동대문02버스 탑승하여 경희중고 하차 → 도보 3분"),
                      routeTableRow(
                          by: "지하철 1호선",
                          route:
                              "경의중앙선 회기역 1번 출구 하차 → 동대문01버스 탑승하여 경희대의료원 하차 → 도보 5분"),
                      routeTableRow(
                          by: "지하철 1호선", route: "경의중앙선 회기역 1번 출구 하차 → 도보 15분")
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
