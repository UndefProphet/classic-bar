//@ pragma UseQApplication
import QtQuick
import Quickshell
import qs.modules.bar

ShellRoot {
  id: root

  Variants {
    // TODO: implement side and top bar for different resolutions.
    // model: { return Quickshell.screens; }
    model: Quickshell.screens
    delegate: Bar {
      required property var modelData
      monitorScreen: modelData
    }
  }
}
