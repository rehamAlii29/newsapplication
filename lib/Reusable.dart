import 'package:flutter/material.dart';
import 'package:newsapplication/WebViewScreen.dart';

Widget BuildOneItem(ApiData, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen('${ApiData['url']}')));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        child: Expanded(
          child: Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(.20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ignore: sized_box_for_whitespace
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: '${ApiData["urlToImage"]}' == "null"
                              ? const NetworkImage(
                                  'https://previews.123rf.com/images/urfandadashov/urfandadashov1806/urfandadashov180601827/150417827-photo-not-available-vector-icon-isolated-on-transparent-background-photo-not-available-logo-concept.jpg')
                              : NetworkImage('${ApiData["urlToImage"]}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            '${ApiData["title"]}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            '${ApiData["description"]}' == "null"
                                ? "لا يوجد وصف"
                                : '${ApiData["description"]}',
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.headline4,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("publishedAt : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 5)),
                            Text(
                              '${ApiData["publishedAt"]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
