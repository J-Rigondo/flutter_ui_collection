import 'package:flutter/material.dart';
import 'package:online_course_ui/utils/data.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({super.key});

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  late final ScrollController _scrollController;
  Color textColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.hasClients &&
            _scrollController.offset > 200 - kToolbarHeight) {
          textColor = Colors.black;
          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              //snap, floating 설정은 중간에 위로 올려도 Appbar 등장
              snap: true,
              floating: true,
              // title: Text('title'),
              expandedHeight: 250,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Futuregoing',
                  style: TextStyle(color: textColor),
                  // textScaleFactor: 1,
                ),
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.network(
                    features[0]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index) {
                  return ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        child: Placeholder()),
                    title: Text('Place ${index + 1}', textScaleFactor: 2),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
