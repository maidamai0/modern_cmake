#pragma once

/**
 * @file lib.h
 * @author tonghao.yuan (yuantonghao@gmail.com)
 * @brief
 * @version 0.1
 * @date 2022-11-06
 *
 * Copyright (c) 2022 All Rights Reserved
 *
 */

#include <string>

/**
 * @brief Foo class
 * @details do someting in foo
 *
 */
class Foo {
public:
  Foo() = default;

  /**
   * @brief do function
   *
   */
  virtual void Do();

  /**
   * @brief example function takes multiple parameters and returns integer
   *
   * @param a   parameter a is a int
   * @param b   parameter is a std::string
   * @param c   parameter c is a floating point number
   * @return    some return value of integer type
   */
  int Func(int a, const std::string &b, float c);

private:
  std::string str;
};

class Bar : public Foo {
  /**
   * @brief overloadded functin in Bar class
   *
   */
  void Do() override;
};

/*! Invisible class because of truncation */
class Invisible {};

/*! Truncated class, inheritance relation is hidden */
class Truncated : public Invisible {};

/* Class not documented with doxygen comments */
class Undocumented {};

/*! Class that is inherited using public inheritance */
class PublicBase : public Truncated {};

/*! A template class */
template <class T> class Templ {};

/*! Class that is inherited using protected inheritance */
class ProtectedBase {};

/*! Class that is inherited using private inheritance */
class PrivateBase {};

/*! Class that is used by the Inherited class */
class Used {};

/*! Super class that inherits a number of other classes */
class Inherited : public PublicBase,
                  protected ProtectedBase,
                  private PrivateBase,
                  public Undocumented,
                  public Templ<int> {
private:
  Used *m_usedClass;
};