import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:provider/provider.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../providers/venues_provider.dart';
// import '../../widgets/venues/venue/logo.dart';
// import '../../widgets/events/blocks.dart';
// import '../../widgets/shared/detail_social_networks.dart';
// import '../../constants/ux.dart';

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
              return ListView(children: [
                Container(
                  padding: EdgeInsets.only(left: 100, right: 100),
                  child: Image.network(
                    arguments['pokemon'].image,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Id: ${arguments['pokemon'].id}',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Altura: ${arguments['pokemon'].height}',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Peso: ${arguments['pokemon'].weight}',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Abilidades',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(children: abilitiesRows()),
                )
              ]);
            } else {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(left: 100, right: 100),
                          child: Image.network(
                            arguments['pokemon'].image,
                            width: 200,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Id: ${arguments['pokemon'].id}',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Altura: ${arguments['pokemon'].height}',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Peso: ${arguments['pokemon'].weight}',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Abilidades',
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(children: abilitiesRows()),
                        )
                      ]),
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
