/*
eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1NmM3NDcxNGVhNDMwNWEzODJjZjcxOGEyYmQ0NGQ2MjM5MDlmN2RmNWMyYmRmMTkyYjVhM2RmZjI1MjRjMzE4ZjI2ZTUwM2Q5Nzk5OGViIn0.eyJhdWQiOiIyIiwianRpIjoiNjU2Yzc0NzE0ZWE0MzA1YTM4MmNmNzE4YTJiZDQ0ZDYyMzkwOWY3ZGY1YzJiZGYxOTJiNWEzZGZmMjUyNGMzMThmMjZlNTAzZDk3OTk4ZWIiLCJpYXQiOjE2Njg5MzM1NDksIm5iZiI6MTY2ODkzMzU0OSwiZXhwIjoxNzAwNDY5NTQ5LCJzdWIiOiIyMjcyIiwic2NvcGVzIjpbXX0.B44Bwu_2_zTYZ24SOzhGN6wJ05g6vmdumRqX2BHTrvSVRP6-gpFE--lRPiVvMooEg9h1EjI2TWggwPWguX0mQ9fEzRTk_r0Lmuc5fgXPH615NJAerTFAV_ON7yY8B2hXeczffqwV5jRcUIe05AeDExVz3S5p2REgJgdq0hK0fqkrQOuRyrjQjOkb8jkBe9NEgFNvPs9-vyE8eetQ1BHp-LqkYa2-jHcC40w37hfqSKVO9z9KSrWHEM_OiaBubJSY0ljTLT95IKJKEaLwb2jEzmGQYLyrmXr3NLG2Tu3iMEh-f3K_KZF2Wm2KskyORDD6zIjPzZuXs5CNMHOP7Ay6BNo8iHU5y5Bqfwu17f22YnZbeAfB8wZvAXOOSJpOPMjP6OkXjTKblNGK4bDz6l_UNW2DF6yhH_bKX-jfX1ZMXVU2FVdBkDRwWZMecXRNuLY7ofH8RJnA5AL6Zmsz1euS6723Q5sMKOHuzbVFHJ8VbB3mWezYdh2PeZPMK7P1bKlJ9xGFTh2WXWLp5nae6zp-msG8KcJt28r1jeW-yFjYBBOE7Tfby1o6O5xnd1zc0qEAOh0VY-6pBE3Cz-RfcpyvjKf9Z-X6ySIi2DfabDDctJN6STIUnDYTWYLwFuHoo7yhS38G4hOECpO99n3cnkDElqZ3KsTte-v1RTKqL2dk0OU
*/
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
 const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
 const token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1NmM3NDcxNGVhNDMwNWEzODJjZjcxOGEyYmQ0NGQ2MjM5MDlmN2RmNWMyYmRmMTkyYjVhM2RmZjI1MjRjMzE4ZjI2ZTUwM2Q5Nzk5OGViIn0.eyJhdWQiOiIyIiwianRpIjoiNjU2Yzc0NzE0ZWE0MzA1YTM4MmNmNzE4YTJiZDQ0ZDYyMzkwOWY3ZGY1YzJiZGYxOTJiNWEzZGZmMjUyNGMzMThmMjZlNTAzZDk3OTk4ZWIiLCJpYXQiOjE2Njg5MzM1NDksIm5iZiI6MTY2ODkzMzU0OSwiZXhwIjoxNzAwNDY5NTQ5LCJzdWIiOiIyMjcyIiwic2NvcGVzIjpbXX0.B44Bwu_2_zTYZ24SOzhGN6wJ05g6vmdumRqX2BHTrvSVRP6-gpFE--lRPiVvMooEg9h1EjI2TWggwPWguX0mQ9fEzRTk_r0Lmuc5fgXPH615NJAerTFAV_ON7yY8B2hXeczffqwV5jRcUIe05AeDExVz3S5p2REgJgdq0hK0fqkrQOuRyrjQjOkb8jkBe9NEgFNvPs9-vyE8eetQ1BHp-LqkYa2-jHcC40w37hfqSKVO9z9KSrWHEM_OiaBubJSY0ljTLT95IKJKEaLwb2jEzmGQYLyrmXr3NLG2Tu3iMEh-f3K_KZF2Wm2KskyORDD6zIjPzZuXs5CNMHOP7Ay6BNo8iHU5y5Bqfwu17f22YnZbeAfB8wZvAXOOSJpOPMjP6OkXjTKblNGK4bDz6l_UNW2DF6yhH_bKX-jfX1ZMXVU2FVdBkDRwWZMecXRNuLY7ofH8RJnA5AL6Zmsz1euS6723Q5sMKOHuzbVFHJ8VbB3mWezYdh2PeZPMK7P1bKlJ9xGFTh2WXWLp5nae6zp-msG8KcJt28r1jeW-yFjYBBOE7Tfby1o6O5xnd1zc0qEAOh0VY-6pBE3Cz-RfcpyvjKf9Z-X6ySIi2DfabDDctJN6STIUnDYTWYLwFuHoo7yhS38G4hOECpO99n3cnkDElqZ3KsTte-v1RTKqL2dk0OU';
 try {
  Position location = await getCurrentLocation();
  http.Response response = await http.get(
  Uri.parse('$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'), 
  headers: {
    'accept': 'application/json',
    'authorization': 'Bearer $token',
  }
);
if(response.statusCode == 200) {
 var result = jsonDecode(response.body)['WeatherForecasts'][0]['forecasts'][0]['data'];
 Placemark address = (await placemarkFromCoordinates(location.latitude, location.longitude)).first;
 return Weather(
  address: '${address.subLocality}\n${address.administrativeArea}',
  temperature: result['tc'],
  cond: result['cond'],
);
} else {
return Future.error(response.statusCode);
}
} catch (e) {
return Future.error(e);
}
}