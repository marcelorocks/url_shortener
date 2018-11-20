Given('I am on the home page') do
  visit '/'
end

When('I fill in the url field with {string}') do |original_url|
  page.fill_in 'short_url[original_url]', with: original_url
end

When('I press {string}') do |button_label|
  page.click_button button_label
end

Then('I should see {string} in the modal title') do |content|
  expect(page).to have_css('#modal_title', text: content)
end

When('I follow the url') do
  page.find('.short-url-link').click
end

Then('I should be redirected to {string}') do |destination|
  expect(page.current_url).to eql("#{destination}/")
end

Then("I should see {string} in the modal error container") do |error|
  expect(page).to have_css('#modal_error', text: error)
end
