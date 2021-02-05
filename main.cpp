#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QLightDM/Greeter>
#include <QLightDM/SessionsModel>
#include <QLightDM/UsersModel>
#include <QtQuickControls2/QtQuickControls2>
#include <QCompleter>
#include <QDebug>
#include <QLoggingCategory>
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
    QLightDM::SessionsModel m_SessionModel(QLightDM::SessionsModel::SessionType::LocalSessions);
    engine.rootContext()->setContextProperty("sessionModel",&m_SessionModel);

    if (! m_Greeter.hideUsersHint()) {
        QStringList knownUsers;
        QLightDM::UsersModel usersModel;
        for (int i = 0; i < usersModel.rowCount(QModelIndex()); i++) {
            knownUsers << usersModel.data(usersModel.index(i, 0), QLightDM::UsersModel::NameRole).toString();
        }

        engine.rootContext()->setContextProperty("UserModels",knownUsers);

    }
    engine.rootContext()->setContextProperty("theme_path","qrc:/Login.qml");
    engine.load(url);
    return app.exec();
}
