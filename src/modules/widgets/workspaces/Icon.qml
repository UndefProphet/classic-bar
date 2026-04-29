import QtQuick
import Quickshell
// import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Wayland

IconImage {
  id: root
  property int iconSize: 16
  property string defaultMissingIcon: "application-x-executable"
  property Toplevel toplevel

  implicitSize: iconSize
  anchors.centerIn: parent
  source: getIconForToplevel(toplevel)

  // TODO: Some applications can't be found by DesktopEntries.heuristicLookup like LSP-plugins.
  function getIconForToplevel(toplevel) {
    return Quickshell.iconPath(DesktopEntries.heuristicLookup(toplevel?.wayland?.appId)?.icon, root.defaultMissingIcon)
  }
}
