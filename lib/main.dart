import 'package:clean_architecture_example/core/api/app_api.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/data/repository/fetch_all_character_repository_impl.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/domain/usecases/get_all_character.dart';
import 'package:clean_architecture_example/features/list_example_clean_arch/presentation/pages/clean_architecture_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Clean Architecture'),
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
    late GetAllCharacters _getAllCharacters;

 @override
  void initState() {
 
    super.initState();

       final api = AppApi();
    
    final repo = CharacterRepositoryImpl(appApi: api);

    _getAllCharacters = GetAllCharacters(repository: repo);
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
              'Welcome to clean architecture',
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  moveToNextPage(context,_getAllCharacters);
                },
                child: const Text('Clean Architecture Example')),
          ],
        ),
      ),
    );
  }

  void moveToNextPage(BuildContext context, GetAllCharacters getAllCharacters) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  CleanArchPage(getAllCharacters: getAllCharacters)),
    );
  }
}
