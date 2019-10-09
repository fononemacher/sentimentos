//class Home extends StatefulWidget {
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  void _apaga() {
//    setState(() {
//      tarefas.removeWhere((tarefa) => tarefa.feito);
//    });
//  }
//
//  _adiciona() {
//    if (tarefas.last.msg.isNotEmpty) {
//      setState(() {
//        tarefas.add(Task(msg: "", feito: false));
//      });
//    }
//  }
//
//  List<Task> tarefas = [Task()];
//
//  void initState() {
//    super.initState();
//    Map<String, Widget> teste = Map();
//  }
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Tarefas"),
//        actions: <Widget>[
//          IconButton(
//            onPressed: _apaga,
//            icon: Icon(
//              Icons.clear_all,
//              size: 30,
//            ),
//          ),
//        ],
//      ),
//      body: SingleChildScrollView(
//        child: Container(
//          color: Color(0xff5E5E5E),
//          padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
//          child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: tarefas.map((Task task) {
//                TextEditingController controller =
//                TextEditingController(text: task.msg);
//                return Row(
//                  key: Key(task.id.toString()),
//                  children: <Widget>[
//                    IconButton(
//                      onPressed: () {
//                        setState(() {
//                          task.feito = !task.feito;
//                        });
//                      },
//                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                      icon: Icon(
//                        task.feito
//                            ? Icons.radio_button_checked
//                            : Icons.radio_button_unchecked,
//                        size: 35,
//                      ),
//                    ),
//                    Expanded(
//                      child: TextField(
//                        onChanged: (nome) {
//                          setState(() {
//                            task.msg = controller.text;
//                          });
//                        },
//                        controller: controller,
//                        style: TextStyle(
//                            color: task.feito ? Colors.white70 : Colors.white),
//                        decoration: InputDecoration(
//                          hintText: "O que precisa ser feito?",
//                        ),
//                      ),
//                    )
//                  ],
//                );
//              }).toList()),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            _adiciona();
//          });
//        },
//        child: Icon(
//          Icons.add,
//        ),
//      ),
//      backgroundColor: Color(0xff5E5E5E),
//    );
//  }
//}