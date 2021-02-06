#ifndef USERMANAGER_H
#define USERMANAGER_H

#include <QObject>
#include <QLightDM/UsersModel>
class UserManager : public QObject
{
    Q_OBJECT
public:
    explicit UserManager(QObject* password,QObject* username,QObject* userimage,QLightDM::UsersModel * users,int current,
                         int totalUsers,QObject *parent = nullptr);

signals:

public slots:
    void pushedRight();
    void pushedLeft();

private:
    QObject * m_password;
    QObject * m_username;
    QObject * m_userImage;
    QLightDM::UsersModel m_users;
    int m_current;
    int m_totalUsers;

    void nextUser();

};

#endif // USERMANAGER_H
