#ifndef TESTCLASS_H
#define TESTCLASS_H

#include <QObject>
#include <QString>
#include <QDate>
#include <QDebug>
#include "entry.h"

class Testclass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QDate curDate READ curDate WRITE setcurDate NOTIFY bla)
    Q_PROPERTY(QList <Entry*> list READ list WRITE setList NOTIFY listChanged)
    Q_PROPERTY(QString url READ get_url)

public:
    explicit Testclass(QObject *parent = nullptr);
    Q_INVOKABLE QString get();
    Q_INVOKABLE void set(QString s);
    QDate curDate() const;
    void setcurDate(QDate d);

    QString get_url();

    Q_INVOKABLE void http();
    Q_INVOKABLE QString dateToString(QDate d);

    QList <Entry*> mlist;
    QList <Entry*> list();
    void setList(QList <Entry*> list);
    Q_INVOKABLE void setItems();

signals:
    void bla();
    void listChanged();

public slots:

private:    QString m_test;
            QDate m_curDate;
            QString url = "http://10.0.0.11:30000/";
};

#endif // TESTCLASS_H
