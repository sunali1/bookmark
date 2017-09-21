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
  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end
end
