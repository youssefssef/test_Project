import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/task.dart';
import '../screens/edit_task.dart';

class Edit_Button extends StatefulWidget {
  final List<Map<String, dynamic>> tasksData;

  const Edit_Button({
    Key? key,
    required this.tasksData,
  }) : super(key: key);

  @override
  State<Edit_Button> createState() => _Edit_ButtonState();
}

class _Edit_ButtonState extends State<Edit_Button> {
  late List<bool> taskDone;

  @override
  void initState() {
    super.initState();
    taskDone = List.filled(widget.tasksData.length, false); // Initialize the list in initState.
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasksData.length,
      itemBuilder: (context, index) {
        Task task = Task.fromMap(widget.tasksData[index]);
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 91,
            width: 382,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xfffE7E7E7),
                Color(0xfffFFFFFF),
              ]),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xfffE7E7E7), width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        taskDone[index] = !taskDone[index];
                      });
                    },
                    child: taskDone[index]
                        ? const Icon(
                            Icons.check_circle,
                            size: 32,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.circle,
                            size: 32,
                            color: Colors.white,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Text(
                      task.task,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            decoration: taskDone[index] ? TextDecoration.lineThrough : TextDecoration.none,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: taskDone[index] ? Colors.grey : const Color(0xfff071D55)),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTask(
                                id: index + 1,
                                task: task.task,
                              )),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 51,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1, color: const Color(0xfff071D55)),
                    ),
                    child: Center(
                      child: Text(
                        'Edit',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xfff071D55),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
