import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jordon/camp/presentation/controller/Local_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../domain/entity/RelatedProperties.dart';

class InfoWidget extends StatefulWidget {
  InfoWidget({Key? key}) : super(key: key);

  @override
  State<InfoWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  final PageController _upController = PageController();
  final PageController _downController = PageController();

  String? firstHalf;
  String? secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (LocalCubit.get(context).all!.description.length > 50) {
      firstHalf = LocalCubit.get(context).all!.description.substring(0, 50);
      secondHalf = LocalCubit.get(context)
          .all!
          .description
          .substring(50, LocalCubit.get(context).all!.description.length);
    } else {
      firstHalf = LocalCubit.get(context).all!.description;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = LocalCubit.get(context);
    return Column(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.date_range),
                          const SizedBox(width: 10),
                          const Text(
                            'Camp',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          buildStars(cubit.all!.rating),
                          const SizedBox(width: 10),
                          Text(cubit.all!.rating.toString())
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            PageView.builder(
                              controller: _upController,
                              itemBuilder: (context, index) => Image.network(
                                cubit.all!.featuredImage,
                                fit: BoxFit.fill,
                              ),
                              itemCount: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SmoothPageIndicator(
                                controller: _upController,
                                count: 3,
                                effect: WormEffect(
                                    activeDotColor:
                                        Theme.of(context).primaryColor,
                                    dotColor: Colors.white,
                                    radius: 16,
                                    dotHeight: 10,
                                    dotWidth: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Facilities',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 156,
                        child: PageView.builder(
                          controller: _downController,
                          itemBuilder: (context, index) {
                            var featureList = cubit.all!.features[index];
                            return Column(
                              children: List.generate(
                                  2,
                                  (i) => Expanded(
                                        child: Row(
                                          children: List.generate(5, (j) {
                                            var c = i == 0 ? 0 : 5;
                                            return Expanded(
                                                child: Column(
                                              children: [
                                                featureList[c + j]
                                                        .image
                                                        .endsWith('.svg')
                                                    ? SvgPicture.network(
                                                        featureList[c + j]
                                                            .image,
                                                        width: 30,
                                                        height: 30,
                                                        color: featureList[
                                                                    c + j]
                                                                .isActive
                                                            ? Colors.amber
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                199,
                                                                194,
                                                                194),
                                                      )
                                                    : Image.network(
                                                        featureList[c + j]
                                                            .image,
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  featureList[c + j]
                                                      .description,
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                )
                                              ],
                                            ));
                                          }),
                                        ),
                                      )),
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: SmoothPageIndicator(
                          controller: _downController,
                          count: 3,
                          effect: const WormEffect(
                              activeDotColor: Colors.amberAccent,
                              radius: 16,
                              dotHeight: 10,
                              dotWidth: 20),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text('Camps Description',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 20),

                      Text(flag
                          ? (firstHalf! + "...")
                          : (firstHalf! + secondHalf!)),
                      // Text(
                      //     cubit.all!.description,
                      //     maxLines: cubit.maxLines,
                      //     style:TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                flag = !flag;
                              });
                            },
                            child: Text(
                              flag ? "show more" : "show less",

                              // cubit.maxLines == 2
                              //     ? 'see Details'
                              //     : 'show Less',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            )),
                      ),
                      const Divider(
                        height: 2,
                        thickness: 1.5,
                      ),
                      const SizedBox(height: 10),
                      Text('Location',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Text(cubit.all!.address,
                          maxLines: cubit.maxLines,
                          style: Theme.of(context).textTheme.bodyText1!),
                      const SizedBox(height: 10),
                      Container(
                        height: 200,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GoogleMap(
                            markers: {
                              Marker(
                                  markerId: const MarkerId('1'),
                                  position: LatLng(
                                      cubit.all!.mapSection.latitude,
                                      cubit.all!.mapSection.longitude))
                            },
                            initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  cubit.all!.mapSection.latitude,
                                  cubit.all!.mapSection.longitude,
                                ),
                                zoom: 6),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 40,
                      ),
                      Text('Important Information',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(255, 161, 159, 159),
                                  fontWeight: FontWeight.normal)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Max numbers of guests',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 97, 96, 96)),
                          ),
                          const Spacer(),
                          // Text(
                          //   cubit
                          //       .all
                          //       .informationSection!
                          //       .subSections![0]
                          //       .subSectionRows![0]
                          //       .value!,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .headline6!
                          //       .copyWith(
                          //       color: const Color.fromARGB(
                          //           255, 97, 96, 96)),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Number of rooms',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 97, 96, 96)),
                          ),
                          const Spacer(),
                          Text(
                            '2',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 97, 96, 96)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Daily Use',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: const Color.fromARGB(255, 97, 96, 96)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check in from',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 97, 96, 96)),
                              ),
                              Text(
                                cubit.all!.checkInDayUse,
                                style: Theme.of(context).textTheme.caption!,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check out from',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 97, 96, 96)),
                              ),
                              Text(
                                cubit.all!.checkInDayUse,
                                style: Theme.of(context).textTheme.caption!,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Overnight',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: const Color.fromARGB(255, 97, 96, 96)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check in from',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 97, 96, 96)),
                              ),
                              Text(
                                cubit.all!.checkInOvernightUse,
                                style: Theme.of(context).textTheme.caption!,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check out from',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 97, 96, 96)),
                              ),
                              Text(
                                cubit.all!.checkOutOvernightUse,
                                style: Theme.of(context).textTheme.caption!,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Similar Properties',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: const Color.fromARGB(255, 97, 96, 96),
                    letterSpacing: 1.1),
              ),
              const SizedBox(height: 5),
              Text(
                'Check out these properties too',
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: const Color.fromARGB(255, 97, 96, 96), fontSize: 15),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HotelItem(
                          item: cubit.all!.relatedSection
                              .relatedProperties[index + 1]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount:
                        cubit.all!.relatedSection.relatedProperties.length - 1),
              ),
              const SizedBox(height: 10),
            ]),
          ),
        ),
      ),
      Container(
          height: 80,
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  'Reserve',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 24, color: Colors.black),
                ),
              )))
    ]);
  }
}

class HotelItem extends StatelessWidget {
  const HotelItem({Key? key, required this.item}) : super(key: key);
  final RelatedProperties item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 170,
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.featuredImage,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 140,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 10,
                color: Colors.orange,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  item.title,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          Text(
            item.type,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            children: [
              buildStars(item.rating),
              const Spacer(),
              Text(
                '${item.reviews} reviews',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 97, 96, 96),
                    ),
              ),
            ],
          ),
          const Spacer(),
          Text(item.price,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

Widget buildStars(int starsNo) {
  return Row(
    children: List.generate(
      5,
      (index) => Icon(
        Icons.star,
        size: 17,
        color: starsNo >= index + 1 ? Colors.amberAccent : Colors.grey,
      ),
    ),
  );
}
