#include <concepts>
#include <string>

template <typename T>
concept Addable = requires(T t) { t + t; };

auto add(Addable auto a, Addable auto b) { return a + b; }

int main(int argc, char **argv) {
  const auto a = add(1, 2);
  const auto b = add(1.2, 2.5);
  const auto c = add(std::string("str1"), std::string("str2"));
}