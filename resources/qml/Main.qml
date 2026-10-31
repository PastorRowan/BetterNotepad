
import "pages"

import QtQuick
import QtQuick.Controls

ApplicationWindow {

    width: 800
    height: 600
    visible: true
    title: "BetterNodepad"

    StackView {

        id: stackView

        anchors.fill: parent

        initialItem: EditorPage {}

    }

}
