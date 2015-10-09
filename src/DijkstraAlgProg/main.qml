import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2

import "graphs.js" as Graphs
import "iographs.js" as IoGraphs
import com.alex.qmlcomponents 1.0

ApplicationWindow {
    visible: true
    width: 1300
    height: 768
    title: qsTr("Dijkstra's algorithm")

    property variant graph

    FileOperator {
        id: fileOperator
    }

    Launcher {
        id: launcher
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Button {
            id: chooseFileButton
            text: qsTr("Load graph")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 10
            signal fileChosen

            FileDialog {
                id: fileDialog
                title: qsTr("Choose file")
                onAccepted: chooseFileButton.fileChosen()
                nameFilters: [qsTr("Json files (*.json)")]
            }

            onClicked: {
                fileDialog.open();
            }

            onFileChosen: {
                var filename = fileDialog.fileUrl;
                var content = fileOperator.read(filename);
//               try {
                    graph = IoGraphs.loadGraphFromJson(content);
//                } catch(error) {
//                    console.log(error);
//                }
            }
        }

        RowLayout {
            id: rowLayout
            Layout.fillHeight: true
            Layout.fillWidth: true

            Flickable {
                id: imageRect
                clip: true
                height: 600
                width: 800
                contentWidth: image.sourceSize.width
                contentHeight: image.sourceSize.height
                Layout.fillHeight: true
                Layout.fillWidth: true

                Image {
                    id: image
                    anchors.fill: parent
                    source: "wrong.svg"
                }

            }
            GroupBox {
                id: dijkstraAlgGroupBox
                enabled: false
                Layout.fillHeight: true
                GridLayout {
                    id: gridLayout
                    width: 100
                    height: 100
                    columns: 3
                    flow: GridLayout.LeftToRight

                    Label {
                        id: vertexIdLabel
                        text: qsTr("Vertex id = ")
                    }


                    TextField {
                        id: vertexIdTextField
                        placeholderText: qsTr("Text Field")
                    }
                    Button {
                        id: runDijkstraButton
                        text: qsTr("Run Dijkstra's algorithm")
                    }

                    Text {
                        id: dijkstraResultText
                        text: qsTr("Text")
                        font.pixelSize: 12
                        //                    Layout.fillWidth: true
                        //                    Layout.fillHeight: true
                    }

                }


            }
        }
    }
}
