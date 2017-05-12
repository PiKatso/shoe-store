require "spec_helper"

describe Brand do
  it { should have_and_belong_to_many(:stores) }

  it { should validate_numericality_of(:price) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  # it("validates presence of price") do
  #   test_brand = Brand.create({:name => "kat", :price => ""})
  #   expect(test_brand.save()).to(eq(false))
  # end

  # it("validates numericality of price") do
  #   test_brand = Brand.create({:name => "kat", :price => "ka5"})
  #   expect(test_brand.save()).to(eq(false))
  # end

  it("validates length of price") do
    test_brand = Brand.create({:name => "kat", :price => "1000"})
    expect(test_brand.save()).to(eq(false))
  end

  # it("validates presence of name") do
  #   test_brand = Brand.create({:name => "", :price => "50"})
  #   expect(test_brand.save()).to(eq(false))
  # end

  it("ensures the length of name is at most 100 characters") do
    test_brand = Brand.create({:name => "k".*(101), :price => "50"})
    expect(test_brand.save()).to(eq(false))
  end

  # it("ensures the uniqueness of Brands created") do
  #   first_brand = Brand.create({:name => "kat", :price => "50"})
  #   second_brand = Brand.create({:name => "kat", :price => "90"})
  #   expect(second_brand.save()).to(eq(false))
  # end

  it("capitalizes input of Brands created") do
    test_brand = Brand.create({:name => "kat", :price => "50"})
    test_brand.save()
    expect(test_brand.name).to(eq('Kat'))
  end

end

describe Store do
  it { should have_and_belong_to_many(:brands) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it("capitalizes input for store name") do
    test_store = Store.create({:name => "puma"})
    test_store.save()
    expect(test_store.name).to(eq('Puma'))
  end

end
