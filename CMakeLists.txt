
cmake_minimum_required(VERSION 3.16)

project(BetterNotepad VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS
    Quick
    Qml
    QuickControls2
)

qt_standard_project_setup(REQUIRES 6.5)

set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(HEADERS
    "${INCLUDE_DIR}/file.h"
)

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")
set(SOURCES
    "${SRC_DIR}/file.cpp"
    "${SRC_DIR}/main.cpp"
)

qt_add_executable(BetterNotepad
    ${HEADERS}
    ${SOURCES}
)

# Mark Fonts.qml as a QML singleton
set_source_files_properties(
    resources/qml/fonts/Fonts.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(BetterNotepad

    URI BetterNotepad
    VERSION 1.0

    QML_FILES
        resources/qml/components/NotepadMenu.qml
        resources/qml/components/NotepadMenuItem.qml
        resources/qml/components/NotepadMenuSeperator.qml
        resources/qml/components/NotepadToolMenuButton.qml
        resources/qml/fonts/Fonts.qml
        resources/qml/pages/EditorPage.qml
        resources/qml/pages/SettingsPage.qml
        resources/qml/Main.qml

    # RESOURCES
        # img/world.png

)

target_include_directories(BetterNotepad
    PRIVATE
        "${INCLUDE_DIR}"
)

target_link_libraries(BetterNotepad
    PRIVATE
        Qt6::Quick
        Qt6::Qml
        Qt6::QuickControls2
)

message(STATUS "SOURCE DIR: ${CMAKE_SOURCE_DIR}")
message(STATUS "CURRENT SOURCE DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "BINARY DIR: ${CMAKE_BINARY_DIR}")
message(STATUS "CURRENT BINARY DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "")
