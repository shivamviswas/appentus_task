import 'package:appentus_task/controllers/gridController.dart';
import 'package:appentus_task/widgets/pictureCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class GridScreen extends StatelessWidget {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Screen', style: TextStyle()),
      ),
      body: GetX<GridController>(
          init: GridController(),
          builder: (snapshot) {
            return snapshot.isDataLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : snapshot.imageList.isEmpty
                    ? Center(
                        child: Text('No data available', style: TextStyle()),
                      )
                    : Stack(
                        children: [
                          StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            controller: snapshot.scrollController,
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 60),
                            crossAxisCount: 4,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            itemCount: snapshot.imageList.length,
                            itemBuilder: (BuildContext context, int index) =>
                                new PictureCard(snapshot.imageList[index]),
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(2, index.isEven ? 3 : 4),
                          ),
                          snapshot.nextPageDataLoading.value
                              ? Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : SizedBox.shrink()
                        ],
                      );
          }),
    );
  }
}
/*
GridView.builder(
                          itemCount: snapshot.imageList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0
                          ),
                          itemBuilder: (BuildContext context, int index){
                            return PictureCard(snapshot.imageList[index]);
                          },
                        )


*/
