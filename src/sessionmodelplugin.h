#ifndef SESSIONMODELPLUGIN_H
#define SESSIONMODELPLUGIN_H

#include <QQmlExtensionPlugin>
#include <QObject>
#include <QQmlEngine>
#include <QLightDM/SessionsModel>

class sessionModelPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "boo.foo.QtExtension.lightdm.SessionModel")
public:
    void registerTypes(const char *uri)
    {
        qmlRegisterType<QLightDM::SessionsModel>(uri, 1, 0,
                "SessionModel");
    }
};

#endif // SESSIONMODELPLUGIN_H
