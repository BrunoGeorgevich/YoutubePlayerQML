#-------------------------------------------------
#
# Project created by QtCreator 2015-09-16T13:18:47
#
#-------------------------------------------------

QT       += network qml quick widgets

qtHaveModule(webengine) {
        QT += webengine
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}


TARGET = HttpRequest
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    httprequester.cpp \
    video.cpp

HEADERS += \
    httprequester.h \
    video.h

RESOURCES += \
    qml.qrc
