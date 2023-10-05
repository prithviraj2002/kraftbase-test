import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:kraftbase_test/examples/text_view_document_example.dart';
import 'package:kraftbase_test/examples/text_view_fonts_example.dart';
import 'package:kraftbase_test/examples/text_view_image_video_example.dart';
import 'package:kraftbase_test/examples/text_view_inkwell_example.dart';
import 'package:kraftbase_test/examples/text_view_markdown_example.dart';
import 'package:kraftbase_test/examples/text_view_quiz_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TeXViewFullExample(),
    );
  }
}

class TeXViewFullExample extends StatefulWidget {
  const TeXViewFullExample({Key? key}) : super(key: key);

  @override
  _TeXViewFullExampleState createState() => _TeXViewFullExampleState();
}

class _TeXViewFullExampleState extends State<TeXViewFullExample> {
  int radVal = 0;

  late TeXViewRenderingEngine renderingEngine;

  @override
  Widget build(BuildContext context) {
    renderingEngine = radVal == 0
        ? const TeXViewRenderingEngine.katex()
        : const TeXViewRenderingEngine.mathjax();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Kraftbase Flutter assignment"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          RadioListTile<int>(
            value: 0,
            groupValue: radVal,
            onChanged: (val) {
              setState(() {
                radVal = val!;
              });
            },
            title: const Text("Katex"),
            subtitle: const Text("RenderingEngine for Fast Rendering"),
          ),
          RadioListTile<int>(
            value: 1,
            groupValue: radVal,
            onChanged: (val) {
              setState(() {
                radVal = val!;
              });
            },
            title: const Text("MathJax"),
            subtitle: const Text("RenderingEngine for Quality Rendering"),
          ),
          const Divider(
            height: 30,
            color: Colors.transparent,
          ),
          getExampleButton(
              context,
              'Quiz Example',
              TeXViewQuizExample(
                renderingEngine: renderingEngine,
              )),
          getExampleButton(
              context,
              'TeX Examples',
              TeXViewDocumentExamples(
                renderingEngine: renderingEngine,
              )),
          getExampleButton(
              context,
              'Custom Fonts Examples',
              TeXViewFontsExamples(
                renderingEngine: renderingEngine,
              )),
          getExampleButton(
              context,
              'Inkwell Example',
              TeXViewInkWellExample(
                renderingEngine: renderingEngine,
              )),
        ],
      ),
    );
  }

  getExampleButton(BuildContext context, String title, Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }
}