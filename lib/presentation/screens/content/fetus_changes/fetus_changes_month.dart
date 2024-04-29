import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../config/constants.dart';
import '../../../../config/validators.dart';
import '../../../cubits/content/content_cubit.dart';
import '../../../providers/user_type_provider.dart';

class FetusMonth extends StatefulWidget {
  const FetusMonth({super.key, required this.monthIndex});
  final int monthIndex;
  @override
  State<FetusMonth> createState() => _FetusMonthState();
}

class _FetusMonthState extends State<FetusMonth> {
  final TextEditingController _contentController = TextEditingController();
  bool _isEditing = false;
  @override
  Widget build(BuildContext context) {
    final userType = Provider.of<UserType>(context, listen: false).userType;
    final String month = getMonth(widget.monthIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$month Month",
          style: const TextStyle(
              color: headLines1Color, fontWeight: FontWeight.bold),
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
              ..getChangesContent(
                  article: 'fetusChanges', month: widget.monthIndex),
            builder: (context, state) {
              if (state is LoadedChangesContentState) {
                _contentController.text = state.data.text!;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        state.data.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                                      .updateChangesContent(
                                          article: 'fetusChanges',
                                          month: widget.monthIndex,
                                          text: _contentController.text);
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
