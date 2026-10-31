
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../components"

Page {

    id: root

    title: "Editor"

    property var documents: [
        {
            filePath: ""
            fileName: "Untitled"
            text: ""
        }
    ]

    property var selectedDocumentIndex: 0

    function getSelectedDocument() {
        return documents[selectedDocumentIndex];
    }

    function switchDocument(
        index: int
    ) {
        if (
            index >= 0 && index < documents.length &&
            index !== selectedDocumentIndex
        ) {
            selectedDocumentIndex = index;
            textArea.text = getSelectedDocument().text
            return;
        };
        console.log(`Error: document index '${index}' passed to 'switchDocument' is out of range or equal to the selected document index '${selectedDocumentIndex}'`);
    }

    ColumnLayout {

        anchors.fill: parent
        anchors.margins: 20

        TabBar {

            id: tabBar
            
            Layout.fillWidth: true
            Layout.prefferedHeight: 35

            Repeater {

                model: root.documents

                TabButton {
                    text: modelData.fileName
                    width: Math.max(100, bar.width / 5)
                    onClicked: function() {
                        root.switchDocument(index)
                    }
                }
            }
        }

        TextArea {

            id: textArea

            Layout.fillHeight: true
            Layout.fillWidth: true

        }

        RowLayout {

            id: statusBar

            Layout.prefferredHeight: 35
            Layout.fillWidth: true

            Label {

                id: index
                text: "Ln 1, Col 1"
                
            }

            Label {

                id: characterCountLabel
                text: "0 Characters"
                
            }

            Label {

                id: zoomPercentageLabel
                text: "100%"
                
            }

            Label {

                id: lineEndingModeLabel
                text: "Windows (CRLF)"
                
            }

            Label {

                id: encodingSchemeLabel
                
            }

        }

    }

}
