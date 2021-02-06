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
    explicit usermanager_qml(QLightDM::UsersModel* usersmodel,QString* src_usericon,QQmlApplicationEngine* enginekun,QObject *parent = nullptr);
private:
    QLightDM::UsersModel* m_usersmodel;
    QString* m_src_usericon;
    QQmlApplicationEngine* engine;
signals:
    void changed_userimage(QString src);
public slots:
    void changed_username_combo(QString index2);
};

#endif // USERMANAGER_QML_H
