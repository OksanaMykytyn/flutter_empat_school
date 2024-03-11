import 'package:flutter/material.dart';
import 'package:task_2/Book.dart';
import 'package:task_2/Translating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Book book1 = Book('Harry Potter', 2012, 'author', 4, 200, 456);
  Book book2 = Book('title2', 2002, 'author2', 3.4, 10000, 24);
  Book book3 = Book('Harry Potter 2', 2012, 'author', 4, 200, 456);
  Book book4 = Book('Harry Potter 3', 2012, 'author', 4, 200, 456);



  Book programmingBook = Book('Programming in Dart', 2020, 'John Doe', 4.5, 100, 300);
  Book novelBook = Book('Pride and Prejudice', 1813, 'Jane Austen', 4.7, 150, 400);
  Book economicsBook = Book('Principles of Economics', 2000, 'Gregory Mankiw', 4.8, 120, 600);
  Book childrenBook = Book('Harry Potter and the Philosopher\'s Stone', 1997, 'J.K. Rowling', 4.9, 200, 350);
  Book poetryBook = Book('Leaves of Grass', 1855, 'Walt Whitman', 4.6, 90, 200);
  Book scienceBook = Book('A Brief History of Time', 1988, 'Stephen Hawking', 4.7, 80, 250);
  Book psychologyBook = Book('Thinking, Fast and Slow', 2011, 'Daniel Kahneman', 4.8, 110, 400);

  var allRate = (double rate1, double rate2) => (rate1+rate2)/2;
  


  void read (String name, {int countRead = 1}) {
    if(countRead == 1) {
    print('I go to read $name');
    } else {
    print('I go to reread $read');
    }
  }

  Translating task = Translating(0, 12.3);
  Translating task2 = Translating(4, 12.3);


  void _incrementCounter() {

    List<Book> list = [programmingBook, novelBook, economicsBook, childrenBook, poetryBook, scienceBook, psychologyBook];
    Set<Book> setBook = {...list};
    Map<String, Book> mapBook = {
      'First book': book1,
      'Second book': book3,
      'Third book': book4
    };

    setState(() {
      assert(book1.page < 30, 'Page dont be so little');
      assert(book2.page < 30, 'Page dont be so little');
      var rate = allRate(book1.rating, book2.rating);
      print(rate);
      read(book1.title);
      book1.reading();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
