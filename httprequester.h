#ifndef HTTPREQUESTER_H
#define HTTPREQUESTER_H

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>

//Json Includes
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>

//Network Includes
#include <QObject>
#include <QDebug>
#include <QFile>

//Custom Includes
#include "video.h"

class HttpRequester : public QObject
{
    Q_OBJECT
public:

    HttpRequester(QObject *parent = 0);

    Q_INVOKABLE void get(QString url);
    Q_INVOKABLE void clearVideos();
    Q_INVOKABLE QList<QObject *> getVideos();

public slots:

    void getReply(QNetworkReply *reply);

signals:

    void listReady();

private:

    QNetworkAccessManager *manager;
    QJsonDocument jsonReply;

    QList<QObject *> videos;

};

#endif // HTTPREQUESTER_H
