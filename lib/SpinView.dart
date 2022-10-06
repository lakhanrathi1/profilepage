import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

class SpinView extends StatefulWidget {
  const SpinView({Key? key}) : super(key: key);

  @override
  _SpinViewState createState() => _SpinViewState();
}

class _SpinViewState extends State<SpinView> {
  List<ImageProvider> imageList = <ImageProvider>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMage();
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-13.jpg").image);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Spin Car"),
        ),
        body: Container(
          color: Colors.white,
          child: ImageView360(
            key: UniqueKey(),
            imageList: imageList,
          ),
        ),
      ),
    );
  }

  Future<void> loadMage() async {
    ImageProvider im = await Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-1.jpg").image;
    imageList.add(im);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-2.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-3.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-4.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-5.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-6.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-7.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-8.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-9.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-10.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-11.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-12.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-13.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-14.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-15.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-16.jpg").image);
    imageList.add(Image.network("https://cdn.spincar.com/swipetospin-viewers/Petromin/nq129991388854000-brd2-dev/20220928094638.EOQOZDXZ/ec/0-17.jpg").image);

    setState(() {

});
  }
}
