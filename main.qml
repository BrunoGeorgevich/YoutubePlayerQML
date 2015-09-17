import QtQuick 2.0
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0

ApplicationWindow {

    height: 800
    width: 600
    visible: true

    property string selectedVideoId : ""

    StackView {
        id:stackPages
        anchors.fill: parent
        initialItem:firstPage
    }

    Connections {
        target:_requester
        onListReady:{

            var list = _requester.getVideos();
            list.forEach(function(video){
                videosListModel.append({
                                           image:video.thumbnail,
                                           content:video.title,
                                           videoId:video.id
                                       });

                console.log(video.id)
            });

            grid.model = videosListModel
        }
    }

    Rectangle {

        id:firstPage

        GridView {
            id:grid

            anchors {
                left:parent.left
                right:parent.right
                bottom: parent.bottom

                leftMargin: 20

                top:topBar.bottom
                topMargin: 20
            }

            cellHeight: height/3
            cellWidth: width/3

            model:ListModel { id:videosListModel }
            delegate:Image {
                source:image

                fillMode: Image.PreserveAspectCrop

                width:grid.cellWidth - 20
                height:grid.cellHeight - 20

                Rectangle {
                    id:imageRect
                    color: "transparent"
                    opacity: 0

                    anchors.fill : parent

                    Behavior on opacity {
                        PropertyAnimation {
                            duration: 200
                        }
                    }

                    Rectangle {
                        id:opacityRect

                        anchors.fill: parent

                        color:"black"
                        opacity: 0.5
                    }

                    Rectangle {
                        id:textRect

                        anchors.fill: parent

                        color:"white"
                        opacity: 1

                        Text {
                            anchors.fill: parent
                            color:"black"

                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere

                            text:content

                            Component.onCompleted: {
                                if(contentHeight > textRect.parent.height*(0.2)) {
                                    textRect.anchors.topMargin = textRect.parent.height - contentHeight
                                    opacityRect.anchors.bottomMargin = contentHeight
                                } else {

                                    textRect.anchors.topMargin = textRect.parent.height*(0.8)
                                    opacityRect.anchors.bottomMargin = opacityRect.parent.height*(0.2)
                                }
                            }
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: imageRect.opacity = 1
                    onExited: imageRect.opacity = 0
                    onClicked: {
                        stackPages.push(youtubeViewComponent);
                        selectedVideoId = videoId
                        shadowTopBar.opacity = 0;
                    }
                }
            }
        }

        DropShadow {
            id:shadowTopBar
            anchors.fill: topBar
            source:topBar
            color: "#A0000000"

            horizontalOffset: 1.2
            verticalOffset: 1.2

            radius: 12
            spread: 0.5
            samples: 24
            transparentBorder: true


            Behavior on opacity {
                PropertyAnimation {
                    duration: 300
                }
            }
        }

        Rectangle {
            id:topBar
            opacity: 0
            anchors {
                fill: parent
                topMargin: 5
                leftMargin: 20
                rightMargin: 20
                bottomMargin: parent.height*(0.92)
            }

            SearchBar {}

            Text {
                anchors{
                    right:parent.right
                    rightMargin: 10
                }

                text:"Youtube"

                color:"white"

                font.pixelSize: parent.height*(0.8)
                font.bold : true
            }

            color:"#FF0000"

        }
    }

    Component {
        id:youtubeViewComponent
        YoutubeView {
              videoId: selectedVideoId
        }
    }
}



