require 'mechanize'
require 'dropbox_sdk'
require 'dotenv'
require 'date'

Dotenv.load

agent = Mechanize.new
sign_in_page = agent.get("https://github.com/login")
sign_in_page.form_with(action: '/session') do |sign_in_form|
  sign_in_form['login'] = ENV.fetch('GITHUB_LOGIN')
  sign_in_form['password'] = ENV.fetch('GITHUB_PASSWORD')
end.submit

organisation = ENV.fetch('GITHUB_ORGANISATION')
payment_history_page = agent.get("https://github.com/organizations/#{organisation}/settings/payments")
latest_receipt_link_html = payment_history_page.at('#payment-history tr.success:first .receipt a')
latest_receipt_link = Mechanize::Page::Link.new(latest_receipt_link_html, agent, payment_history_page)
latest_receipt_file = latest_receipt_link.click

invoice_date = Date.parse(latest_receipt_file.filename[/(\d{4}-\d{2}-\d{2})/, 1])
invoice_filename = "#{invoice_date} GitHub.pdf"

dropbox_client = DropboxClient.new(ENV.fetch('DROPBOX_ACCESS_TOKEN'))
dropbox_client.put_file(invoice_filename, latest_receipt_file.body)
