#include "video.h"

Video::Video(QString thumb, QString tit, QString i)
{
    id = i;
    title = tit;
    thumbnail = thumb;
}

QString Video::getId()
{
    return id;
}

QString Video::getTitle()
{
    return title;
}

QString Video::getThumbnail()
{
    return thumbnail;
}

