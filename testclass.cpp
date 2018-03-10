#include "testclass.h"

#include <QEventLoop>
#include <QNetworkAccessManager>
#include <QUrlQuery>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QByteArray>
#include <QString>

#include "entry.h"




Testclass::Testclass(QObject *parent) : QObject(parent)
{
    Entry * e1;
    //Entry * e2;
    e1->setFirstName(*new const QString("Max"));
    e1->setLastName("Mustermann");
    e1->setDescription("Description");
    e1->setSection("Marketing");
    QDateTime* dt1 = new QDateTime();
    dt1->setDate(*new QDate(2018,10,10));
    dt1->setTime(*new QTime(10,0,0,0));
    e1->setDatefrom(*dt1);
    QDateTime* dt2 = new QDateTime();
    dt2->setDate(*new QDate(2018,10,10));
    dt2->setTime(*new QTime(11,0,0,0));
    e1->setDateto(*dt2);

    mlist.append(e1);
    //mlist.append(e2);

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

QList<Entry *> Testclass::list()
{
    return mlist;
}

void Testclass::setList(QList<Entry *> list)
{
    mlist = list;
}


