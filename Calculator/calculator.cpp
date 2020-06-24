#include "calculator.h"
#include <QObject>
#include <QQuickView>
#include <QQuickItem>
#include <QtQuickControls2>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

double num_first;
bool allow_operation = true;

calculator::calculator(QObject *parent) : QObject(parent)
{

}

void calculator::digits(QObject *display)
{
    QObject *button = sender();

    double number;
    number = (QQmlProperty::read(display, "text").toString() + QQmlProperty::read(button, "text").toString()).toDouble();

    display->setProperty("text", QString::number(number, 'g', 15));
}

void calculator::operations(QObject *display)
{
    QObject *button = sender();
    double number;
    QString button_text = QQmlProperty::read(button, "text").toString();
    QString text = QQmlProperty::read(display, "text").toString();

    if(button_text == "+/-"){
        number = text.toDouble();
        number *= -1;
        display->setProperty("text", QString::number(number, 'g', 15));
    } else if(button_text == "AC"){
        display->setProperty("text", "0");
        allow_operation = true;
    }
    else if((button_text == ".") and !(text.contains('.')))
        display->setProperty("text", text + ".");
    else if(button_text == "1/x"){
        number = text.toDouble();
        number = 1/number;
        display->setProperty("text", QString::number(number, 'g', 15));
    }
    else if(button_text == "x^2"){
        number = text.toDouble();
        number *= number;
        display->setProperty("text", QString::number(number, 'g', 15));
    }
    else if(button_text == "√"){
        number = text.toDouble();
        number = sqrt(number);
        display->setProperty("text", QString::number(number, 'g', 15));
    }
}

void calculator::math_operations(QObject *display)
{
    QObject *button = sender();
    if(allow_operation){
        num_first = QQmlProperty::read(display, "text").toDouble();
        display->setProperty("text",  "");
        button->setProperty("check", true);
        allow_operation = false;
    }
}

void calculator::equal(QObject *window, QObject *display)
{
    QObject *plus = window->findChild<QObject *>("plus");
    QObject *minus = window->findChild<QObject *>("minus");
    QObject *mult = window->findChild<QObject *>("mult");
    QObject *divide = window->findChild<QObject *>("divide");

    double result, num_second;

    num_second = QQmlProperty::read(display, "text").toDouble();

    if(QQmlProperty::read(plus, "check").toBool()){
        result = num_first + num_second;
        display->setProperty("text", QString::number(result, 'g', 15));
        plus->setProperty("check", false);
        allow_operation = true;
    }

    if(QQmlProperty::read(minus, "check").toBool()){
        result = num_first - num_second;
        display->setProperty("text", QString::number(result, 'g', 15));
        minus->setProperty("check", false);
        allow_operation = true;
    }

    if(QQmlProperty::read(mult, "check").toBool()){
        result = num_first * num_second;
        display->setProperty("text", QString::number(result, 'g', 15));
        mult->setProperty("check", false);
        allow_operation = true;
    }

    if(QQmlProperty::read(divide, "check").toBool()){
        if(num_second == 0)
            display->setProperty("text", "0");
        else{
            result = num_first / num_second;
            display->setProperty("text", QString::number(result, 'g', 15));
        }
        divide->setProperty("check", false);
        allow_operation = true;
    }
}
