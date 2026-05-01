import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0 as PlasmaCore
import org.kde.plasma.core as PlasmaCore2
import org.kde.plasma.components 3.0 as PlasmaComponents3
import QtQuick.Layouts 1.0

PlasmaCore.PlasmoidItem {
    id: root
    implicitWidth: 230
    implicitHeight: img.paintedHeight + label.implicitHeight + 100

    function readFile() {
        var xhr = new XMLHttpRequest()
        xhr.open("GET", "file:///home/szarka/Programs/spritepanel/output_clean.txt")
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200 || xhr.status === 0) {
                    label.text = xhr.responseText.trim()
                }
            }
        }
        xhr.send()        
    }

    ColumnLayout {
        id: content
        width: parent.width
        spacing: 4

        Image {
            id: img
            source: "file:///home/szarka/Programs/spritepanel/sprite.png"
            fillMode: Image.PreserveAspectFit

            Layout.fillWidth: true
            Layout.preferredHeight: paintedHeight   // 🔑 key line
            Layout.minimumHeight: 200
            Layout.minimumWidth: 200
        }

        Text {
            id: label
            text: "idkyet"
            color: "#fff"
            font.pixelSize: 12
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            onTextChanged: Qt.callLater(() => root.implicitHeight = root.implicitHeight)
        }
        Timer {
            interval: 5000
            running: true
            repeat: true
            onTriggered: readFile()
        }
    }
}