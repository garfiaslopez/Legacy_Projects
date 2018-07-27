# Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR =  $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/timer.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp) \
                 $$quote($$BASEDIR/src/timer.hpp)
    }
}

simulator {
    CONFIG(debug, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/timer.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp) \
                 $$quote($$BASEDIR/src/timer.hpp)
    }
}

INCLUDEPATH +=  $$quote($$BASEDIR/src)

CONFIG += precompile_header

PRECOMPILED_HEADER =  $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES +=  $$quote($$BASEDIR/../src/*.c) \
             $$quote($$BASEDIR/../src/*.c++) \
             $$quote($$BASEDIR/../src/*.cc) \
             $$quote($$BASEDIR/../src/*.cpp) \
             $$quote($$BASEDIR/../src/*.cxx) \
             $$quote($$BASEDIR/../assets/*.qml) \
             $$quote($$BASEDIR/../assets/*.js) \
             $$quote($$BASEDIR/../assets/*.qs) \
             $$quote($$BASEDIR/../assets/Common/*.qml) \
             $$quote($$BASEDIR/../assets/Common/*.js) \
             $$quote($$BASEDIR/../assets/Common/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Back/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Back/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Back/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Derivadas/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Derivadas/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Derivadas/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Desigualdades/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Desigualdades/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Desigualdades/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Factorizacion/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Factorizacion/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Factorizacion/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Limites/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Limites/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/Limites/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/NumComplex/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/NumComplex/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/NumComplex/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/ValorAbsoluto/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/ValorAbsoluto/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/ValorAbsoluto/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/identidades/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/identidades/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Ecuaciones/identidades/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/CampoElect/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/CampoElect/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/CampoElect/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/CinematicaDinamica/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/CinematicaDinamica/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/CinematicaDinamica/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Electricidad/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Electricidad/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Electricidad/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Hidrodinamica/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Hidrodinamica/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Hidrodinamica/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Hidrostatica/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Hidrostatica/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Hidrostatica/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Optica/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Optica/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Optica/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Termodinamica/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Termodinamica/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Termodinamica/*.qs) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Vectores/*.qml) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Vectores/*.js) \
             $$quote($$BASEDIR/../assets/Imagenes/Fisica/Vectores/*.qs) \
             $$quote($$BASEDIR/../assets/Models/*.qml) \
             $$quote($$BASEDIR/../assets/Models/*.js) \
             $$quote($$BASEDIR/../assets/Models/*.qs) \
             $$quote($$BASEDIR/../assets/Sounds/*.qml) \
             $$quote($$BASEDIR/../assets/Sounds/*.js) \
             $$quote($$BASEDIR/../assets/Sounds/*.qs)

    HEADERS +=  $$quote($$BASEDIR/../src/*.h) \
             $$quote($$BASEDIR/../src/*.h++) \
             $$quote($$BASEDIR/../src/*.hh) \
             $$quote($$BASEDIR/../src/*.hpp) \
             $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS =  $$quote($${TARGET}.ts)
