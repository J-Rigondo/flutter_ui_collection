import 'package:flutter/material.dart';
import 'package:online_course_ui/utils/data.dart';

class SliverSearchScreen extends StatelessWidget {
  const SliverSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              //snap, floating 설정은 중간에 위로 올려도 Appbar 등장
              // snap: true,
              floating: true,
              // title: Text('title'),
              expandedHeight: 250,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  features[0]['image'],
                  fit: BoxFit.cover,
                ),
              ),
              bottom: AppBar(
                automaticallyImplyLeading: false, //백버튼 자동 붙는거 없앰
                title: Container(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term'),
                  ),
                ),
              ),
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
