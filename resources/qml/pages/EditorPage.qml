
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {

    id: root

    title: "Editor"

    property var documents: [
        {
            filePath: "",
            fileName: "Untitled",
            text: ""
        }
    ]

    property int selectedDocumentIndex: 0

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
        spacing: 0

        TabBar {

            id: tabBar
            
            Layout.fillWidth: true
            height: 20

            topPadding: 10
            leftPadding: 30
            spacing: 1

            Repeater {

                model: root.documents

                TabButton {

                    height: tabBar.height
                    width: 235

                    topPadding: 2
                    bottomPadding: 2
                    leftPadding: 20
                    rightPadding: 0

                    leftInset: 0
                    rightInset: 0
                    topInset: 0
                    bottomInset: 0

                    font {
                        family: "Segoe UI Variable"
                        pixelSize: 11
                        // or 12 idk
                        weight: Font.Bold
                    }

                    text: modelData.fileName

                    background: Rectangle {
                        anchors.fill: parent
                        anchors.margins: 0
                        topLeftRadius: 6
                        topRightRadius: 6
                        color: "#2C2C2C"
                    }

                    onClicked: function() {
                        root.switchDocument(index)
                    }

                }
            }
        }

        ToolBar {

            id: toolBar

            Layout.fillWidth: true
            Layout.preferredHeight: 40

            padding: 0
            spacing: 0

            background: Rectangle {
                color: "#2C2C2C"
            }

            RowLayout {

                ToolButton {

                    id: fileButton

                    text: "File"

                }

                ToolButton {

                    id: editButton

                    text: "Edit"

                }

                ToolButton {

                    id: viewButton

                    text: "View"

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

            Layout.preferredHeight: 35
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
