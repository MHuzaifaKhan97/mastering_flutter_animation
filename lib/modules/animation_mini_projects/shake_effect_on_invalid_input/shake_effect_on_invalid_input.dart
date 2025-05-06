import 'package:flutter/material.dart';
import 'package:mastering_flutter_animation/widgets/custom_appbar_widget.dart';

class ShakeEffectOnInvalidInput extends StatefulWidget {
  const ShakeEffectOnInvalidInput({super.key});

  @override
  State<ShakeEffectOnInvalidInput> createState() =>
      _ShakeEffectOnInvalidInputState();
}

class _ShakeEffectOnInvalidInputState extends State<ShakeEffectOnInvalidInput>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _shakeAnimation;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _shakeAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.1, 0))
        .chain(CurveTween(curve: Curves.elasticInOut))
        .animate(_controller);
  }

  void _validateForm() {
    if (!_formKey.currentState!.validate()) {
      // Trigger shake animation if validation fails
      _controller.forward(from: 0).then((_) {
        _controller.reverse();
        _controller.forward(from: 0).then((_) => _controller.reverse());
      });
    } else {
      // Handle valid form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form Submitted Successfully')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: CustomRoundedAppBar(
        title: 'Shake Effect on Invalid Input',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _shakeAnimation,
                child: TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Enter Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateForm,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
