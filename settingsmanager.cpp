#include "settingsmanager.h"
#include <iostream>
SettingsManager::SettingsManager(QObject *parent) : QObject(parent)
{

}
void SettingsManager::load(QString filename){
    std::cout << filename.toStdString() << std::endl;
    QFile openFile(filename);
    openFile.open(QIODevice::ReadOnly);
    QByteArray data = openFile.readAll();
    openFile.close();
    QJsonDocument jsondoc(QJsonDocument::fromJson(data));
    QJsonObject jsonObj(jsondoc.object());
    background_path=jsonObj["background_path"].toString();
    theme_qml_path=jsonObj["theme"].toString();
}
