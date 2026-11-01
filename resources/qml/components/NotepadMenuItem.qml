
import BetterNotepad

import QtQuick
import QtQuick.Controls

MenuItem {

    font: Fonts.menuItem

    background: Rectangle {
        radius: 4
        color:
            parent.down
                ? "#343434"
                : parent.hovered
                    ? "#383838"
                    : "transparent"
    }

}
