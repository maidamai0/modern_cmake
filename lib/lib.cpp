#include "lib.h"

#include <iostream>

void Foo::Do() { std::cout << "calling " << __FUNCTION__ << '\n'; }

void Bar::Do() { std::cout << "calling " << __FUNCTION__ << '\n'; }
