import 'package:flutter/material.dart';

import '../widgets/detail/detail_mobile.dart';
import '../widgets/detail/detail_desktop.dart';

class DetailController extends StatefulWidget {
  static const routeName = '/detail';

  const DetailController({Key? key}) : super(key: key);

  @override
  _DetailControllerState createState() => _DetailControllerState();
}

class _DetailControllerState extends State<DetailController> {
  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    List<Widget> abilitiesRows() {
      final List<Widget> rows = [];
      for (int rowIndex = 0;
          rowIndex < arguments['pokemon'].abilities.length;
          rowIndex++) {
        rows.add(SizedBox(
          width: double.infinity,
          child: Text(
            arguments['pokemon'].abilities[rowIndex],
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.left,
          ),
        ));
      }
      return rows;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['pokemon'].name),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth < 600) {
              return DetailMobile(arguments: arguments);
            } else {
              return DetailDesktop(arguments: arguments);
            }
          }),
        ),
      ),
    );
  }
}
