#include "usermanager_qml.h"
#include <iostream>
usermanager_qml::usermanager_qml(QLightDM::Greeter* greeter,QLightDM::SessionsModel* sessions,QLightDM::UsersModel* usersmodel,QString* src_usericon,QQmlApplicationEngine* enginekun,QObject *parent) :
    QObject(parent)
{
    m_usersmodel=usersmodel;
    m_src_usericon=src_usericon;
    m_greeter = greeter;
    m_sessions=sessions;
    engine=enginekun;
    connect(m_greeter,SIGNAL(authenticationComplete()),this,SLOT(authenticationComplete()));
}
void usermanager_qml::changed_session_combo(QString index2){
    current_session=index2;
}
void usermanager_qml::changed_username_combo(QString index2){
    std::cout << index2.toStdString() << std::endl;
    if(m_greeter->inAuthentication()){
        m_greeter->cancelAuthentication();
    }
    if(index2 != nullptr){
        m_greeter->authenticate(index2);

    }
    for (int i = 0; i < m_usersmodel->rowCount(QModelIndex()); i++) {
        if(m_usersmodel->data(m_usersmodel->index(i, 0), QLightDM::UsersModel::NameRole).toString() == index2){
            QVariant image=m_usersmodel->data(m_usersmodel->index(i,0),QLightDM::UsersModel::ImagePathRole);
            std::cout << image.toString().toStdString() << std::endl;
            //changed_userimage("file://" + image.toString());
            engine->rootContext()->setContextProperty("UserIconSrc",QVariant("file://" + image.toString()));
        }
    }
}
void usermanager_qml::loginbutton_clicked(QString text){
    //std::cout << "clicked " << text.toStdString() << std::endl;
    m_greeter->respond(text.trimmed());

}
void usermanager_qml::authenticationComplete(){
    if(m_greeter->isAuthenticated()){
        //m_greeter->startSessionSync()
        std::cout << "tintn" << std::endl;
        m_greeter->startSessionSync(current_session);
    }
}
