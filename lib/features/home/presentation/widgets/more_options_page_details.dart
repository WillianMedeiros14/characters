import 'package:flutter/material.dart';

class MoreOptionsPageDetails extends StatefulWidget {
  const MoreOptionsPageDetails({super.key});

  @override
  State<MoreOptionsPageDetails> createState() => _MoreOptionsPageDetailsState();
}

class _MoreOptionsPageDetailsState extends State<MoreOptionsPageDetails> {
  void _onFilterSelectedConfirm() {
    //  Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      color: Colors.black,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Mais opções',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Deletar',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 19),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}
