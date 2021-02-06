#include "usermanager_qml.h"
#include <iostream>
usermanager_qml::usermanager_qml(QLightDM::UsersModel* usersmodel,QString* src_usericon,QQmlApplicationEngine* enginekun,QObject *parent) :
    QObject(parent)
{
    m_usersmodel=usersmodel;
    m_src_usericon=src_usericon;
    engine=enginekun;
}
void usermanager_qml::changed_username_combo(QString index2){
    std::cout << index2.toStdString() << std::endl;
    for (int i = 0; i < m_usersmodel->rowCount(QModelIndex()); i++) {
        if(m_usersmodel->data(m_usersmodel->index(i, 0), QLightDM::UsersModel::NameRole).toString() == index2){
            QVariant image=m_usersmodel->data(m_usersmodel->index(i,0),QLightDM::UsersModel::ImagePathRole);
            std::cout << image.toString().toStdString() << std::endl;
            //changed_userimage("file://" + image.toString());
            engine->rootContext()->setContextProperty("UserIconSrc",QVariant("file://" + image.toString()));
        }
    }
}
