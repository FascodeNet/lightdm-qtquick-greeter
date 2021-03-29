#include "usermanager_qml.h"
#include <iostream>
usermanager_qml::usermanager_qml(QLightDM::Greeter* greeter,QLightDM::SessionsModel* sessions,QLightDM::UsersModel* usersmodel,QString* src_usericon,QQmlApplicationEngine* enginekun,defaultsessionmanager* m,QObject *parent) :
    QObject(parent)
{
    m_usersmodel=usersmodel;
    m_src_usericon=src_usericon;
    m_greeter = greeter;
    m_sessions=sessions;
    engine=enginekun;
    mankun=m;
    connect(m_greeter,SIGNAL(authenticationComplete()),this,SLOT(authenticationComplete()));
}
void usermanager_qml::changed_session_combo(QString index2){
    current_session=index2;
}
void usermanager_qml::changed_username_combo(QString index2){
    current_username=index2;
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
            engine->rootContext()->setContextProperty("UserName",index2);
        }
    }
}
void usermanager_qml::loginbutton_clicked(QString text){
    //std::cout << "clicked " << text.toStdString() << std::endl;
    mankun->defaultprofile=current_session;
    mankun->save("/etc/lightdm/lightdm-qtquick-greeter_select.json");
    m_greeter->respond(text.trimmed());
    disable_password_text();
    erasebutton_clicked();


}
void usermanager_qml::authenticationComplete(){
    if(m_greeter->isAuthenticated()){
        //m_greeter->startSessionSync()
        std::cout << "tintn" << std::endl;
        m_greeter->startSessionSync(current_session);
    }else{
        changed_username_combo(current_username);
        error_password();
        enable_password_text();
    }
}
void usermanager_qml::erasebutton_clicked(){
    QObject* rootobj=engine->rootObjects().first();
    QObject* passwordbox=rootobj->findChild<QObject*>("passwordField_obj");
    passwordbox->setProperty("text","");
}
void usermanager_qml::error_password(){
    QObject* rootobj=engine->rootObjects().first();
    QObject* labelkun=rootobj->findChild<QObject*>("failedTextObj");
    labelkun->setProperty("text","Missing Password!");
    QObject* busyindi=rootobj->findChild<QObject*>("BusyIndic");
    busyindi->setProperty("running",false);
    erasebutton_clicked();

}

void usermanager_qml::loggerkun(QString text){
    std::cout << text.toStdString() << std::endl;
}

void usermanager_qml::disable_password_text(){
    QObject* rootobj=engine->rootObjects().first();
    QObject* passwordkun=rootobj->findChild<QObject*>("passwordField_obj");
    passwordkun->setProperty("enabled",false);
}


void usermanager_qml::enable_password_text(){
    QObject* rootobj=engine->rootObjects().first();
    QObject* passwordkun=rootobj->findChild<QObject*>("passwordField_obj");
    passwordkun->setProperty("enabled",true);
}
void usermanager_qml::loaded(){

    QObject* rootobj=engine->rootObjects().first();
    QObject* passwordkun=rootobj->findChild<QObject*>("passwordField_obj");
    passwordkun->setProperty("focus",true);
}
void usermanager_qml::sleep(){
    m_pwr.suspend();
}
void usermanager_qml::hibernate(){
    m_pwr.hibernate();
}
void usermanager_qml::reboot(){
    m_pwr.restart();
}
void usermanager_qml::poweroff(){
    m_pwr.shutdown();
}
void usermanager_qml::set_background(QString src){

    QObject* rootobj=engine->rootObjects().first();
    QObject* backgroundkun=rootobj->findChild<QObject*>("background_obj");
    backgroundkun->setProperty("source",src);
}
void usermanager_qml::cursor_move_center(QVariant x,QVariant y){
    std::cout << "x: " << x.toInt() << " y: " << y.toInt() << std::endl;

    //cursor process
    QProcess cursor_process;
    QStringList args_cursor;
    args_cursor << "mousemove" << QString::number(x.toInt()) << QString::number(y.toInt());
    cursor_process.startDetached("xdotool",args_cursor);
}
