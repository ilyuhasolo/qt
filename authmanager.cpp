#include "authmanager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{

}

void AuthManager::authentificate(const QString &login, const QString &password)
{
    QUrl url("http://127.0.0.1:59699/auth");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject body;
    body["login"] = login;
    body["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply = _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply](){
        if (reply->error() != QNetworkReply::NoError) {
            this->authentificateError = reply->errorString();
        } else {
            QJsonObject obj = QJsonDocument::fromJson(reply->readAll()).object();
            QString token = obj.value("token").toString();
            this->token = token;
        }
        this->onAuthentificateFinished();
        reply->deleteLater();

    });
}

void AuthManager::registering(const QString &login, const QString &password)
{
    QUrl url("http://127.0.0.1:59699/register");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject body;
    body["login"] = login;
    body["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply = _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply](){
        if (reply->error() != QNetworkReply::NoError) {
            this->registerError = reply->errorString();
        }
        this->onRegisterFinished();
        reply->deleteLater();

    });
}

void AuthManager::onRegisterFinished()
{
    qDebug() << "Register error: " << this -> registerError;
    emit registerRequestCompleted(this -> registerError);
}

QString AuthManager::getToken()
{
    return this->token;
}

void AuthManager::onAuthentificateFinished()
{
    qDebug() << "Authentification error: " << this -> authentificateError;
    qDebug() << "Token: " << this -> getToken();
    emit authentificateRequestCompleted(this -> authentificateError);
}
