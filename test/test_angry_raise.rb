require "minitest/autorun"
require "angry_raise"

class TestAngryRaise < Minitest::Test
  MyError = Class.new(StandardError)

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
end
