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
            emit authentificateRequestCompleted(reply->errorString(), "");
        } else {
            QJsonObject obj = QJsonDocument::fromJson(reply->readAll()).object();
            QString token = obj.value("token").toString();
            emit authentificateRequestCompleted(reply->errorString(), token);
        }
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
        emit registerRequestCompleted(reply->errorString());
        reply->deleteLater();
    });
}
