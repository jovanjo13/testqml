#include "testclass.h"

#include <QEventLoop>
#include <QNetworkAccessManager>
#include <QUrlQuery>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QByteArray>
#include <QString>



Testclass::Testclass(QObject *parent) : QObject(parent)
{

}

QString Testclass::get()
{
    if(m_test == nullptr){
        return "not initialized";
    }

    return m_test;
}

void Testclass::set(QString s)
{
    m_test = s;
}

QDate Testclass::curDate() const
{
    return m_curDate;
}

void Testclass::setcurDate(QDate d)
{
    qDebug() << d;
    m_curDate = d;
}

void Testclass::http()
{
    QString url = "http://10.0.0.11:30000/";

    QDate d = curDate();
    QString date = QString::number(d.year()) + "-" + QString::number(d.month()) + "-" + QString::number(d.day());

    QEventLoop eventLoop;
    QUrl localURL("http://10.0.0.11:30000/sql_get");
    QNetworkAccessManager mgr;


    QUrlQuery qu;
    qu.addQueryItem("date", date.toLatin1());
    qDebug() << "http_get_list: " << qu.toString();

    localURL.setQuery(qu);
    QNetworkRequest request(localURL);

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkReply *reply = mgr.get(request); // GET

    connect(reply, SIGNAL(finished()), &eventLoop, SLOT(quit()));
    //connect(reply, SIGNAL (finished()), this , SLOT(init_list()));

    eventLoop.exec();
}

QString Testclass::dateToString(QDate d){
    return QString::number(d.year()) + "-" + QString::number(d.month()) + "-" + QString::number(d.day());
}
