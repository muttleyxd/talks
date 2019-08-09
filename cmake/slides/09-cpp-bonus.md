class: title-slide

# C++ bonus at the end

---

# C++ - _reflection_

--

## Library which allows us to iterate over structs: [cbeck88/visit_struct](https://github.com/cbeck88/visit_struct)

```
struct my_type {
  int a;
  float b;
  std::string c;
};
VISITABLE_STRUCT(my_type, a, b, c);
my_type object{};

visit_struct::for_each(object, [](char const* name, auto& value) {});
```

---

# C++ - _reflection_

## Two ways to iterate over structures

- C++11

```
struct printer {
  template <typename T>
  void operator()(char const* name, T const& value) {
    std::cout << name << " = " << value << '\n';
  }
};

void print(my_type const& object) {
  visit_struct::for_each(object, printer{});
}
```

---

# C++ - _reflection_

## Two ways to iterate over structures

- C++14 and above

```
void print(my_type const& object) {
  visit_struct::for_each(object,
    [](char const* name, auto const& value) {
      std::cout << name << " = " << value << '\n';
    });
}
```

## [https://godbolt.org/z/aDEoUT](https://godbolt.org/z/aDEoUT)

---

# C++ - _reflection_

## Can we disassemble this with one function and parse it to JSON?

```
struct big_struct {
   int value;
   struct t_nested
   {
      int value;
      int second;
   } nested[5];
   char name[40];
};
```

---

# C++ - _reflection_

--

.medium[
```
VISITABLE_STRUCT(big_struct::t_nested, value, second);
VISITABLE_STRUCT(big_struct, value, nested, array, name);

template <typename T>
nlohmann::json visit(T const& object)
{
  nlohmann::json output;
  visit_struct::for_each(object, [&output](const char* name, auto& value)
  {
    using value_type = std::remove_const_t<std::remove_reference_t<decltype(value)>>;

    if constexpr (std::is_array_v<value_type>)
    {
      using array_type = typename std::remove_all_extents<value_type>::type;
      if constexpr (std::is_class_v<array_type>)
        for (auto const &i : value)
          output[name].push_back(visit(i));
      else
        output[name] = value;
    }
    else if constexpr (std::is_same_v<value_type, int>)
      output[name] = value;
    else if constexpr (std::is_class_v<value_type>)
      output[name] = visit(value);
  });
  return output;
}
```
]

## [https://godbolt.org/z/rrM3zn](https://godbolt.org/z/rrM3zn) | [https://godbolt.org/z/14hpqu](https://godbolt.org/z/14hpqu)

---
