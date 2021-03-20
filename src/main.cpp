#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLightDM/Greeter>
#include <QLightDM/SessionsModel>
#include <QLightDM/UsersModel>
#include <QtQuickControls2/QtQuickControls2>
#include <QCompleter>
#include <QDebug>
#include <QCommandLineParser>
#include <QLoggingCategory>
#include "usermanager_qml.h"
#include <iostream>
#include <QApplication>
#include "settingsmanager.h"
#include <unistd.h>
int main(int argc, char *argv[])
{
    QLoggingCategory::defaultCategory()->setEnabled(QtDebugMsg, true);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    QGuiApplication app(argc, argv);

    QCoreApplication::setApplicationName("Lightdm QML Greeter");
    QCoreApplication::setApplicationVersion("1.0");
    //cmd parse

    QCommandLineParser parser;
    parser.setApplicationDescription("Lightdm QML Greeter");
    parser.addHelpOption();
    QCommandLineOption setting_option({"c","config"},"Greeter Config","qml file","/etc/lightdm/lightdm-qtquick-greeter.json");
    parser.addOption(setting_option);
    parser.process(app.arguments());
    SettingsManager settingm;
    if(QFile::exists(parser.value(setting_option))){
        settingm.load(parser.value(setting_option));
    }
    QString qml_kun = settingm.theme_qml_path;
    QString lang_path = settingm.qm_file.replace("%lang%",QLocale::system().name());
    if(QFile::exists(lang_path)){
        QTranslator qtTranslator;
        std::cout << lang_path.toStdString() << std::endl;
        qtTranslator.load(lang_path);
        app.installTranslator(&qtTranslator);
    }
    QRect primary_rect=QGuiApplication::primaryScreen()->geometry();
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Screen_width",primary_rect.width());
    engine.rootContext()->setContextProperty("Screen_height",primary_rect.height());
    engine.rootContext()->setContextProperty("Screen_x",primary_rect.x());
    engine.rootContext()->setContextProperty("Screen_y",primary_rect.y());

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    QLightDM::Greeter m_Greeter;
    if (!m_Greeter.connectSync()) {
    }
    QLightDM::SessionsModel m_SessionModel;
    QStringList sessions_str;
    QString init_session;
    for(int i=0; i< m_SessionModel.rowCount(QModelIndex());i++){
        sessions_str << m_SessionModel.data(m_SessionModel.index(i,0),QLightDM::SessionsModel::KeyRole).toString();
    }
    init_session=sessions_str.at(0);
    engine.rootContext()->setContextProperty("sessionModel",sessions_str);


    bool hideuser=settingm.hideuser;
    QLightDM::UsersModel usersModel;
    QString init_user;
    if(hideuser == true){
        if (! m_Greeter.hideUsersHint()) {
            QStringList knownUsers;
            for (int i = 0; i < usersModel.rowCount(QModelIndex()); i++) {
                knownUsers << usersModel.data(usersModel.index(i, 0), QLightDM::UsersModel::NameRole).toString();
            }
            init_user = QString(knownUsers.at(0));
            engine.rootContext()->setContextProperty("UserModels",knownUsers);
        }
    }else{

        if (! m_Greeter.hideUsersHint()) {
            QStringList knownUsers;
            for (int i = 0; i < usersModel.rowCount(QModelIndex()); i++) {
                knownUsers << usersModel.data(usersModel.index(i, 0), QLightDM::UsersModel::NameRole).toString();
            }
            init_user = QString(knownUsers.at(0));
            engine.rootContext()->setContextProperty("UserModels",knownUsers);
        }
    }
    QString src_usericon=init_user;
    engine.rootContext()->setContextProperty("UserIconSrc",src_usericon);
    engine.rootContext()->setContextProperty("UserName",init_user);
    usermanager_qml qml_usermanager(&m_Greeter,&m_SessionModel,&usersModel,&src_usericon,&engine);
    qml_usermanager.changed_username_combo(init_user);
    qml_usermanager.changed_session_combo(init_session);



    /*if(qml_kun != "qrc:/Login.qml"){
        char* realpathkun=new char[1024];
        realpath(qml_kun.toUtf8().data(),realpathkun);
        qml_kun = "file:/" + QString(realpathkun);
    }*/

    // load
    engine.rootContext()->setContextProperty("theme_path",qml_kun);
    char hostname[334];
    gethostname(hostname,sizeof(hostname));
    engine.rootContext()->setContextProperty("HostName",QString(hostname) + " ");
    engine.load(url);
    QObject *root = engine.rootObjects().first();
    QObject::connect(root,SIGNAL(username_selected(QString)),&qml_usermanager,SLOT(changed_username_combo(QString)));
    QObject::connect(root,SIGNAL(session_selected(QString)),&qml_usermanager,SLOT(changed_session_combo(QString)));
    QObject::connect(root,SIGNAL(loginbutton_clicked(QString)),&qml_usermanager,SLOT(loginbutton_clicked(QString)));
    QObject::connect(root,SIGNAL(erasebutton_clicked()),&qml_usermanager,SLOT(error_password()));
    QObject::connect(root,SIGNAL(logger(QString)),&qml_usermanager,SLOT(loggerkun(QString)));
    QObject::connect(root,SIGNAL(enablebutton_clicked()),&qml_usermanager,SLOT(enable_password_text()));
    QObject::connect(root,SIGNAL(disablebutton_clicked()),&qml_usermanager,SLOT(disable_password_text()));
    QObject::connect(root,SIGNAL(shutdown()),&qml_usermanager,SLOT(poweroff()));
    QObject::connect(root,SIGNAL(reboot()),&qml_usermanager,SLOT(reboot()));
    QObject::connect(root,SIGNAL(hibernate()),&qml_usermanager,SLOT(hibernate()));
    QObject::connect(root,SIGNAL(suspend()),&qml_usermanager,SLOT(sleep()));
    QObject::connect(root,SIGNAL(loaded()),&qml_usermanager,SLOT(loaded()));
    QObject::connect(root,SIGNAL(set_background(QString)),&qml_usermanager,SLOT(set_background(QString)));
    qml_usermanager.cursor_move_center(primary_rect.x() + primary_rect.width() / 2,primary_rect.y() +  primary_rect.height() / 2);
    qml_usermanager.set_background(settingm.background_path);

    return app.exec();
}
