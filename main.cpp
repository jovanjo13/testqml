#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "testclass.h"
#include "entry.h"
#include "entrymodel.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<Entry>("Entry", 1, 0, "Entry");
    qmlRegisterType<Testclass>("Testclass", 1, 0, "Testclass");
    qmlRegisterType<entrymodel>("entrymodel", 1, 0, "entrymodel");

    //Testclass tc;
    entrymodel* model = new entrymodel();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("theModel", model);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
