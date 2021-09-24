import 'package:app_album_details/src/album_info.dart';
import 'package:flutter/material.dart';

class AlbumDetail extends StatelessWidget {
  const AlbumDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _AlbumHeader(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Text(album.description, 
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
                height: 1.5,
                color: Colors.grey,
                fontSize: 16.0
              ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.black,
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}

class _AlbumHeader extends SliverPersistentHeaderDelegate{
  final double _maxExtent = 350;
  final double _minExtent = 100;
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: const Color(0xFFECECEA),
      child: Stack(
        children: [
          Positioned(
            right: 30.0,
            bottom: 30.0,
            height: 180.0,
            child: Image.asset(album.imageDisc),
          ),
          Positioned(
            left: 30.0,
            bottom: 30.0,
            height: 180.0,
            child: Image.asset(album.imageAlbum),
          ),
          Positioned(
            left: 100.0,
            top: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(album.artist, style: const TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                Text(album.album,  style: const TextStyle(color: Colors.grey,  fontSize: 25, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxExtent;

  @override
  // TODO: implement minExtent
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;

}