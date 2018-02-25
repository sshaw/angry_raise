# coding: utf-8

require "minitest/autorun"
require "angry_raise"
require "i18n"

class TestAngryRaise < Minitest::Test
  MyError = Class.new(StandardError)

  def setup
    I18n.enforce_available_locales = false
  end

  def teardown
    I18n.locale = nil
  end

  def test_raise_works_normally
    message = "ainda está funcionando?"

    e = assert_raises MyError do
      raise MyError, message
    end

    assert_equal message, e.message

    e = assert_raises RuntimeError do
      raise message
    end

    assert_equal message, e.message
  end

  def test_string_one_exclaimation
    e = assert_raises RuntimeError do
      raise! "coisa quebrada"
    end

    assert_equal "coisa quebrada!", e.message
  end

  def test_string_two_exclaimation
    e = assert_raises RuntimeError do
      raise!! "coisa quebrada"
    end

    assert_equal "Coisa quebrada!!", e.message
  end

  def test_string_three_exclaimation
    e = assert_raises RuntimeError do
      raise!!! "coisa quebrada"
    end

    assert_equal "Coisa Quebrada!!!", e.message
  end

  def test_string_four_exclaimation
    e = assert_raises RuntimeError do
      raise!!!! "coisa quebrada"
    end

    assert_equal "COISA QUEBRADA!!!!", e.message
  end

  def test_string_five_exclaimation
    e = assert_raises RuntimeError do
      raise!!!!! "coisa quebrada"
    end

    assert_equal "COISA QUEBRADA!!!!!", e.message
  end

  def test_class_one_exclaimation
    e = assert_raises MyError do
      raise! MyError, "coisa quebrada"
    end

    assert_equal "coisa quebrada!", e.message
  end

  def test_class_two_exclaimation
    e = assert_raises MyError do
      raise!! MyError, "coisa quebrada"
    end

    assert_equal "Coisa quebrada!!", e.message
  end

  def test_class_three_exclaimation
    e = assert_raises MyError do
      raise!!! MyError, "coisa quebrada"
    end

    assert_equal "Coisa Quebrada!!!", e.message
  end

  def test_class_four_exclaimation
    e = assert_raises MyError do
      raise!!!! MyError, "coisa quebrada"
    end

    assert_equal "COISA QUEBRADA!!!!", e.message
  end

  def test_class_five_exclaimation
    e = assert_raises MyError do
      raise!!!!! MyError, "coisa quebrada"
    end

    assert_equal "COISA QUEBRADA!!!!!", e.message
  end

  def test_instance_one_exclaimation
    e = assert_raises MyError do
      raise! MyError.new("coisa quebrada")
    end

    assert_equal "coisa quebrada!", e.message
  end

  def test_instance_two_exclaimation
    e = assert_raises MyError do
      raise!! MyError.new("coisa quebrada")
    end

    assert_equal "Coisa quebrada!!", e.message
  end

  def test_instance_three_exclaimation
    e = assert_raises MyError do
      raise!!! MyError.new("coisa quebrada")
    end

    assert_equal "Coisa Quebrada!!!", e.message
  end

  def test_i18n
    I18n.locale = :es

    e = assert_raises RuntimeError do
      raise!!! "que problema"
    end

    assert_equal "¡¡¡Que Problema!!!", e.message

    I18n.locale = :es_MX

    e = assert_raises RuntimeError do
      raise!!! "pinche error"
    end

    assert_equal "¡¡¡Pinche Error!!!", e.message
  end
end
