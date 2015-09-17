import QtQuick 2.0
import QtQuick.Controls 1.2

Rectangle {

    anchors.fill: parent
    color: "transparent"

    Rectangle {
        id:searchTextBar
        width:parent.width/2
        height: parent.height/2

        anchors {
            verticalCenter: parent.verticalCenter

            left:parent.left
            leftMargin: parent.width*(0.02)
        }

        radius: 2

        border.color: "#AAA"
        border.width: 1

        TextField {
            id:searchTextField

            placeholderText: "Digite o que busca aqui ..."

            anchors.fill: parent
            verticalAlignment: Image.AlignVCenter

            function search(keyword) {
                videosListModel.clear();
                _requester.clearVideos();
                _requester.get("https://www.googleapis.com/youtube/v3/search?order=relevance&part=snippet&q="+keyword+"&type=video&maxResults=25&key=AIzaSyBmhQLqgKvLpn2nUQBrLMHE4f66jVmfT8c");
            }
        }
    }

    Rectangle {

        width:parent.width/13
        height: parent.height/2

        anchors {
            verticalCenter: parent.verticalCenter
            left:searchTextBar.right
            leftMargin: parent.width*(0.001)
        }

        radius: 2

        border.color: "#D3D3D3"
        border.width: 1

        Image {

            anchors.fill: parent

            smooth: true
            antialiasing: true
            fillMode: Image.PreserveAspectFit
            source: "https://cdn3.iconfinder.com/data/icons/watchify-v1-0-80px/80/search-80px-32.png"
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                searchTextField.search(searchTextField.text);
            }
        }
    }

}

