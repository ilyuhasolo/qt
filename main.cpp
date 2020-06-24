#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQuickView>
#include <QQuickItem>
#include "calculator.h"
#include "converter.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<calculator>("Calculator", 1, 0, "Calculator");
    qmlRegisterType<converter>("Converter", 1, 0, "Converter");
    calculator calc;

    QQmlApplicationEngine engine;
    QQmlComponent component(&engine, QUrl(QLatin1String("qrc:/main.qml")));
    QObject *mainPage = component.create();

    for(int i = 0; i <10; i++)
        QObject::connect(mainPage->findChild<QObject *>("button_"+ QString::number(i)), SIGNAL(clicked(QObject *)), &calc, SLOT(digits(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("dot"), SIGNAL(clicked(QObject *)), &calc, SLOT(operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("plusminus"), SIGNAL(clicked(QObject *)), &calc, SLOT(operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("ac"), SIGNAL(clicked(QObject *)), &calc, SLOT(operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("1/x"), SIGNAL(clicked(QObject *)), &calc, SLOT(operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("sqr"), SIGNAL(clicked(QObject *)), &calc, SLOT(operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("sqrt"), SIGNAL(clicked(QObject *)), &calc, SLOT(operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("plus"), SIGNAL(clicked(QObject *)), &calc, SLOT(math_operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("minus"), SIGNAL(clicked(QObject *)), &calc, SLOT(math_operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("mult"), SIGNAL(clicked(QObject *)), &calc, SLOT(math_operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("divide"), SIGNAL(clicked(QObject *)), &calc, SLOT(math_operations(QObject *)));
    QObject::connect(mainPage->findChild<QObject *>("equal"), SIGNAL(equal(QObject *, QObject *)), &calc, SLOT(equal(QObject *, QObject *)));

//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

    return app.exec();
}
