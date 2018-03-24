#include "entrymodel.h"
#include <qdebug.h>

entrymodel::entrymodel()
{

}

int entrymodel::rowCount(const QModelIndex &parent) const
{
    return 2;
}

int entrymodel::columnCount(const QModelIndex &parent) const
{
    return 3;
}

QVariant entrymodel::data(const QModelIndex &index, int role) const
{
    if(role != Qt::DisplayRole){
        return QVariant();
    }
    //return "test";
    return QString("Row%1, Column%2")
                      .arg(index.row() + 1)
                      .arg(index.column() +1);
}
/*
QVariant entrymodel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(role != Qt::DisplayRole || orientation != Qt::Horizontal){
        return QVariant();
    }

    QString s = "";

    if(section ==1){
        s = "1";
    }
    if(section ==2){
        s = "2";
    }
    if(section ==3){
        s = "3";
    }
    qDebug() << s;
    return s;
}
*/
