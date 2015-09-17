import QtQuick 2.0
import QtWebView 1.0

Rectangle {

    property string videoId

    WebView {
        anchors.fill: parent

        url: "qrc:/html/player.html?" + videoId

        onTitleChanged: {

            console.log(title);

            if(title == "1") {
                backButton.opacity = 0.0
            } else {
                backButton.opacity = 1.0
            }
        }
    }

    Image {
        id:backButton

        anchors {
            bottom: parent.bottom
            left: parent.left

            bottomMargin: parent.height*(0.06)
            leftMargin: parent.width*(0.005)
        }

        width:parent.width/20
        height: width

        antialiasing: true
        source: "https://cdn3.iconfinder.com/data/icons/basic-flat-svg/512/svg28-512.png"

        Behavior on opacity {
            PropertyAnimation {
                duration: 200
            }
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                stackPages.pop();
                shadowTopBar.opacity = 1
            }
        }
    }
}

