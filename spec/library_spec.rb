require './lib/library'
require './lib/author'
require './lib/book'

RSpec.describe Library do
  it 'exists with a name and empty collections' do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_a(Library)
    expect(dpl.name).to eq("Denver Public Library")
    expect(dpl.books).to eq([])
    expect(dpl.authors).to eq([])
  end

  
  it 'can add authors and their books' do
    dpl = Library.new("Denver Public Library")
    charlotte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte.write("The Professor", "1857")
    villette = charlotte.write("Villette", "1853")

    harper = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte)
    dpl.add_author(harper)

    expect(dpl.authors).to eq([charlotte, harper])
    expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
  end
end