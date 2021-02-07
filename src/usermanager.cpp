#include "usermanager.h"

UserManager::UserManager(QObject* password,QObject* username,QObject* userimage,QLightDM::UsersModel * users,int current,
                         int totalUsers,QObject *parent) : QObject(parent),
                        m_password(password),m_username(username),m_userImage(userimage),m_users(users),m_current(current),m_totalUsers(totalUsers)
{
    this->nextUser();
}
void UserManager::nextUser(){
    if(m_current >= m_totalUsers){
        m_current = 0;
    }
    QVariant username= m_users.data(m_users.index(m_current,0),QLightDM::UsersModel::NameRole);
    QVariant userimage = m_users.data(m_users.index(m_current,0),QLightDM::UsersModel::ImagePathRole);

}
