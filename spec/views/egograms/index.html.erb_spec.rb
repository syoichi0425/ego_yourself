require 'rails_helper'

RSpec.describe "egograms/index", type: :view do
  describe "index.html.erbのテスト" do
    it "h2タグの中にA-STARが表示されるか" do
    visit users_path
    expect(page).to have_selector("h2", text: "詳細")
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
