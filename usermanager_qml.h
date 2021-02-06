#ifndef USERMANAGER_QML_H
#define USERMANAGER_QML_H

#include <QObject>

#include <QLightDM/Greeter>
#include <QLightDM/SessionsModel>
#include <QLightDM/UsersModel>
#include <QQmlApplicationEngine>
#include <QQmlContext>
class usermanager_qml : public QObject
{
    Q_OBJECT
public:
    explicit usermanager_qml(QLightDM::Greeter* greeter,QLightDM::SessionsModel* sessions,QLightDM::UsersModel* usersmodel,QString* src_usericon,QQmlApplicationEngine* enginekun,QObject *parent = nullptr);
private:
    QLightDM::UsersModel* m_usersmodel;
    QLightDM::Greeter* m_greeter;
    QString* m_src_usericon;
    QQmlApplicationEngine* engine;
    QLightDM::SessionsModel* m_sessions;
    QString current_session;
signals:
    void changed_userimage(QString src);
public slots:
    void changed_username_combo(QString index2);
    void changed_session_combo(QString index2);
    void loginbutton_clicked(QString text);
    void authenticationComplete();
};

#endif // USERMANAGER_QML_H
