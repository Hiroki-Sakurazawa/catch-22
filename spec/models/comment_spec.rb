require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント登録' do
    context 'コメント登録がうまくいく時' do
      it '入力項目が存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント登録がうまくいかない時' do
      it 'textが空だと登録ができない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'pictureが紐づいていないと登録できない' do
        @comment.picture = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Picture must exist')
      end
    end
  end
end
