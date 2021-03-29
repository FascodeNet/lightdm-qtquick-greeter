#ifndef DEFAULTSESSIONMANAGER_H
#define DEFAULTSESSIONMANAGER_H

#include <QObject>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <iostream>
class defaultsessionmanager : public QObject
{
    Q_OBJECT
public:
    explicit defaultsessionmanager(QObject *parent = nullptr);
    QString defaultprofile="";
    void load(QString filename);
    void save(QString filename);
signals:

};

#endif // DEFAULTSESSIONMANAGER_H
