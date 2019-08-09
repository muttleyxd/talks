#include "visit_struct.hpp"

#include <iostream>
#include <string>

struct my_type {
  int a;
  float b;
  std::string c;
};
VISITABLE_STRUCT(my_type, a, b, c);

struct cpp11printer {
  template <typename T>
  void operator()(char const* name, T const& value) {
    std::cout << name << " = " << value << '\n';
  }
};

void cpp11print(my_type const& object) {
  visit_struct::for_each(object, cpp11printer{});
}

void cpp14print(my_type const& object) {
  visit_struct::for_each(object,
    [](char const* name, auto const& value) {
      std::cout << name << " = " << value << '\n';
    });
}

int main()
{
  my_type object{5, 6, "Hello there"};
  cpp11print(object);
  std::cout << "---------\n";
  cpp14print(object);
  return 0;
}