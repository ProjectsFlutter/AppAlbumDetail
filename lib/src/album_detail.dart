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
    final _percent = shrinkOffset / _maxHeader;

    const _minLeftDisc    = -690.0;
    const _minLeftAlbum   = 60.0;
    const _minLeftTitle   = 90.0;

    final _maxAlbumImage  = _size.height * 0.27;
    final _minAlbumImage  = _size.height * 0.125;

    final _maxDiscImage   = _size.height * 0.26;

    final _maxArtistName  = _size.height * 0.05;
    final _minArtistName  = _size.height * 0.04;

    final _maxAlbumName   = _size.height * 0.04;
    final _minAlbumName   = _size.height * 0.03;

    final _maxTopTitle    = _size.height * 0.08;
    final _minTopTitle    = _size.height * 0.045;



    double _sizeAlbumImage         = (_maxAlbumImage * (1 - _percent)).clamp(_minAlbumImage, _maxAlbumImage);
    double _sizeDiscImage          = (_maxDiscImage  * (1 - _percent));

    double _sizeArtistName         = (_maxArtistName * (1 - _percent)).clamp(_minArtistName, _maxArtistName);
    double _sizeAlbumName          = (_maxAlbumName  * (1 - _percent)).clamp(_minAlbumName,  _maxAlbumName);

    double _sizeBottomAlbumImage   = _size.height * 0.04;
    double _sizeBottomDiscImage    = _size.height * 0.04;

    double _sizeTopTitle           = (_maxTopTitle * (1 - _percent)).clamp(_minTopTitle, _maxTopTitle);

    final _sizeLeftDisc            = ((_size.width * 0.45)  + ( _minLeftDisc  * _percent));
    final _sizeLeftAlbum           = ((_size.width * 0.02)  + ( _minLeftAlbum * (_percent + 0.4).clamp(0.0, 1.0)));
    final _sizeLeftTitle           = ((_size.width * 0.20)  + ( _minLeftTitle * (_percent + 0.8).clamp(0.0, 1.0)));

    return Container(
      color: const Color(0xFFECECEA),
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        children: [
          Positioned(
            left: _size.width * 0.030,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.black,
              onPressed: () {},
          )
          ),
          Positioned(
            left: _sizeLeftDisc,
            bottom: _sizeBottomDiscImage,
            height: _sizeDiscImage,
            child: Opacity(
              opacity: _percent < 0.16 ? 1.0 : 0.0,
              child: Transform.rotate(
                angle: vector.radians(-360 * _percent),
                child: Image.asset(album.imageDisc)
              ),
            ),
          ),
          Positioned(
            left: _sizeLeftAlbum,
            bottom: _sizeBottomAlbumImage,
            height: _sizeAlbumImage,
            child: Image.asset(album.imageAlbum),
          ),
          Positioned(
            left: _sizeLeftTitle,
            top:  _sizeTopTitle,
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