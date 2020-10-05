require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  before do
    @portfolio = FactoryBot.build(:portfolio)
  end
  describe 'portfolioの保存' do
    context 'portfolioが保存できる場合' do
      it 'text,url,title,languageがあれば保存できる' do
        expect(@portfolio).to be_valid
      end
      it 'textは200文字以内であれば保存できる' do
        @portfolio.text = 'a' * 200
        expect(@portfolio).to be_valid
      end
    end
    context 'portfolioが保存できない場合' do
      it 'textが空だと保存できない' do
        @portfolio.text = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが201字以上だと保存できない' do
        @portfolio.text = 'a' * 201
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include('Text is too long (maximum is 200 characters)')
      end
      it 'urlが空だと保存できない' do
        @portfolio.url = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("Url can't be blank")
      end
      it 'titleが空だと保存できない' do
        @portfolio.title = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("Title can't be blank")
      end
      it 'languageが空だと保存できない' do
        @portfolio.language = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("Language can't be blank")
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @portfolio.user = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include('User must exist')
      end
    end
  end
end
