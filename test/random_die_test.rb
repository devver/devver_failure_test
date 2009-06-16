require 'test/unit'
require File.dirname(__FILE__)+'/../adder'
require 'ruby-debug'

class AdderTest < Test::Unit::TestCase
  include Math

  def test_foo
    raise "crash!"
  end

  def test_plus__num_is_zero
    assert_equal 7, Adder.new(0).plus(7)
  end

  def test_missing_method
    #sleep(5) #
    assert Adder.new(0).foobar
  end

  def test_random_die_method
    raise SystemExit.new("testing_shut_down_worker") if rand < 0.5 
    assert_equal 5, Adder.new(5).plus(0)
  end
  
  def test_random_die_method_again
    raise SystemExit.new("testing_shut_down_worker") if rand < 0.5 
    assert_equal 5, Adder.new(5).plus(0)
  end

  def test_plus__other_is_zero
    assert_equal 5, Adder.new(5).plus(0)
  end

  def test_plus__num_is_non_zero
    assert_equal 9, Adder.new(2).plus(7)
  end

  def test_plus__other_is_non_zero
    assert_equal 8, Adder.new(5).plus(3)
  end

  def test_plus__one_and_one
    assert_equal 2, Adder.new(1).plus(1)
  end  
  

  def test_plus__one_and_two
    assert_equal 2, Adder.new(1).plus(2)
  end

  def test_plus__one_and_three
    assert_equal 4, Adder.new(1).plus(3)
  end

  def test_plus__one_and_four
    assert_equal 5, Adder.new(1).plus(4)
  end

  def ftest_plus__random_values
    30.times do 
      x = rand(1000)
      #sleep(0.1)
      y = rand(1000)
      assert_equal x+y, Adder.new(x).plus(y)
    end
  end

  def test_flunk
    x = true
    #x = false
    if(x)
      flunk
    else
      assert true
    end
  end 

  #def test_can_read_other_folder
  #  path = "../611"
  #  if(File.exist?(path))
  #    contents = `ls #{path}`
  #    assert_equal "foo", contents
  #  end
  #  flunk
  #end

end
