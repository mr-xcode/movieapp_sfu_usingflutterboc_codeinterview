Container(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.all(0),
      child: GFCarousel(
        autoPlay: true,
        items: imageList.map(
          (url) {
            return Container(
              width: 909,
              height: 174,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                    url,
                  ),
                  fit: BoxFit.cover, // or BoxFit.fill
                ),
              ),
              child: const Stack(
                children: [
                  // Title
                  Positioned(
                    left: 10,
                    top: 150,
                    child: Text(
                      'Black Panther: Wakanda Forever',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  // Date Time
                  Positioned(
                    left: 10,
                    top: 180,
                    child: Text(
                      'On March 2, 2022 ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
        onPageChanged: (index) {
          setState(() {
            index;
          });
        },
      ),
    )


            //List<String> myImageList = getImageList(state.movies);


            List<String> getImageList(List<Movie> movieList) {
  List<String> imageList = [];
  movieList.forEach((element) {
    imageList.add('https://image.tmdb.org/t/p/original' + element.posterPath);
  });
  return imageList;
}
