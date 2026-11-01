
import BetterNotepad

import QtQuick
import QtQuick.Controls

ToolButton {
    
    font: Fonts.toolButton

    palette.buttonText: "#FFFFFF"

    background: Rectangle {
        radius: 4
        color:
            parent.down
                ? "#312B29"
                : parent.hovered
                    ? "#383838"
                    : "transparent"
    }

}
