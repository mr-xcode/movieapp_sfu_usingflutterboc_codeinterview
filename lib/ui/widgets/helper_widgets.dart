import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Widget singleCardView(String url, String title, String category) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 5,
    ),
    width: 135,
    height: 231,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff252836),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 135,
          height: 178,
          child: Image.network(url),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                category,
                style: const TextStyle(fontSize: 10, color: Color(0xff92929D)),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget yearMinuteAction() {
  return Container(
    width: 274,
    height: 64,
    alignment: Alignment.center,
    child: const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 15,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "2021",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              '|',
              style: TextStyle(color: Colors.white),
            ),

            // For Minute
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_clock,
                    size: 15,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "148 minutes",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              '|',
              style: TextStyle(color: Colors.white),
            ),

            // For Action
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(
                    Icons.attractions,
                    size: 15,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Action",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "8.4",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget playDownloadShare() {
  return Container(
    width: 243,
    height: 48,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GFButton(
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          color: Colors.orange,
          child: const Text("Play"),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.download,
            color: Colors.orange,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.cyan,
          ),
        ),
      ],
    ),
  );
}

Widget actionRow() {
  return Container(
    width: 327,
    height: 22,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "13+",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Action",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "IMAX",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "2 Trollers",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: const Row(
            children: [
              Icon(
                Icons.punch_clock,
                size: 10,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '2h 13m',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget storyLine() {
  return Container(
    width: 327,
    height: 170,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Story Line",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "For the first time in the cinematic history of Spider-Man, our friendly neighborhood hero's identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. More",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget castAndCrew() {
  return Container(
    width: 455,
    height: 200,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast and Crew",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 100, // Set a fixed height for the ListView
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              signleCastItem(),
              signleCastItem(),
              signleCastItem(),
              signleCastItem(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget signleCastItem() {
  return Container(
    width: 122,
    height: 40,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GFAvatar(
          radius: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jon Watts",
              style: TextStyle(
                color: Color(0xff92929D),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Directors',
              style: TextStyle(
                color: Color(0xff92929D),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
