import 'package:flutter/material.dart';

class AnimatedSearchUi extends StatefulWidget {
  const AnimatedSearchUi({super.key});

  @override
  State<AnimatedSearchUi> createState() => _AnimatedSearchUiState();
}

class _AnimatedSearchUiState extends State<AnimatedSearchUi> {
  bool _isSearching = false;
  final TextEditingController _controller = TextEditingController();
  final List<String> _allItems = List.generate(20, (index) => 'Item $index');
  late List<String> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 50,
          padding: EdgeInsets.only(left: _isSearching ? 0 : 40),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isSearching
                    ? IconButton(
                        key: ValueKey("CancelIcon"),
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            _isSearching = false;
                            _controller.clear();
                            _filteredItems = _allItems;
                          });
                        },
                      )
                    : IconButton(
                        key: ValueKey("SearchIcon"),
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _isSearching = true;
                          });
                        },
                      ),
              ),
              Expanded(
                child: AnimatedOpacity(
                  opacity: _isSearching ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: _isSearching
                      ? TextField(
                          controller: _controller,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            border: InputBorder.none,
                          ),
                          onChanged: (query) {
                            setState(() {
                              _filteredItems = _allItems
                                  .where((item) => item
                                      .toLowerCase()
                                      .contains(query.toLowerCase()))
                                  .toList();
                            });
                          },
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredItems[index]),
          );
        },
      ),
    );
  }
}
