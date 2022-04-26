class ViewNewsPage extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: const BackButtonIcon(),
            color: Colors.red,
            tooltip: "Back",
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            const Spacer(),
            Text('Here are some recent articles that may help you during gameplay.',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white),
            ),
            const Spacer(),

          ],
        ),
      ),

    );
  }

  @override
  _ViewNewsPageState createState() => _ViewNewsPageState();

}
class _ViewNewsPageState extends State<ViewNewsPage> {
  var client = http.Client();
  var headlines = ['','','','','','','',''];
  var urls = ['','','','','','','',''];

  fetchNews() async {
    print("in fetchNews");
    String url = 'https://MMWebScraperAI.gomalley411.repl.co';
    try {
      print("getting url");

      var response = await http.get(Uri.parse(url));
      print(response.statusCode);
      var body = response.body;
      //print("Body: " + body);
      var i = jsonDecode(body);
      for (var n = 0; n < 8; n++) {
        //print("in for; " + i[n].toString());
        setState(() {
          headlines[n] = i[n]['headline'];
          urls[n] = i[n]['url'];
        });
      }
      //print(headlines);
      //print(urls);
      //print("Success");
    }
    finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState(); // requesting to fetch before UI drawing starts
    fetchNews();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromRGBO(01,19,36,20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text('Here are some recent articles that may help you during gameplay.',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white
              ),
            ),
            const Spacer(),
            const Text('Headlines taken from the New York Times. The links may take a while to load.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[0], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[0],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[1], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[1],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[2], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[2],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[3], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[3],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[4], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[4],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[5], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[5],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[6], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[6],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextButton(
                        onPressed: () async => {
                          await launch(urls[7], forceSafariVC: false)
                        },
                        child: Text(
                          headlines[7],
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }


}
