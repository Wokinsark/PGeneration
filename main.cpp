#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "generation.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Generation>("generation", 1, 0, "Generation");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
