import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/background.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonArea,
            textViewSection,
          ],
        ),
      ),
    );
  }
}

// https://dev.classmethod.jp/smartphone/flutter_column_row_1/
Widget titleSection = Container(
  padding: const EdgeInsets.all(30),
  child: Row(
    /*
    Expandedウィジェット内にColumnを配置すると、
    その行の残りの空きスペースをすべて使用するようにColumnが引き伸ばされます。
    crossAxisAlignmentプロパティをCrossAxisAlignment.startに設定すると、
    列は行の先頭に配置されます。
     */
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*
            最初のテキスト行をコンテナ内に配置すると、パディングを追加できます。
            列の2番目の子、これもテキストですが、灰色で表示されます。
            */
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color:  Colors.green[500],
              ),
            ),
          ],
        ),
      ),
      /*
      タイトル行の最後の2つの項目は、赤く塗られた星型のアイコンとテキスト「41」です。
      行全体がコンテナ内にあり、各エッジに沿って32ピクセルずつ埋め込まれています。
      */
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41')
    ],
  ),
);


Widget buttonArea = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.blue[400], Icons.map, 'map'),
      _buildButtonColumn(Colors.blue[400], Icons.call, 'call'),
      _buildButtonColumn(Colors.blue[400], Icons.share, 'share'),
    ],
  ),
);

Widget _buildButtonColumn(Color color, IconData icon, String label) {

  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

Widget textViewSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);