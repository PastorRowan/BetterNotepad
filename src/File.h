
#pragma once

#include <QObject>
#include <QString>
#include <QtQml/qqmlregistration.h>

class File : public QObject {

    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QString path READ getPath WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString text READ getText WRITE setText NOTIFY textChanged)

    private:

        QString m_path = "";
        QString m_name = "Untitled";
        QString m_text = "";

    protected:

    public:

        explicit File(
            QObject* parent = nullptr
        );

        QString getPath() const;

        void setPath(
            const QString& newPath
        );

        QString getName const;

        void setName(
            const QString& newName
        );

        QString getText() const;

        void setText(
            const QString& newText
        );

    signals:

        void pathChanged();
        void nameChanged();
        void textChanged();

};
