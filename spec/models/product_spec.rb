require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "必須項目があれば商品は保存される" do
        expect(@product).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "必須項目がないとツイートは保存できない" do
      end
      it "商品名が空の場合保存できない" do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank") 
      end

      it "商品名が41文字以上の場合保存できない" do
        @product.product_name = 'a * 41'
        @product.valid?
        expect(@product.errors.full_messages).to include() 
      end

      it "商品の説明が空の場合保存できない" do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank") 
      end

      it "商品の説明が1001文字以上の場合保存できない" do
        @product.description = 'a * 1001'
        @product.valid?
        expect(@product.errors.full_messages).to include() 
      end

      it "価格が空の場合保存できない" do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")         
      end

      it "価格がマイナスの場合保存できない" do
        @product.price = '-1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")         
      end    

      it "価格が英語の場合保存できない" do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")         
      end    

      it "価格が300円未満の場合保存できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")         
      end    

      it "価格が9,999,999円越えの場合保存できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")         
      end    

      it "ユーザーが紐付いていないと商品は保存できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

      it "画像がないと商品は保存できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it "カテゴリ-が空の場合と商品は保存できない" do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include()
      end

      it "カテゴリ-が空の場合と商品は保存できない" do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include()
      end

      it "商品の状態が空の場合と商品は保存できない" do
        @product.state_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include()
      end

      it "配送料の負担が空の場合と商品は保存できない" do
        @product.delivery_charge_burden_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include()
      end

      it "発送元の地域が空の場合と商品は保存できない" do
        @product.regional_original_delivery_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include()
      end

      it "発送までの日数が空の場合と商品は保存できない" do
        @product.days_up_to_delivery_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include()
      end

    end
  end
end
