#ifndef VIDEO_H
#define VIDEO_H

#include <QObject>

class Video : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString id READ getId NOTIFY idChanged)
    Q_PROPERTY(QString title READ getTitle NOTIFY titleChanged)
    Q_PROPERTY(QString thumbnail READ getThumbnail NOTIFY thumbnailChanged)

public:

    Video(QString thumb, QString tit, QString i);

    QString getId();
    QString getTitle();
    QString getThumbnail();

signals:

    void idChanged();
    void titleChanged();
    void thumbnailChanged();

private:

    QString id;
    QString title;
    QString thumbnail;

};

#endif // VIDEO_H
