import 'package:cm_cmp_sdk_v3/cm_cmp_sdk_v3.dart';
import 'package:cm_cmp_sdk_v3/consent_layer_ui_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMP SDK Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CMPManager _cmpManager = CMPManager.instance;
  String _lastAction = '';

  @override
  void initState() {
    super.initState();
    _initializeCMP();
  }

  Future<void> _initializeCMP() async {
    try {
      await _cmpManager.setWebViewConfig(ConsentLayerUIConfig(isCancelable: false, darkMode: true));

      await _cmpManager.setUrlConfig(
        id: 'd43fec52024dd',
        domain: 'delivery.consentmanager.net',
        appName: 'sz',
        language: 'DE',
      );

      _cmpManager.addEventListeners(
        didReceiveConsent: (consent, jsonObject) {
          setState(() => _lastAction = 'Received consent: $consent');
        },
        didShowConsentLayer: () {
          setState(() => _lastAction = 'Consent layer shown');
        },
        didCloseConsentLayer: () {
          setState(() => _lastAction = 'Consent layer closed');
        },
        didReceiveError: (error) {
          setState(() => _lastAction = 'Error: $error');
        },
      );

      await _cmpManager.checkAndOpen();
    } catch (e) {
      setState(() => _lastAction = 'Initialization error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CMP SDK Demo')),
      body: Center(child: Text('Last action: $_lastAction')),
    );
  }
}
