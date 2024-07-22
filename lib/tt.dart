
import 'package:flutter/material.dart';
import 'package:my_notification/notifications/noti_service.dart';

class tt extends StatelessWidget {
  const tt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (

      appBar: AppBar(),
      body: ListTile(
        onTap: (){
          LocalNotificationService.showBasicNotification();
        },
        trailing: IconButton(onPressed: (){}
        , icon: Icon(Icons.abc)),
      ),
    );
  }
}