import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Axcora Apps',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Man of the ART'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text('creativebydre.vercel.app'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 3,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 40,
        ),
      ),

      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 150,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  Item(
    "https://1.bp.blogspot.com/-p86avZVe-kY/YLcDtL5IOPI/AAAAAAAAOWM/vcScngT73SEzKaBpHROW6qEUKUp3PbslACLcBGAsYHQ/s782/10423260_10203961991951099_7409218111643902262_n%2B-%2BCopy.jpg",
    "Cha & Bear",
  ),
  Item(
    "https://1.bp.blogspot.com/-ioVaaIddIqs/YLcD0ww34tI/AAAAAAAAOXk/9RTdBvWLyUERqKLsV4QQ5NSPJ4wqG3QjACLcBGAsYHQ/s960/13641057_10206941690881710_3236102612660253068_o.jpg",
    "Queen Nop",
  ),
  Item(
    "https://1.bp.blogspot.com/-OpMZ_o4jHAw/YLcDtNa1HrI/AAAAAAAAOWI/8j6RM6WqhXkD1Pk4D_zVaBOM7ygSAOYQwCLcBGAsYHQ/s960/10394094_10203991845737425_2854924252224985100_n.jpg",
    "Rockers !!",
  ),
  Item(
    "https://1.bp.blogspot.com/-eDvKZrcCJ7c/YLcD1PnJOhI/AAAAAAAAOXs/LLbd2BZOF0MKTDV3SN1QGkR4e1BIAcGKACLcBGAsYHQ/s960/14054551_10207051178218825_8602650237562101769_o.jpg",
    "Ben Dolls",
  ),
  Item(
    "https://1.bp.blogspot.com/-dzsWXd3j-WU/YLcDwTnJyvI/AAAAAAAAOW0/X4CoJvho17Mt9Vc65O210R4vNxHosa6IgCLcBGAsYHQ/s960/12593783_10206000196624942_9050616884091398150_o.jpg",
    "Djoker",
  ),
  Item(
    "https://1.bp.blogspot.com/-_y2voGxKyR0/YLcDuRcgUTI/AAAAAAAAOWY/PH1r2rvYvs8gEUH_T51ljBLIZjX5_sdoQCLcBGAsYHQ/s960/11193409_10204127294603562_2875561234130979445_n.jpg",
    "Funn",
  ),
  Item(
    "https://1.bp.blogspot.com/-BqA6OVEnGhM/YLfgqIKvAvI/AAAAAAAAO0w/KfKXvPFB8NAY6b3E6rTcyKBNv4XAtGfsgCLcBGAsYHQ/s2048/11057395_10205324039081426_2477446517368751830_o.jpg",
    "Ambyar",
  ),
  Item(
    "https://1.bp.blogspot.com/-Pt7PeID56KY/YLfgs9dwVfI/AAAAAAAAO1Q/Aq1mfEqj9OQ9DAVNvN4tlxibHZsp44oYACLcBGAsYHQ/s960/12377665_10205391053156736_180768716340258921_o.jpg",
    "Prambanan Queen",
  ),
  Item(
    "https://1.bp.blogspot.com/-Mgj1en3nK14/YLfgsDhi5cI/AAAAAAAAO1I/APMIWvFxPOIYqMq52BYh4tSsOf8MmdHzwCLcBGAsYHQ/s2048/12238414_10205227340864031_778181118159969280_o.jpg",
    "Nonik Belanda",
  ),
  Item(
    "https://1.bp.blogspot.com/-vQSkynvNu1A/YLfgt6vKNvI/AAAAAAAAO1Y/U4sy9HyqBpg6p_IKgUOnNUmZvV-5xeDuACLcBGAsYHQ/s2048/12628357_10205615757294199_3287859292085175463_o.jpg",
    "Miss Tery",
  ),
  Item(
    "https://1.bp.blogspot.com/-ij-NFADGqdk/YLfg4scck_I/AAAAAAAAO3U/d3MLr5KhWe4xWR6mnSqh5hsVFgH2z-6GQCLcBGAsYHQ/s960/886934_10205963623110627_6134047726902412121_o.jpg",
    "Dark Queen",
  ),
  Item(
    "https://1.bp.blogspot.com/-BxF2nvnyFgM/YLfgquokTKI/AAAAAAAAO00/BOtQVIbgqOM07AbTs-gwuILS7uIt4kEsgCLcBGAsYHQ/s960/11222601_10205275817115907_6015660095802664155_o.jpg",
    "The Godong",
  ),
  Item(
    "https://1.bp.blogspot.com/-GF-bDnEgUEo/YLfgpqkvo5I/AAAAAAAAO0o/DX_TxEA8fG050iGVdv9VQR0FCb_DPHj4QCLcBGAsYHQ/s1500/10998893_10203759287723620_1103356185496760963_o.jpg",
    "Silence Grave",
  ),
  Item(
    "https://1.bp.blogspot.com/-5qBv3dYfyUU/YLfgw1eNybI/AAAAAAAAO14/IM7Yct45Ickl8klvnq5K6-JZPu3gSrD4QCLcBGAsYHQ/s960/13912328_10207051180018870_6062311790468297098_n.jpg",
    "Dhurga",
  ),
  Item(
    "https://1.bp.blogspot.com/-PpAPAPBxQlU/YLfgzx5M5yI/AAAAAAAAO2Y/l9SSHDMATAkpbWixtDxwlpyJZ2yTdA9IgCLcBGAsYHQ/s2048/20863316_10210162091189705_8698226943045654489_o.jpg",
    "Snow Queen",
  ),
  Item(
    "https://1.bp.blogspot.com/--VDzC31e88w/YLfg1vat32I/AAAAAAAAO2w/wHcwaRRySAIdetW58TFVlvctrzlbOQx3ACLcBGAsYHQ/s2048/27907821_10211455634407477_121954832907508005_o.jpg",
    "Ladyna",
  ),
  Item(
    "https://1.bp.blogspot.com/-oHMAjxAGO_E/YLfgxfNmsTI/AAAAAAAAO2A/scFR8-xxe70oBIrFs2OYJBVoJ-ymyGLdQCLcBGAsYHQ/s2048/14138239_10207185317612226_930937547589501765_o.jpg",
    "Modusa",
  ),
  Item(
    "https://1.bp.blogspot.com/-RZDCSVYjdtA/YLfg0FZwKzI/AAAAAAAAO2c/n5yhYzPif6sPmh4zBLIO82S9ZN0M5nzQACLcBGAsYHQ/s2048/23800314_10210853745920641_5760832336760384644_o.jpg",
    "Kembangan",
  ),
  Item(
    "https://1.bp.blogspot.com/-REZXuzlKYC4/YLfgp5njEZI/AAAAAAAAO0s/bptYk8Z18O01MbsZc4E3wuhZJ07iU426gCLcBGAsYHQ/s414/11038895_10203777474818286_7880851201234961819_o.jpg",
    "Nyai Blorong",
  ),
  Item(
    "https://1.bp.blogspot.com/-FYXTh2Dhh40/YLer-rAG2fI/AAAAAAAAOmk/IC9PMPbVczA5HC3lrj0q3anBi4Kl0msXACLcBGAsYHQ/s2048/17436274_10208879039554216_2655411005366421640_o.jpg",
    "Vintage",
  ),
  Item(
    "https://1.bp.blogspot.com/-NsjYwdtM6tA/YLdx9D0OFXI/AAAAAAAAOZA/rArYaXv1mk0ilu8vC1TaBF8XiVAdMdRwwCLcBGAsYHQ/s960/13087703_10206353363133884_4152557819958208994_n.jpg",
    "Berawan",
  ),
];
