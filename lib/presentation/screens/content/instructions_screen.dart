import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../providers/user_type_provider.dart';
import '../../../config/constants.dart';
import '../../cubits/content/content_cubit.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});
  static const routeName = '/instructions_screen';

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  final TextEditingController _contentController = TextEditingController();
  bool _isEditing = false;
  @override
  Widget build(BuildContext context) {
    final userType = Provider.of<UserType>(context, listen: false).userType;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pregnancy Instructions",
          style: TextStyle(color: headLines1Color, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
        actions: [
          if (userType == 'admin')
            IconButton(
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
                icon: (_isEditing)
                    ? const Icon(Icons.save)
                    : const Icon(Icons.edit))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ContentCubit, ContentState>(
            bloc: context.read<ContentCubit>()
              ..getContent(article: 'instructions'),
            builder: (context, state) {
              if (state is LoadedContentState) {
                _contentController.text = state.data;
                return Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Text(
                          'Instructions to follow Durig pregnancy: ',
                          style: TextStyle(
                              color: headLines2Color,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: Wrap(
                        children: [
                          TextField(
                            style: const TextStyle(
                              fontSize: 19,
                            ),
                            maxLines: null,
                            minLines: 5,
                            readOnly: !_isEditing,
                            controller: _contentController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              filled: false,
                            ),
                          )
                        ],
                      ),
                    ),
                    (_isEditing)
                        ? Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: ElevatedButton(
                                onPressed: () async {
                                  await context
                                      .read<ContentCubit>()
                                      .updateContent(
                                          article: 'instructions',
                                          content: _contentController.text);
                                  setState(() {
                                    _isEditing = !_isEditing;
                                  });
                                },
                                child: const Text("Save Changes")),
                          )
                        : Container()
                  ],
                );
              }
              return const Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
