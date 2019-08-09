#include "visit_struct.hpp"
#include <iostream>

struct big_struct
{
   int value;
   struct t_nested
   {
      int value;
      int second;
   } nested[5];
   int array[2];
   char name[40];
};

VISITABLE_STRUCT(big_struct::t_nested, value, second);
VISITABLE_STRUCT(big_struct, value, nested, array, name);

template <typename T>
void visit(T const& object)
{
  visit_struct::for_each(object, [](char const* name, auto& value)
  {
    using value_type = std::remove_const_t<std::remove_reference_t<decltype(value)>>;

    if constexpr (std::is_array_v<value_type>)
    {
      using array_type = typename std::remove_all_extents<value_type>::type;
      if constexpr (std::is_class_v<array_type>)
      {
        for (auto const& i : value)
        {
          std::cout << name << '\n';
          visit(i);
        }
      }
      else
        std::cout << name << " = " << value << '\n';
    }
    else if constexpr (std::is_same_v<value_type, int>)
      std::cout << name << " = " << value << '\n';
    else if constexpr (std::is_class_v<value_type>)
    {
      std::cout << name << '\n';
      visit(value);
    }
  });
}

int main()
{
  big_struct a { 
    1,
    {{2, 12}, {3, 13}, {4, 14}, {5, 15}, {6, 16}},
    {1024, 2048},
    "Hello There"
  };
  visit(a);
  return 0;
}