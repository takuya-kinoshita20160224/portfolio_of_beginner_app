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
        expect(@portfolio.errors.full_messages).to include("説明欄を入力してください")
      end
      it 'textが201字以上だと保存できない' do
        @portfolio.text = 'a' * 201
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include('説明欄は200文字以内で入力してください')
      end
      it 'urlが空だと保存できない' do
        @portfolio.url = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("URLを入力してください")
      end
      it 'titleが空だと保存できない' do
        @portfolio.title = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("作品タイトルを入力してください")
      end
      it 'languageが空だと保存できない' do
        @portfolio.language = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include("使用言語を入力してください")
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @portfolio.user = nil
        @portfolio.valid?
        expect(@portfolio.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
