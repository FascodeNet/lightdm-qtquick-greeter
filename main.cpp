#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLightDM/Greeter>
#include <QLightDM/SessionsModel>
#include <QLightDM/UsersModel>
#include <QtQuickControls2/QtQuickControls2>
#include <QCompleter>
#include <QDebug>
#include <QLoggingCategory>
#include "usermanager_qml.h"
#include <iostream>
int main(int argc, char *argv[])
{
    QLoggingCategory::defaultCategory()->setEnabled(QtDebugMsg, true);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
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

    QLightDM::UsersModel usersModel;
    QString init_user;
    if (! m_Greeter.hideUsersHint()) {
        QStringList knownUsers;
        for (int i = 0; i < usersModel.rowCount(QModelIndex()); i++) {
            knownUsers << usersModel.data(usersModel.index(i, 0), QLightDM::UsersModel::NameRole).toString();
        }
        init_user = QString(knownUsers.at(0));
        engine.rootContext()->setContextProperty("UserModels",knownUsers);

    }
    QString src_usericon=init_user;
    engine.rootContext()->setContextProperty("UserIconSrc",src_usericon);
    usermanager_qml qml_usermanager(&m_Greeter,&m_SessionModel,&usersModel,&src_usericon,&engine);
    qml_usermanager.changed_username_combo(init_user);
    qml_usermanager.changed_session_combo(init_session);
    engine.rootContext()->setContextProperty("theme_path","qrc:/Login.qml");
    engine.load(url);
    QObject *root = engine.rootObjects().first();
    QObject::connect(root,SIGNAL(username_selected(QString)),&qml_usermanager,SLOT(changed_username_combo(QString)));
    QObject::connect(root,SIGNAL(session_selected(QString)),&qml_usermanager,SLOT(changed_session_combo(QString)));
    QObject::connect(root,SIGNAL(loginbutton_clicked(QString)),&qml_usermanager,SLOT(loginbutton_clicked(QString)));
    return app.exec();
}
