
import BetterNotepad

import "../components"

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

    function createDocument(
        filePath: string,
        fileName: string
    ) {
        
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
            height: 8

            topPadding: 0
            leftPadding: 45
            bottomPadding: 0
            rightPadding: 0

            spacing: 1

            Repeater {

                model: root.documents

                TabButton {

                    height: tabBar.height
                    width: 235

                    topPadding: 0
                    bottomPadding: 2
                    leftPadding: 8
                    rightPadding: 0

                    leftInset: 0
                    rightInset: 0
                    topInset: 0
                    bottomInset: 0

                    contentItem: RowLayout {

                        spacing: 0

                        Text {
                            text: modelData.fileName
                            font: Fonts.tabButton
                            color: "#FFFFFF"
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            opacity: 0
                        }

                        ToolButton {
                            Layout.preferredWidth: 28
                            Layout.fillHeight: true

                            text: "×"

                            font.pixelSize: 21
                            font.weight: 500
                            palette.buttonText: "#FFFFFF"

                            onClicked: function() {
                                console.log("Close tab:", index)
                            }
                        }

                    }

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

            contentItem: RowLayout {

                Layout.fillWidth: true
                Layout.fillHeight: true

                NotepadToolMenuButton {

                    id: fileButton

                    text: "File"

                    onClicked: function() {
                        console.log("Clicked fileButton, opening fileButtonMenu");
                        fileButtonMenu.popup(
                            fileButton,
                            0,
                            fileButton.height
                        );
                    }

                    NotepadMenu {

                        id: fileButtonMenu

                        NotepadMenuItem {
                            id: newTabMenuItem
                            text: "New tab"
                            onTriggered: console.log("Pressed fileButton->newTabMenuItem")
                        }

                        NotepadMenuItem {
                            id: newWindowMenuItem
                            text: "New Window"
                            onTriggered: console.log("Pressed fileButton->newWindowMenuItem")
                        }

                        NotepadMenuItem {
                            id: openMenuItem
                            text: "New Window"
                            onTriggered: console.log("Pressed fileButton->openMenuItem")
                        }

                        /*
                        // May add this in future
                        NotepadMenuItem {
                            id: recentMenuItem
                            text: "Recent"
                            onTriggered: console.log("Pressed fileButton->recentMenuItem")
                        }
                        */

                        NotepadMenuItem {
                            id: saveMenuItem
                            text: "Save"
                            onTriggered: console.log("Pressed fileButton->saveMenuItem")
                        }

                        NotepadMenuItem {
                            id: saveAsMenuItem
                            text: "Save as"
                            onTriggered: console.log("Pressed fileButton->saveAsMenuItem")
                        }

                        NotepadMenuSeperator {}

                        NotepadMenuItem {
                            id: closeTabMenuItem
                            text: "Close tab"
                            onTriggered: console.log("Pressed fileButton->closeTabMenuItem")
                        }

                        NotepadMenuItem {
                            id: closeWindowMenuItem
                            text: "Close window"
                            onTriggered: console.log("Pressed fileButton->closeWindowMenuItem")
                        }

                        NotepadMenuItem {
                            id: exitMenuItem
                            text: "Exit"
                            onTriggered: console.log("Pressed fileButton->exitMenuItem")
                        }

                    }

                }

                NotepadToolMenuButton {

                    id: editButton

                    text: "Edit"

                    font: Fonts.toolButton

                    palette.buttonText: "#FFFFFF"

                    onClicked: function() {
                        console.log("Clicked editButton, opening editButtonMenu");
                        editButtonMenu.popup(
                            editButton,
                            0,
                            editButton.height
                        );
                    }

                    NotepadMenu {

                        id: editButtonMenu

                        NotepadMenuItem {
                            id: undoMenuItem
                            text: "Undo"
                            onTriggered: console.log("Pressed editButtonMenu->undoMenuItem")
                        }

                        NotepadMenuItem {
                            id: redoMenuItem
                            text: "Redo"
                            onTriggered: console.log("Pressed editButtonMenu->redoMenuItem")
                        }

                        NotepadMenuSeperator {}

                        NotepadMenuItem {
                            id: cutMenuItem
                            text: "Cut"
                            onTriggered: console.log("Pressed editButtonMenu->cutMenuItem")
                        }

                        NotepadMenuItem {
                            id: copyMenuItem
                            text: "Copy"
                            onTriggered: console.log("Pressed editButtonMenu->copyMenuItem")
                        }

                        NotepadMenuItem {
                            id: pasteMenuItem
                            text: "Paste"
                            onTriggered: console.log("Pressed editButtonMenu->pasteMenuItem")
                        }

                        NotepadMenuItem {
                            id: deleteMenuItem
                            text: "Delete"
                            onTriggered: console.log("Pressed editButtonMenu->deleteMenuItem")
                        }

                        NotepadMenuSeperator {}

                        NotepadMenuItem {
                            id: findMenuItem
                            text: "Find"
                            onTriggered: console.log("Pressed editButtonMenu->findMenuItem")
                        }

                        NotepadMenuItem {
                            id: findNextMenuItem
                            text: "Find next"
                            onTriggered: console.log("Pressed editButtonMenu->findNextMenuItem")
                        }

                        NotepadMenuItem {
                            id: findPreviousMenuItem
                            text: "Find previous"
                            onTriggered: console.log("Pressed editButtonMenu->findPreviousMenuItem")
                        }

                        NotepadMenuItem {
                            id: replaceMenuItem
                            text: "Replace"
                            onTriggered: console.log("Pressed editButtonMenu->replaceMenuItem")
                        }

                        NotepadMenuItem {
                            id: goToMenuItem
                            text: "Go to"
                            onTriggered: console.log("Pressed editButtonMenu->goToMenuItem")
                        }

                        NotepadMenuSeperator {}

                        NotepadMenuItem {
                            id: selectAllMenuItem
                            text: "Select all"
                            onTriggered: console.log("Pressed editButtonMenu->selectAllMenuItem")
                        }

                    }

                }

                NotepadToolMenuButton {

                    id: viewButton

                    text: "View"

                    font: Fonts.toolButton

                    palette.buttonText: "#FFFFFF"

                    onClicked: function() {
                        console.log("Clicked viewButton, opening viewButtonMenu");
                        viewButtonMenu.popup(
                            viewButton,
                            0,
                            viewButton.height
                        );
                    }

                    NotepadMenu {

                        id: viewButtonMenu

                        NotepadMenuItem {
                            id: zoomMenuItem
                            text: "Zoom"
                            onTriggered: console.log("Pressed viewButtonMenu->zoomMenuItem")
                        }

                        NotepadMenuItem {
                            id: statusBarMenuItem
                            text: "Status bar"
                            onTriggered: console.log("Pressed viewButtonMenu->statusBarMenuItem")
                        }

                        NotepadMenuItem {
                            id: wordWrapMenuItem
                            text: "Word wrap"
                            onTriggered: console.log("Pressed viewButtonMenu->wordWrapMenuItem")
                        }

                    }

                }

                Rectangle {
                    height: 1
                    Layout.fillWidth: true
                    opacity: 0
                }

                ToolButton {

                    id: settingsToolButton

                    icon.height: 20
                    icon.width: 20
                    icon.name: "settings"
                    icon.color: "#FFFFFF"

                    onClicked: function() {
                        console.log("Clicked settingsToolButton");
                    }

                }

            }

        }

        TextArea {

            id: textArea

            Layout.fillHeight: true
            Layout.fillWidth: true

            text: getSelectedDocument().text

            background: Rectangle {
                color: "#272727"
                border.width: 0
            }

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
