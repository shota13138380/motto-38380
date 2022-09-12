require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規投稿' do
    context '投稿できるとき' do
      it '必要な情報を適切に入力して「投稿する」ボタンを押すと、アイテム情報がデータベースに保存される' do
        expect(@item).to be_valid
      end

      it '画像がなくても投稿できる' do
        @item.image = nil
        expect(@item).to be_valid
      end
    end

    context '商品情報を登録できないとき' do
      it 'アイテム名が空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'アイテム内容が空では投稿できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it '公開範囲の情報が空では投稿できない' do
        @item.privacy_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Privacy can't be blank")
      end

      it '公開範囲に「---」が選択されている場合は投稿できない' do
        @item.privacy_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Privacy can't be blank")
      end

      it 'userが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
