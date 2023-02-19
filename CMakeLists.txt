cmake_minimum_required(VERSION 3.16)

project(
  qml-demo
  VERSION 0.1
  LANGUAGES CXX)

set(BIN_NAME qml-app)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(
  Qt6
  COMPONENTS Quick
  REQUIRED)

qt_add_executable(${BIN_NAME} src/main.cpp)

qt_add_qml_module(
  ${BIN_NAME}
  URI
  Main
  VERSION
  1.0
  QML_FILES
  ui/main.qml
  ui/window.qml
  ui/input.qml
  ui/animations.qml
  ui/customtype.qml
  ui/MessageLabel.qml
  ui/AlarmDelegate.qml
  ui/AlarmDialog.qml
  ui/AlarmModel.qml
  ui/TumblerDelegate.qml
  RESOURCES)

target_link_libraries(${BIN_NAME} PRIVATE Qt::Quick)
