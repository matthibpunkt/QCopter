# Add more folders to ship with the application, here
folder_01.source = qml/QCopter
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Installation path
# target.path =

#TARGET = QtSensors

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

#OTHER_FILES += \
#    qml/QCopter/navigation_main.qml \
#    qml/QCopter/navigation/Menu.qml \
#    Battery.qml \
#    qml/QCopter/AccelerometerView.qml \
#    android/AndroidManifest.xml

RESOURCES += ressources.qrc

QT += multimedia quick sensors svg xml bluetooth declarative

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

ANDROID_EXTRA_LIBS = C:/Qt/Qt5.3.1/5.3/android_armv7/qml/QtSensors/libdeclarative_sensors.so

OTHER_FILES += \
    qml/QCopter/AccelerometerView.qml \
    qml/QCopter/BatteryView.qml \
    qml/QCopter/BluetoothView.qml \
    qml/QCopter/Horizont.qml\
    qml/QCopter/main.qml \
    qml/QCopter/Option.qml \
    qml/QCopter/OptionalView.qml \
    qml/QCopter/UltrasonicView.qml \
    qml/QCopter/Components/Battery.qml \
    qml/QCopter/Components/Button.qml \
    qml/QCopter/Components/Joystick.qml \
    qml/QCopter/Components/Slider.qml \
    qml/QCopter/Components/Slider2.qml \
    qml/QCopter/Components/StatusBar.qml \
    qml/QCopter/Components/ToggleButton.qml \
    qml/QCopter/MenuModel.qml

HEADERS +=


