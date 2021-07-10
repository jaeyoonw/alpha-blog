require 'test_helper'

class CategoryTest < ActiveSupport::TestCase 
  def setup 
    @category = Category.new(name: "Sports")
  end 
  
  test "category should be valid" do 
    assert @category.valid?
  end 

  test "name should be present" do 
    @category.name = " "
    assert_not @category.valid? # false 가 나와야 테스트를 통과 
  end 

  test "name sholud be unique" do 
    @category.save  # 이것은 테스트 데이터베이스에 저장된다. 실제 데이터베이스에는 영향x
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid? 
  end 

  test "name should not be too long" do 
    @category.name = "A" * 26
    assert_not @category.valid? 
  end 

  test "name should not be short" do 
    @category.name = "AA"
    assert_not @category.valid? 
  end

end 