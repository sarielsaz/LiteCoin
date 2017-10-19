// Copyright (c) 2011-2016 The Sarielsaz Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef SARIELSAZ_QT_UTILITYDIALOG_H
#define SARIELSAZ_QT_UTILITYDIALOG_H

#include <QDialog>
#include <QObject>

class SarielsazGUI;

namespace Ui {
    class HelpMessageDialog;
}

/** "Help message" dialog box */
class HelpMessageDialog : public QDialog
{
    Q_OBJECT

public:
    explicit HelpMessageDialog(QWidget *parent, bool about);
    ~HelpMessageDialog();

    void printToConsole();
    void showOrPrint();

private:
    Ui::HelpMessageDialog *ui;
    QString text;

private Q_SLOTS:
    void on_okButton_accepted();
};


/** "Shutdown" window */
class ShutdownWindow : public QWidget
{
    Q_OBJECT

public:
    explicit ShutdownWindow(QWidget *parent=0, Qt::WindowFlags f=0);
    static QWidget *showShutdownWindow(SarielsazGUI *window);

protected:
    void closeEvent(QCloseEvent *event);
};

#endif // SARIELSAZ_QT_UTILITYDIALOG_H
