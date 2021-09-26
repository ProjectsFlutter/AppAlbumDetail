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
  final _maxHeader = 360.0;
  final _minHeader = 130.0;
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final _size = MediaQuery.of(context).size;

    const _maxImage       = 180.0;
    const _minImage       = 80.0;

    const _maxArtistName  = 30.0;
    const _minArtistName  = 25.0;

    const _maxAlbumName   = 25.0;
    const _minAlbumName   = 20.0;

    const _maxLeftDisc    = -76.0;
    // const _minLeftDisc    = 70.0;

    const _maxLeftAlbum   = 50.0;
    // const _minLeftAlbum   = 30.0;

    const _maxTopImage    = 150.0;
    const _minTopImage    = 25.0;

    const _maxTopTitle    = 60.0;
    const _minTopTitle    = 40.0;

    const _maxLeftTitle   = 100.0;
    // const _minLeftTitle   = 80.0;

    final _percent = shrinkOffset / _maxHeader;

    final _sizeImage      = (_maxImage      * (1 - _percent)).clamp(_minImage,      _maxImage);
    final _sizeArtistName = (_maxArtistName * (1 - _percent)).clamp(_minArtistName, _maxArtistName);
    final _sizeAlbumName  = (_maxArtistName * (1 - _percent)).clamp(_minAlbumName,  _maxAlbumName);
    final _sizeTopImage   = (_maxTopImage   * (1 - _percent)).clamp(_minTopImage,   _maxTopImage);
    final _sizeTopTitle   = (_maxTopTitle   * (1 - _percent)).clamp(_minTopTitle,   _maxTopTitle);
    final _sizeLeftDisc   = ((_size.width * 0.43) + ( _maxLeftDisc  * _percent));
    final _sizeLeftAlbum  = ((_size.width * 0.08) + ( _maxLeftAlbum * _percent));
    final _sizeLeftTitle  = ((_size.width * 0.2)  + ( _maxLeftTitle * _percent));

    return Container(
      color: const Color(0xFFECECEA),
      child: Stack(
        children: [
          Positioned(
            left: _size.width * 0.030,
            top: _size.height * 0.015,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.black,
              onPressed: () {},
          )
          ),
          Positioned(
            left: _sizeLeftDisc,
            top: _sizeTopImage,
            height: _sizeImage,
            child: Transform.rotate(
              angle: vector.radians(360 * _percent),
              child: Image.asset(album.imageDisc)
            ),
          ),
          Positioned(
            left: _sizeLeftAlbum,
            top: _sizeTopImage,
            height: _sizeImage,
            child: Image.asset(album.imageAlbum),
          ),
          Positioned(
            left: _sizeLeftTitle,
            top: _sizeTopTitle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(album.artist, style: TextStyle(color: Colors.black, fontSize: _sizeArtistName, fontWeight: FontWeight.bold)),
                Text(album.album,  style: TextStyle(color: Colors.grey,  fontSize: _sizeAlbumName, fontWeight: FontWeight.w400)),
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