#include "authmanager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{
    setIsProcessing_l(false);
    setIsProcessing_r(false);
}

void AuthManager::authentificate(const QString &login, const QString &password)
{
    setIsProcessing_l(true);
    QUrl url("http://127.0.0.1:50165/auth");
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
        setIsProcessing_l(false);
        reply->deleteLater();
    });
}

void AuthManager::registering(const QString &login, const QString &password)
{
    setIsProcessing_r(true);
    QUrl url("http://127.0.0.1:50165/register");
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
        setIsProcessing_r(false);
        reply->deleteLater();
    });
}

bool AuthManager::isProcessing_l()
{
    return m_isProcessing_l;
}

void AuthManager::setIsProcessing_l(bool value)
{
    if(m_isProcessing_l == value) return;
    m_isProcessing_l = value;
    emit processingChanged(value);
}

bool AuthManager::isProcessing_r()
{
    return m_isProcessing_r;
}

void AuthManager::setIsProcessing_r(bool value)
{
    if(m_isProcessing_r == value) return;
    m_isProcessing_r = value;
    emit processingChanged(value);
}

