require 'rails_helper'

RSpec.describe PurchaseRecordForm, type: :model do
  before do
    @purchase_record_form = FactoryBot.build(:purchase_record_form)
  end

  describe "配送先の保存" do
    context "配送先の情報が保存できる時" do
      it "必須項目があれば配送先は保存される" do
        expect(@purchase_record_form).to be_valid
      end
    end
    context "配送先の情報が保存できない時" do
      it "user_idが空だと保存できない" do
        @purchase_record_form.user_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("User can't be blank")  
      end
      it "product_idが空だと保存できない" do
        @purchase_record_form.product_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Product can't be blank")  
      end
      it "郵便番号が空だと保存できない" do
        @purchase_record_form.postal_code = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")  
      end
      it "郵便番号にハイフンがないと保存できない" do
        @purchase_record_form.postal_code = 1111111
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")  
      end
      it "都道府県が「--」だと保存できない" do
        @purchase_record_form.prefecture_id = 1
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Prefecture can't be blank")  
      end
      it "市区町村が空だと保存できない" do
        @purchase_record_form.city = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("City can't be blank")  
      end
      it "番地が空だと保存できない" do
        @purchase_record_form.block = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Block can't be blank")  
      end
      it "電話番号が空だと保存できない" do
        @purchase_record_form.phone_number = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone number can't be blank")  
      end
      it "電話番号にハイフンがあると保存できない" do
        @purchase_record_form.phone_number = "090-1111-2222"
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone number is invalid")  
      end
      it "電話番号が12桁以上だと保存できない" do
        @purchase_record_form.phone_number = "090111122222"
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone number is invalid")  
      end
      it "トークンが空だと保存できない" do
        @purchase_record_form.token = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Token can't be blank")  
      end
    end
    
  end
  
end


