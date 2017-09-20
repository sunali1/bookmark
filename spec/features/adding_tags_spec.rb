feature 'adding tags' do
  scenario 'can add 1 tag to a link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.wikipedia.com/'
    fill_in 'title', with: 'Wikipedia'
    fill_in 'tags', with: 'education'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end
end
