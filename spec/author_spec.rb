require './lib/author'
require './lib/book'

RSpec.describe Author do
  it 'exists and has attributes' do
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    
    expect(author).to be_a(Author)
    expect(author.name).to eq("Charlotte Bronte")
    expect(author.books).to eq([])
  end

    #can write books

  it 'can write books and store them' do
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    
    jane_eyre = author.write("Jane Eyre", "October 16, 1847")
    villette = author.write("Villette", "1853")

    expect(jane_eyre).to be_a(Book)
    expect(jane_eyre.title).to eq("Jane Eyre")
    expect(villette).to be_a(Book)
    expect(author.books).to eq([jane_eyre, villette])
  end
end