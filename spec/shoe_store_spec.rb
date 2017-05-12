require "spec_helper"

describe Brand do
  it { should have_and_belong_to_many(:stores) }

  it("validates presence of price") do
    test_brand = Brand.create({:name => "kat", :price => ""})
    expect(test_brand.save()).to(eq(false))
  end

  it("validates numericality of price") do
    test_brand = Brand.create({:name => "kat", :price => "kat50.00"})
    expect(test_brand.save()).to(eq(false))
  end

  it("validates presence of name") do
    test_brand = Brand.create({:name => "", :price => "50.00"})
    expect(test_brand.save()).to(eq(false))
  end

  it("ensures the length of description is at most 100 characters") do
    test_brand = Brand.create({:name => "k".*(101)})
    expect(test_brand.save()).to(eq(false))
  end

end

describe Store do
  it { should have_and_belong_to_many(:brands) }
end
