import 'package:flutter/material.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';

/// боттомшит с qr кодом
class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSizes.radius20),
          ),
          child: Container(
            color: Theme.of(context).cardColor,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: _ButtonClose(),
                ),
                Positioned.fill(
                  top: 12.0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: _ShortcutDraggable(),
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

/// кнопка Закрыть при показе на боттомшите
class _ButtonClose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(
        Size(40.0, 40.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: Size.fromHeight(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        child: Icon(Icons.close,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

/// ярлык для изменения размеров боттомшита
class _ShortcutDraggable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 5.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}