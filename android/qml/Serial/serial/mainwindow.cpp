#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QSerialPort>
#include "QDebug"


QSerialPort *serial;
MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    serial = new QSerialPort(this);
    serial->setPortName("com38");
    serial->setBaudRate(QSerialPort::Baud9600);
    serial->setDataBits(QSerialPort::Data8);
    serial->setParity(QSerialPort::NoParity);
    serial->setStopBits(QSerialPort::OneStop);
    serial->setFlowControl(QSerialPort::NoFlowControl);
    serial->open(QIODevice::ReadWrite);
    serial->write("foo");
    connect(serial, SIGNAL(readyRead()), this, SLOT(serialReiceived()));
}

MainWindow::~MainWindow()
{
    delete ui;
    serial->close();
}

void MainWindow::serialReiceived()
{
    QByteArray ba;
    ba = serial->readAll();
    qDebug()<<ba;
}
