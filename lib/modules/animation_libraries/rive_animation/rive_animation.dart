import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';
import 'package:rive/rive.dart';

class RiveAnimationExample extends StatefulWidget {
  const RiveAnimationExample({super.key});

  @override
  State<RiveAnimationExample> createState() => _RiveAnimationExampleState();
}

class _RiveAnimationExampleState extends State<RiveAnimationExample> {
  Artboard? _riveArtboard;
  SMIBool? _isDance;
  SMITrigger? _isLookUp;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/dash_flutter_muscot.riv').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'birb');
          if (controller != null) {
            artboard.addController(controller);
            _isDance = controller.findSMI('dance');
            _isLookUp = controller.findSMI('look up');
          }
          setState(() => _riveArtboard = artboard);
        } catch (e) {
          print(e);
        }
      },
    );
  }

  void toggleDance(bool newValue) {
    setState(() => _isDance!.value = newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Rive Animation',
        isBack: true,
      ),
      body: _riveArtboard == null
          ? const SizedBox()
          : Column(
              children: [
                Expanded(
                  child: Rive(
                    artboard: _riveArtboard!,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Dance'),
                    Switch(
                      value: _isDance!.value,
                      onChanged: (value) => toggleDance(value),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  child: const Text('Look up'),
                  onPressed: () => _isLookUp?.value = true,
                ),
                const SizedBox(height: 12),
              ],
            ),
    );
  }
}
