
import QtQuick
import QtQuick.Controls

Menu {

    id: root

    width: 250

    padding: 5

    background: Rectangle {
        width: parent.width
        color: "#2C2C2C"
        border.width: 0
    }

    enter: Transition {

        ParallelAnimation {

            NumberAnimation {
                property: "height"
                from: 0
                to: root.implicitHeight
                duration: 220
                easing.type: Easing.OutCubic
            }

            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 160
            }

        }

    }

    exit: Transition {

        ParallelAnimation {

            NumberAnimation {
                property: "height"
                from: root.implicitHeight
                to: 0
                duration: 160
                easing.type: Easing.InCubic
            }

            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 120
            }

        }

    }

}
