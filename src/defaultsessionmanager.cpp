#include "defaultsessionmanager.h"

defaultsessionmanager::defaultsessionmanager(QObject *parent) : QObject(parent)
{

}
void defaultsessionmanager::load(QString filename){
    std::cout << filename.toStdString() << std::endl;
    QFile openFile(filename);
    openFile.open(QIODevice::ReadOnly);
    QByteArray data = openFile.readAll();
    openFile.close();
    QJsonDocument jsondoc(QJsonDocument::fromJson(data));
    QJsonObject jsonObj(jsondoc.object());
    defaultprofile=jsonObj["defaultprofile"].toString();
}
void defaultsessionmanager::save(QString filename){
    std::cout << filename.toStdString() << std::endl;
    QFile openFile(filename);
    if(!openFile.open(QIODevice::WriteOnly)){
        qWarning("Couldn't open save.json");
        return;
    }
    QJsonObject jsonObj;
    jsonObj["defaultprofile"]=defaultprofile;

    QJsonDocument jsondoc(jsonObj);
    openFile.write(jsondoc.toJson());
    openFile.close();
}
