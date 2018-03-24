#ifndef ENTRYMODEL_H
#define ENTRYMODEL_H

#include <QObject>
#include <QAbstractTableModel>
#include "entry.h"

class entrymodel : public QAbstractTableModel
{
    Q_OBJECT
public:
    entrymodel();

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    //QVariant headerData(int section, Qt::Orientation orientation, int role) const;
};

#endif // ENTRYMODEL_H
