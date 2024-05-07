GFButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      text: "All",
                      shape: GFButtonShape.pills,
                      color: Theme.of(context).primaryColor,
                      highlightColor: Colors.red,
                      textColor: isPressed ? Colors.cyan : Colors.white,
                    ),