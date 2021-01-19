require 'rails_helper'

RSpec.describe Picture, type: :model do
  before do
    @picture = FactoryBot.build(:picture)
  end

  describe '記事登録' do
    context '記事登録がうまくいく時' do
      it '各入力項目が存在すれば登録できる' do
        expect(@picture).to be_valid
      end
    end

    context '記事登録がうまくいかない時' do
      it 'imageが空だと登録ができない' do
        @picture.image = nil
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと登録ができない' do
        @picture.title = ''
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空だと登録ができない' do
        @picture.text = ''
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Text can't be blank")
      end
      it 'genreが0だと登録ができない' do
        @picture.genre_id = 0
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Genre must be other than 0")
      end
      it 'userが紐づいていないと登録できない' do
        @picture.user = nil
        @picture.valid?
        expect(@picture.errors.full_messages).to include('User must exist')
      end
    end
  end
end
