import 'package:app_album_details/src/album_info.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

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
  final _maxHeader = 350.0;
  final _minHeader = 100.0;
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final _size = MediaQuery.of(context).size;

    const _maxImage = 180.0;
    const _minImage = 80.0;

    const _maxLeftDisc = 150.0;
    const _minLeftDisc = 32.0;

    const _maxArtistName = 30.0;
    const _minArtistName = 20.0;

    const _maxAlbumName = 25.0;
    const _minAlbumName = 15.0;

    final _percent = shrinkOffset / _maxHeader;

    final _sizeImage = (_maxImage * (1 - _percent)).clamp(_minImage, _maxImage);
    final _sizeLeftDisc = (_maxLeftDisc * (1 - _percent)).clamp(_minLeftDisc, _maxLeftDisc);

    return Container(
      color: const Color(0xFFECECEA),
      child: Stack(
        children: [
          Positioned(
            left: _sizeLeftDisc,
            bottom: _size.height * 0.05,
            height: _sizeImage,
            child: Transform.rotate(
              angle: vector.radians(360 * _percent),
              child: Image.asset(album.imageDisc)
            ),
          ),
          Positioned(
            left: _size.height * 0.05,
            bottom: _size.height * 0.05,
            height: _sizeImage,
            child: Image.asset(album.imageAlbum),
          ),
          Positioned(
            left: 100.0,
            top: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(album.artist, style: const TextStyle(color: Colors.black, fontSize: _maxArtistName, fontWeight: FontWeight.bold)),
                Text(album.album,  style: const TextStyle(color: Colors.grey,  fontSize: _maxAlbumName, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _maxHeader;

  @override
  // TODO: implement minExtent
  double get minExtent => _minHeader;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;

}