import 'package:flutter/material.dart';
import 'package:quiz_app/feature/topic_picker/vm/topic_picker_vm.dart';

class TopicPickerScreen extends StatefulWidget {
  const TopicPickerScreen({Key? key}) : super(key: key);

  @override
  _TopicPickerScreenState createState() => _TopicPickerScreenState();
}

class _TopicPickerScreenState extends State<TopicPickerScreen> {
  late TopicPickerVm _viewModel;

  @override
  void initState() {
    _viewModel = TopicPickerVm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
