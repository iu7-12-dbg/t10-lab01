#include "customtypesregistrar.h"

CustomTypesRegistrar::CustomTypesRegistrar()
{}

void CustomTypesRegistrar::registerTypes()
{
    qmlRegisterType<Launcher>("com.alex.qmlcomponents", 1, 0, "Launcher");
    qmlRegisterType<FileOperator>("com.alex.qmlcomponents", 1, 0, "FileOperator");
}

