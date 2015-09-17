#include "httprequester.h"

HttpRequester::HttpRequester(QObject *parent) : QObject(parent)
{
    manager = new QNetworkAccessManager(this);

    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(getReply(QNetworkReply*)));
}

void HttpRequester::get(QString url)
{
    QNetworkReply * reply = manager->get(QNetworkRequest(QUrl(url)));
}

void HttpRequester::clearVideos()
{
    videos.clear();
}

QList<QObject *> HttpRequester::getVideos()
{
    return videos;
}

void HttpRequester::getReply(QNetworkReply *reply)
{
    jsonReply = QJsonDocument::fromJson(reply->readAll());
    QJsonObject mainObj = jsonReply.object();

    QJsonArray itemsArray = mainObj.value("items").toArray();

    foreach (QJsonValue item, itemsArray) {
        videos.append(new Video(
                          item.toObject().value("snippet").toObject().value("thumbnails").toObject().value("high").toObject().value("url").toString(),
                          item.toObject().value("snippet").toObject().value("title").toString(),
                          item.toObject().value("id").toObject().value("videoId").toString()));
    }

    emit listReady();

    qDebug() << "End of the request!";
}

