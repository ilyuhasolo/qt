#include "converter.h"
#include <QObject>
#include <QQuickView>
#include <QQuickItem>
#include <QtQuickControls2>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

converter::converter(QObject *parent) : QObject(parent)
{

}

void converter::convertDistance(QString type, QObject *distWindow)
{
    double mm = 0;
    double cm = 0;
    double dm = 0;
    double m = 0;
    double km = 0;

    if(type == "mm"){
        mm = QQmlProperty::read(distWindow->findChild<QObject *>("mm"), "text").toDouble();
        cm = mm / 10;
        dm = cm / 10;
        m = cm / 100;
        km = m / 1000;
    }
    else if(type == "cm"){
        cm = QQmlProperty::read(distWindow->findChild<QObject *>("cm"), "text").toDouble();
        mm = cm * 10;
        dm = cm / 10;
        m = cm / 100;
        km = m / 1000;
    }
    else if(type == "dm"){
        dm = QQmlProperty::read(distWindow->findChild<QObject *>("dm"), "text").toDouble();
        cm = dm * 10;
        mm = cm * 10;
        m = cm / 10;
        km = m / 1000;
    }
    else if(type == "m"){
        m = QQmlProperty::read(distWindow->findChild<QObject *>("m"), "text").toDouble();
        cm = m * 100;
        mm = cm * 10;
        dm = cm / 10;
        km = m / 1000;
    }
    else if(type == "km"){
        km = QQmlProperty::read(distWindow->findChild<QObject *>("km"), "text").toDouble();
        m = km * 1000;
        cm = m * 100;
        mm = cm * 10;
        dm = cm / 10;
    }

    distWindow->findChild<QObject *>("mm")->setProperty("text", QString::number(mm, 'g', 15));
    distWindow->findChild<QObject *>("cm")->setProperty("text", QString::number(cm, 'g', 15));
    distWindow->findChild<QObject *>("dm")->setProperty("text", QString::number(dm, 'g', 15));
    distWindow->findChild<QObject *>("m")->setProperty("text", QString::number(m, 'g', 15));
    distWindow->findChild<QObject *>("km")->setProperty("text", QString::number(km, 'g', 15));
}

void converter::convertTime(QString type, QObject *timeWindow)
{
    double ms = 0;
    double s = 0;
    double m = 0;
    double h = 0;
    double d = 0;
    double w = 0;
    double mn = 0;
    double y = 0;

    if(type == "ms"){
        ms = QQmlProperty::read(timeWindow->findChild<QObject *>("ms"), "text").toDouble();
        s = ms / 10;
        m = s / 60;
        h = m / 60;
        d = h / 24;
        w = d / 7;
        mn = w / 4;
        y = mn / 12;
    }
    else if(type == "s"){
        s = QQmlProperty::read(timeWindow->findChild<QObject *>("s"), "text").toDouble();
        ms = s * 10;
        m = s / 60;
        h = m / 60;
        d = h / 24;
        w = d / 7;
        mn = w / 4;
        y = mn / 12;
    }
    else if(type == "m"){
        m = QQmlProperty::read(timeWindow->findChild<QObject *>("m"), "text").toDouble();
        s = m * 60;
        ms = s * 10;
        h = m / 60;
        d = h / 24;
        w = d / 7;
        mn = w / 4;
        y = mn / 12;
    }
    else if(type == "h"){
        h = QQmlProperty::read(timeWindow->findChild<QObject *>("h"), "text").toDouble();
        m = h * 60;
        s = m * 60;
        ms = s * 10;
        d = h / 24;
        w = d / 7;
        mn = w / 4;
        y = mn / 12;
    }
    else if(type == "d"){
        d = QQmlProperty::read(timeWindow->findChild<QObject *>("d"), "text").toDouble();
        h = d * 24;
        m = h * 60;
        s = m * 60;
        ms = s * 10;
        w = d / 7;
        mn = w / 4;
        y = mn / 12;
    }
    else if(type == "w"){
        w = QQmlProperty::read(timeWindow->findChild<QObject *>("w"), "text").toDouble();
        d = w * 7;
        h = d * 24;
        m = h * 60;
        s = m * 60;
        ms = s * 10;
        mn = w / 4;
        y = mn / 12;
    }
    else if(type == "mn"){
        mn = QQmlProperty::read(timeWindow->findChild<QObject *>("mn"), "text").toDouble();
        w = mn * 4;
        d = w * 7;
        h = d * 24;
        m = h * 60;
        s = m * 60;
        ms = s * 10;
        y = mn / 12;
    }
    else if(type == "y"){
        y = QQmlProperty::read(timeWindow->findChild<QObject *>("y"), "text").toDouble();
        mn = y * 12;
        w = mn * 4;
        d = w * 7;
        h = d * 24;
        m = h * 60;
        s = m * 60;
        ms = s * 10;
    }
    timeWindow->findChild<QObject *>("ms")->setProperty("text", QString::number(ms, 'g', 15));
    timeWindow->findChild<QObject *>("s")->setProperty("text", QString::number(s, 'g', 15));
    timeWindow->findChild<QObject *>("m")->setProperty("text", QString::number(m, 'g', 15));
    timeWindow->findChild<QObject *>("h")->setProperty("text", QString::number(h, 'g', 15));
    timeWindow->findChild<QObject *>("d")->setProperty("text", QString::number(d, 'g', 15));
    timeWindow->findChild<QObject *>("w")->setProperty("text", QString::number(w, 'g', 15));
    timeWindow->findChild<QObject *>("mn")->setProperty("text", QString::number(mn, 'g', 15));
    timeWindow->findChild<QObject *>("y")->setProperty("text", QString::number(y, 'g', 15));

}

void converter::convertMass(QString type, QObject *massWindow)
{
    double mg = 0;
    double g = 0;
    double kg = 0;
    double t = 0;
    double kt = 0;

    if(type == "mg"){
        mg = QQmlProperty::read(massWindow->findChild<QObject *>("mg"), "text").toDouble();
        g = mg / 1000;
        kg = g / 1000;
        t = kg / 1000;
        kt = t / 1000;
    }
    else if(type == "g"){
        g = QQmlProperty::read(massWindow->findChild<QObject *>("g"), "text").toDouble();
        mg = g * 1000;
        kg = g / 1000;
        t = kg / 1000;
        kt = t / 1000;
    }
    else if(type == "kg"){
        kg = QQmlProperty::read(massWindow->findChild<QObject *>("kg"), "text").toDouble();
        g = kg * 1000;
        mg = g * 1000;
        t = kg / 1000;
        kt = t / 1000;
    }
    else if(type == "t"){
        t = QQmlProperty::read(massWindow->findChild<QObject *>("t"), "text").toDouble();
        kg = t * 1000;
        g = kg * 1000;
        mg = g * 1000;
        kt = t / 1000;
    }
    else if(type == "kt"){
        kt = QQmlProperty::read(massWindow->findChild<QObject *>("kt"), "text").toDouble();
        t = kt * 1000;
        kg = t * 1000;
        g = kg * 1000;
        mg = g * 1000;
    }

    massWindow->findChild<QObject *>("mg")->setProperty("text", QString::number(mg, 'g', 15));
    massWindow->findChild<QObject *>("g")->setProperty("text", QString::number(g, 'g', 15));
    massWindow->findChild<QObject *>("kg")->setProperty("text", QString::number(kg, 'g', 15));
    massWindow->findChild<QObject *>("t")->setProperty("text", QString::number(t, 'g', 15));
    massWindow->findChild<QObject *>("kt")->setProperty("text", QString::number(kt, 'g', 15));

}

void converter::convertEnergy(QString type, QObject *energyWindow)
{
    double j = 0;
    double kj = 0;
    double mj = 0;
    double gj = 0;

    if(type == "j"){
        j = QQmlProperty::read(energyWindow->findChild<QObject *>("j"), "text").toDouble();
        kj = j / 1000;
        mj = kj / 1000;
        gj = mj / 1000;
    }
    else if(type == "kj"){
        kj = QQmlProperty::read(energyWindow->findChild<QObject *>("kj"), "text").toDouble();
        j = kj * 1000;
        mj = kj / 1000;
        gj = mj / 1000;
    }
    else if(type == "mj"){
        mj = QQmlProperty::read(energyWindow->findChild<QObject *>("mj"), "text").toDouble();
        kj = mj * 1000;
        j = kj * 1000;
        gj = mj / 1000;
    }
    else if(type == "gj"){
        gj = QQmlProperty::read(energyWindow->findChild<QObject *>("gj"), "text").toDouble();
        mj = gj * 1000;
        kj = mj * 1000;
        j = kj * 1000;
    }

    energyWindow->findChild<QObject *>("j")->setProperty("text", QString::number(j, 'g', 15));
    energyWindow->findChild<QObject *>("kj")->setProperty("text", QString::number(kj, 'g', 15));
    energyWindow->findChild<QObject *>("mj")->setProperty("text", QString::number(mj, 'g', 15));
    energyWindow->findChild<QObject *>("gj")->setProperty("text", QString::number(gj, 'g', 15));
}
