
#include "File.h"

File::File(
    QObject* parent
): QObject(parent) {

};

QString File::getPath() const {
    return m_path;
};

void File::setPath(
    const QString& new_path
) {
    m_path = new_path;
};

QString File::getName() const {
    return "file_name";
};

void File::setName(
    const QString& newName
) {
    
};

QString File::getText() const {
    return m_text;
};

void File::setText(
    const QString& new_text
) {
    m_text = new_text;
};
