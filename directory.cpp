#include <QDir>
#include <directory.h>
#include <QDebug>

Directory::Directory(QObject *parent) :
	QObject(parent)
{
	QDir dir;
	setAbsolutePath(dir.absolutePath());
	setDirName(dir.dirName());
	//qDebug() << "current(): " << dir.current();
}

QString Directory::absolutePath() { return m_absolutePath; }

void Directory::setAbsolutePath(const QString &absolutePath)
{
	if (absolutePath == m_absolutePath)
		return;

	m_absolutePath = absolutePath;
	emit absolutePathChanged();
}

QString Directory::dirName() { return m_dirName; }

void Directory::setDirName(const QString &setAbsolutePath)
{
	if (setAbsolutePath == m_absolutePath)
		return;

	m_dirName = setAbsolutePath;
	emit absolutePathChanged();
}
