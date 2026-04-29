import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.modules.services
import Niri 0.1
import QtQml.Models

Item {
  id: root
  SystemPalette { id: palette }

  required property ShellScreen screen

  implicitWidth: childrenRect.width
  implicitHeight: childrenRect.height

  RowLayout {
    Repeater {
      model: NiriService.workspaces
    

RowLayout {
        id: workspace
        visible: model.output == screen.name
        property var workspaceId: model.id

        Text {
          color: "yellow"
          text: `[${model.index}${model.name}]`
        }

        Repeater {
          model: NiriService.windows
          RowLayout {
            visible: model.workspaceId == workspace.workspaceId

            Rectangle {
              color: model.isFocused ? "lightblue" : "transparent"
              implicitWidth: childrenRect.width + 10
              implicitHeight: childrenRect.height

              RowLayout {
              anchors.centerIn: parent
                IconImage {
                  implicitSize: apptext.height
                  source: `file://${model.iconPath}`
                }
                Text {
                  id: apptext
                  color: model.isFocused ?  "black" : palette.text
                  text: model.appId
                }
              }
            }
          }
        }
      }
    }
  }
}
