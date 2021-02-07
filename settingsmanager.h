#ifndef SETTINGSMANAGER_H
#define SETTINGSMANAGER_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>

class SettingsManager : public QObject
{
    Q_OBJECT
public:
    explicit SettingsManager(QObject *parent = nullptr);
    QString background_path="";
    QString theme_qml_path = "qrc:/Login.qml";
    void load(QString filename);
signals:

};

#endif // SETTINGSMANAGER_H
