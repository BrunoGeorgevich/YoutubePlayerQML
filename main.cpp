#include <QQmlApplicationEngine>
#include <QApplication>
#include <QQmlContext>
#include <QDebug>

#include "httprequester.h"


#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
#include <QtWebEngine>
#endif // QT_WEBVIEW_WEBENGINE_BACKEND

int main(int argc, char *argv[])
{    

    QApplication a(argc, argv);

#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
    QtWebEngine::initialize();
#endif // QT_WEBVIEW_WEBENGINE_BACKEND

    QQmlApplicationEngine engine;
    QQmlContext *ctx = engine.rootContext();

    HttpRequester requester;

    ctx->setContextProperty("_requester",&requester);
    engine.load(QUrl("qrc:/main.qml"));

    return a.exec();
}
